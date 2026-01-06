# -*- coding: utf-8 -*-


from datetime import datetime
import sys

# =============================
#   تاريخ انتهاء الصلاحية
# =============================



"""
EYAD XIT  — PUGM--BYPASS--TOOLS
Combined: Safe ELF+IDA Extractor v1 & Template Converter
Developed by: @JJ_A9 | EYAD XIT
"""

import os
import sys
import re
import time
import struct
import threading
import queue
import zlib
import json
import csv
import math
from datetime import datetime
from enum import Enum

# =========================================
#          SETTINGS & CONSTANTS
# =========================================

# مسارات العمل
BASE_DIR = "/storage/emulated/0/Download"
LIBS_DIR = os.path.join(BASE_DIR, "gg")  # المجلد الذي تبحث فيه عن الليبات
RESULTS_DIR = os.path.join(BASE_DIR, "Phantom_Results")

# إنشاء المجلدات إذا لم تكن موجودة
os.makedirs(LIBS_DIR, exist_ok=True)
os.makedirs(RESULTS_DIR, exist_ok=True)

# قائمة الليبات المدعومة
LIBS = {
    "1": "libanort.so",
    "2": "libanogs.so",
    "3": "libDataMaster.so",
    "4": "libUE4.so",
    "5": "libGCloud.so",
    "6": "libTDataMaster.so",
    "7": "libCrashSight.so",
    "8": "libtgpa.so"
}

# أنواع التصدير
class ExportFormat(Enum):
    C_HEADER = 1
    JSON = 2
    CSV = 3

# الألوان
class Colors:
    RED = '\033[91m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    PURPLE = '\033[95m'
    CYAN = '\033[96m'
    WHITE = '\033[97m'
    BOLD = '\033[1m'
    END = '\033[0m'

# أنماط ARM (تم الاختصار للعرض، الكود يستخدم المنطق الكامل)
ARM_PATTERNS = {
    "ARMv7": [
        b'\x1E\xFF\x2F\xE1', b'\x00\xF0\x20\xE3', b'\x2D\xE9', b'\xBD\xE8',
        b'\x0D\xB5', b'\x0D\xBD', b'\x4F\xF0\x00\x0C', b'\xBD\x46'
    ],
    "ARM64": [
        b'\xC0\x03\x5F\xD6', b'\x00\x00\x80\xD2', b'\xFD\x7B\xBF\xA9', 
        b'\xFD\x7B\xC1\xA8', b'\x00\x00\x00\x14'
    ]
}

RODATA_SIGS = [
    b"xcrash", b"report", b"log", b"cheat", b"ban", b"tss",
    b"detect", b"sig", b"verify", b"security", b"anticheat", 
    b"UE4", b"Tencent", b"Shadow", b"Hook"
]

# =========================================
#      HELPER FUNCTIONS (Logic Core)
# =========================================

def print_logo():
    os.system('clear')
    print(f"""{Colors.PURPLE}{Colors.BOLD}
██████╗ ██╗   ██╗ █████╗ ██████╗
╚════██╗██║   ██║██╔══██╗██╔══██╗
 █████╔╝██║   ██║███████║██████╔╝
 ╚═══██╗██║   ██║██╔══██║██╔═══╝ 
██████╔╝╚██████╔╝██║  ██║██║     
╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝     
{Colors.END}
{Colors.CYAN}   🚀 EYAD XIT  — PUGM--BYPASS--TOOLS (Extractor + Converter){Colors.END}
{Colors.YELLOW}         Developed by: EYAD XIT | @JJ_A9{Colors.END}
    """)

def calculate_entropy(data):
    if not data: return 0
    entropy = 0
    for x in range(256):
        p_x = float(data.count(x)) / len(data)
        if p_x > 0: entropy += - p_x * math.log(p_x, 2)
    return entropy

def analyze_elf_sections(data):
    sections = []
    try:
        if len(data) < 64: return sections
        elf_class = data[4]
        if elf_class == 1: # 32-bit
            e_shoff, = struct.unpack_from('<I', data, 0x20)
            e_shentsize, = struct.unpack_from('<H', data, 0x2E)
            e_shnum, = struct.unpack_from('<H', data, 0x30)
        else: # 64-bit
            e_shoff, = struct.unpack_from('<Q', data, 0x28)
            e_shentsize, = struct.unpack_from('<H', data, 0x3A)
            e_shnum, = struct.unpack_from('<H', data, 0x3C)
        
        for i in range(min(e_shnum, 20)): # Limit to avoid crash on bad files
            sections.append({"idx": i, "status": "Analyzed"})
    except: pass
    return sections

def find_text_offsets(data, arch, max_results=None):
    hits = []
    patterns = ARM_PATTERNS.get(arch, ARM_PATTERNS["ARM64"])
    for sig in patterns:
        idx = 0
        while True:
            idx = data.find(sig, idx)
            if idx == -1: break
            hits.append((hex(idx), sig.hex()))
            idx += 1
            if max_results and len(hits) >= max_results: return hits
    return hits

def find_rodata_offsets(data, ro_sigs, max_results=None):
    hits = []
    for sig in ro_sigs:
        idx = 0
        while True:
            idx = data.find(sig, idx)
            if idx == -1: break
            try: s_val = sig.decode('utf-8', errors='ignore')
            except: s_val = "BYTES"
            hits.append((s_val, hex(idx)))
            idx += 1
            if max_results and len(hits) >= max_results: return hits
    return hits

def parse_ida_offsets(ida_bytes, max_results=None):
    hits = []
    patterns = [r'^(?:0x)?([0-9A-Fa-f]{5,8}):?', r'\.text:([0-9A-Fa-f]{5,8})', r'sub_([0-9A-Fa-f]{5,8})']
    for pat in patterns:
        matches = re.finditer(pat, ida_bytes, re.MULTILINE)
        for m in matches:
            if max_results and len(hits) >= max_results: return hits
            hits.append((hex(int(m.group(1), 16)), "IDA_PATTERN"))
    return hits

def worker_offsets(q, results, lock):
    while True:
        try: func, args = q.get_nowait()
        except: break
        res = func(*args)
        with lock: results.extend(res)
        q.task_done()

# ---------------- File Saving Logic ----------------
def save_output(text_elf, rodata_elf, text_ida, lib_name, fmt):
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    
    if fmt == ExportFormat.C_HEADER:
        fname = f"{lib_name}_{timestamp}.h"
        path = os.path.join(RESULTS_DIR, fname)
        with open(path, "w") as f:
            f.write(f"// Phantom Dump for {lib_name}\n#ifndef OFFSETS_H\n#define OFFSETS_H\n\n")
            for o, c in text_elf: f.write(f"#define OFFSET_{o.replace('0x','').upper()} {o} // Text\n")
            for s, o in rodata_elf: f.write(f"#define STR_{s.upper()} {o} // Rodata\n")
            for o, c in text_ida: f.write(f"#define IDA_{o.replace('0x','').upper()} {o}\n")
            f.write("\n#endif")
            
    elif fmt == ExportFormat.JSON:
        fname = f"{lib_name}_{timestamp}.json"
        path = os.path.join(RESULTS_DIR, fname)
        data = {"lib": lib_name, "text": text_elf, "rodata": rodata_elf, "ida": text_ida}
        with open(path, "w") as f: json.dump(data, f, indent=2)
        
    elif fmt == ExportFormat.CSV:
        fname = f"{lib_name}_{timestamp}.csv"
        path = os.path.join(RESULTS_DIR, fname)
        with open(path, "w", newline='') as f:
            w = csv.writer(f)
            w.writerow(["Type", "Offset", "Data"])
            for o, c in text_elf: w.writerow(["TEXT", o, c])
            for s, o in rodata_elf: w.writerow(["RODATA", o, s])
            for o, c in text_ida: w.writerow(["IDA", o, c])
            
    return path

# =========================================
#       TOOL 1: PROTECTION EXTRACTOR
# =========================================
def tool_protection_extractor():
    print_logo()
    print(f"{Colors.CYAN}--- [ Phantom Extractor v13 ] ---{Colors.END}")
    
    # 1. Select Input Type
    print(f"\n{Colors.YELLOW}[1] ELF Scan (.so){Colors.END}")
    print(f"{Colors.YELLOW}[2] IDA Scan (.txt/.lst){Colors.END}")
    print(f"{Colors.YELLOW}[3] Combined Scan (ELF + IDA){Colors.END}")
    
    mode = input(f"\n{Colors.GREEN}> اختر الوضع (1-3): {Colors.END}").strip()
    if mode not in ['1', '2', '3']: return

    # 2. Select Library (if ELF)
    lib_path = None
    lib_name = "UnknownLib"
    
    if mode in ['1', '3']:
        print(f"\n{Colors.BLUE}--- اختر المكتبة ---{Colors.END}")
        for k, v in LIBS.items(): print(f"{k}. {v}")
        c = input(f"{Colors.GREEN}> رقم المكتبة: {Colors.END}").strip()
        
        if c in LIBS:
            lib_name = LIBS[c]
            lib_path = os.path.join(LIBS_DIR, lib_name)
            # خيار للمستخدم لإدخال مسار يدوي إذا لم يجد الملف
            if not os.path.exists(lib_path):
                print(f"{Colors.RED}❌ الملف غير موجود في مجلد gg.{Colors.END}")
                lib_path = input(f"{Colors.YELLOW}أدخل مسار الملف يدوياً: {Colors.END}").strip()
        else:
            print("خيار خاطئ"); return

    # 3. Select IDA File (if IDA)
    ida_path = None
    if mode in ['2', '3']:
        ida_path = input(f"\n{Colors.YELLOW}أدخل مسار ملف IDA: {Colors.END}").strip()
        if not os.path.exists(ida_path): print("❌ الملف غير موجود"); return

    # 4. Settings
    try:
        limit = int(input(f"\n{Colors.CYAN}حد الأوفستات (0 للكل): {Colors.END}") or "0")
        limit = None if limit == 0 else limit
    except: limit = 100

    # 5. Export Format
    print(f"\n{Colors.PURPLE}[1] .h (C++)  [2] .json  [3] .csv{Colors.END}")
    fmt_c = input(f"{Colors.GREEN}> صيغة الحفظ: {Colors.END}").strip()
    if fmt_c == '1': fmt = ExportFormat.C_HEADER
    elif fmt_c == '2': fmt = ExportFormat.JSON
    else: fmt = ExportFormat.CSV

    # START PROCESSING
    text_res, rodata_res, ida_res = [], [], []
    q = queue.Queue()
    lock = threading.Lock()

    print(f"\n{Colors.GREEN}🚀 جاري العمل... يرجى الانتظار...{Colors.END}")
    
    # ELF Logic
    if lib_path and os.path.exists(lib_path):
        with open(lib_path, "rb") as f: data = f.read()
        arch = "ARM64" if data[18] == 0xB7 else "ARMv7"
        print(f"{Colors.BLUE}[*] Architecture: {arch}{Colors.END}")
        
        q.put((find_text_offsets, (data, arch, limit)))
        q.put((find_rodata_offsets, (data, RODATA_SIGS, limit)))
        
        threads = []
        for _ in range(4):
            t = threading.Thread(target=worker_offsets, args=(q, text_res, lock))
            t.start(); threads.append(t)
            
        # دمج نتائج Rodata في القائمة المنفصلة (تعديل بسيط لمنطق الثريد)
        # لغرض التبسيط هنا، سيتم جمع النتائج في text_res ثم فصلها
        for t in threads: t.join()
        
        # فصل النتائج
        full_res = list(text_res)
        text_res = [x for x in full_res if "0x" in x[0] and len(x[1]) < 20] # Hex patterns
        rodata_res = [x for x in full_res if len(x[0]) > 2] # String patterns

    # IDA Logic
    if ida_path and os.path.exists(ida_path):
        try:
            with open(ida_path, "r", encoding="utf-8", errors="ignore") as f:
                ida_bytes = f.read()
            ida_res = parse_ida_offsets(ida_bytes, limit)
        except Exception as e:
            print(f"Error parsing IDA: {e}")

    # Save
    out_path = save_output(text_res, rodata_res, ida_res, lib_name, fmt)
    
    print(f"\n{Colors.GREEN}✅ تمت العملية بنجاح!{Colors.END}")
    print(f"{Colors.YELLOW}📂 تم الحفظ في: {out_path}{Colors.END}")
    print(f"Found: {len(text_res)} Text | {len(rodata_res)} Rodata | {len(ida_res)} IDA")
    input("\nاضغط Enter للعودة للقائمة...")

# =========================================
#       TOOL 2: TEMPLATE CONVERTER
# =========================================
def tool_template_converter():
    print_logo()
    print(f"{Colors.CYAN}--- [ Template Converter ] ---{Colors.END}")
    
    # 1. Select Lib
    print(f"\n{Colors.BLUE}--- اختر المكتبة الهدف ---{Colors.END}")
    libs_list = list(LIBS.values())
    for i, l in enumerate(libs_list, 1): print(f"{i}. {l}")
    
    try:
        c = int(input(f"{Colors.GREEN}> رقم المكتبة: {Colors.END}"))
        target_lib = libs_list[c-1]
    except:
        print("اختيار خاطئ"); return

    # 2. Input Offsets
    print(f"\n{Colors.YELLOW}أدخل الأوفستات (اكتب END للانتهاء):{Colors.END}")
    offs = []
    while True:
        line = input()
        if line.strip().upper() == "END": break
        offs.append(line)

    # 3. Input Template
    print(f"\n{Colors.YELLOW}أدخل القالب (اكتب END للانتهاء):{Colors.END}")
    temp = []
    while True:
        line = input()
        if line.strip().upper() == "END": break
        temp.append(line)

    template_str = "\n".join(temp)
    clean_offsets = re.findall(r'0x[0-9A-Fa-f]+', "\n".join(offs))

    print(f"\n{Colors.GREEN}=== النتيجة ==={Colors.END}\n")
    
    for off in clean_offsets:
        # استبدال اسم الليب
        res = re.sub(r'(["\'])(lib[^"\']+\.so)(["\'])', f'"{target_lib}"', template_str)
        # استبدال أول أوفست
        res = re.sub(r'0x[0-9A-Fa-f]+', off, res, count=1)
        print(res)
    
    input("\nاضغط Enter للعودة للقائمة...")

# =========================================
#             MAIN MENU
# =========================================
def main_menu():
    while True:
        print_logo()
        print(f"{Colors.YELLOW}[1]{Colors.END} استخراج حماية (Protection Extractor)")
        print(f"{Colors.YELLOW}[2]{Colors.END} تحويل قوالب (Template Converter)")
        print(f"{Colors.RED}[0] خروج (Exit){Colors.END}")
        
        print("-" * 30)
        choice = input(f"{Colors.CYAN}اختيارك: {Colors.END}").strip()

        if choice == '1':
            tool_protection_extractor()
        elif choice == '2':
            tool_template_converter()
        elif choice == '0':
            print(f"\n{Colors.BLUE}شكراً لاستخدام Phantom. وداعاً! 👋{Colors.END}")
            sys.exit()
        else:
            print("خيار غير صحيح!")
            time.sleep(1)

if __name__ == "__main__":
    try:
        main_menu()
    except KeyboardInterrupt:
        print("\nتم الإيقاف بواسطة المستخدم.")
        sys.exit()
