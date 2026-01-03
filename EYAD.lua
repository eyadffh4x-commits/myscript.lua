gg.setVisible(false)
gg.toast("✅ تم فتح السكريبت")
print("📣 Telegram: @JJ_A9")
print("🏝 PAID VIP")
print("🤫 GG VIP")
print("Crazy anit ban ⚠️")




local ALLOWED_GG = "com.eyad.com"   


if gg and gg.PACKAGE ~= ALLOWED_GG then
gg.alert(" استخدم جيم جاردن بتعي يحلو 👽 ")
  os.exit()
end

gg.sleep(1000)
gg.alert([[ 
FOR YOU : PAID 💥
--------------------------
UPDATE : V1  GOLD 🪙
--------------------------
  🔹🛸  FIX BAN NO&ROOT  64BIT 🛸🔹
 
  🔹🛸  PUBG   GL   KR   TW  VN 🛸🔹
---------------------------
 SCRIPT BY @JJ_A9 💤
_________________________________________________
 CHANNEL: @VX1X6 🇪🇬
]])




local gg = gg
local os = os
local codes = {

  ["VIP"] = 4 * 86400,
  ["JJ_A9 3"] = 3 * 86400,
  ["Eyadxit-72-3FORVIP"] = 3 * 86400,
  ["Eyadxit-168-QA82"] = 7 * 86400,
  ["PRO VIP 30"] = 30 * 86400,
  ["3DAYS"] = 3 * 86400,
  ["@JJ_A9 VIP "] = 1 * 86400,
  ["1RR"] = 1 * 86400,
  ["EYADH"] = 356 * 86400,
  ["EYAD XIT"] = 1 * 86400,
}

local path = "/storage/emulated/0/Pictures/.b.png" 
local blockPath = "/storage/emulated/0/Pictures/.g.png"

local function saveData(code, timestamp)
  local f = io.open(path, "w")
  if f then
    f:write(code .. "|" .. timestamp)
    f:close()
  end
end


local function loadData()
  local f = io.open(path, "r")
  if f then
    local data = f:read("*a")
    f:close()
    local code, time = data:match("^(.-)|(%d+)$")
    return code, tonumber(time)
  end
  return nil, nil
end


local function blockCode(code)
  local f = io.open(blockPath, "a")
  if f then
    f:write(code .. "\n")
    f:close()
  end
end


local function isCodeBlocked(code)
  local f = io.open(blockPath, "r")
  if not f then return false end
  for line in f:lines() do
    if line == code then
      f:close()
      return true
    end
  end
  f:close()
  return false
end


local function getCode()
  local input = gg.prompt({"🔑 Enter Password"}, nil, {"text"})
  if not input then os.exit() end
  return input[1]
end


local function checkCode()
  local code = getCode()
  local duration = codes[code]
  if not duration then
    gg.alert("🔴 EROR 🔴")
    os.exit()
  end

  if isCodeBlocked(code) then
    gg.alert("✨️ Expired Join Telegram @VX1X6 ✨️")
    os.exit()
  end
  function getExpirationDate()
  local code, startTime = loadData()
  if not code or not startTime then
    return "❌ لا يوجد كود مفعل"
  end

  local duration = codes[code]
  if not duration then
    return "❌ مدة غير معروفة للكود"
  end

  local expireTime = startTime + duration
  local now = os.time()

  if now >= expireTime then
    return "⛔ السكربت منتهي ❌"
  end

  local remaining = expireTime - now
  local days = math.floor(remaining / (24 * 3600))
  local hours = math.floor((remaining % (24 * 3600)) / 3600)
  local minutes = math.floor((remaining % 3600) / 60)

  return string.format(" Expired: %d day %d hour %d minute ", days, hours, minutes)
end

  local savedCode, savedTime = loadData()
  local now = os.time()

  if savedCode then
    local savedDuration = codes[savedCode] or 0
    local expireTime = savedTime + savedDuration

    if now >= expireTime then
      blockCode(savedCode)
      os.remove(path)

      if savedCode == code then
        gg.alert("✨️ Expired Join Telegram @VX1X6 ✨️")
        os.exit()
      else
        checkCode()
        return
      end
    elseif savedCode == code then
      local remaining = expireTime - now
      local hours = math.floor(remaining / 3600)
      local minutes = math.floor((remaining % 3600) / 60)
      gg.toast("✅  Expired you: " .. hours .. " سـاعة و " .. minutes .. " دقيقة")
    else
      gg.alert("انت مستخدم  كود استنا كودك يخلص 🛡")
      os.exit()
    end
  else
    saveData(code, now)
    local msg = duration >= 86400 and (duration / 86400) .. " DAY" or math.floor(duration / 60) .. " دقيقة"
    gg.alert("✅ تم التفعيل بنجاح\n⏳ المدة: " .. msg)
  end
end
checkCode()

function script()
     local menuTitle = "┏⊳ 🛡️ • PUBG  • BYPASS KR \n┣⊳ 💻 • UPDATE • 4.1\n┣⊳ 🇪🇬 • Telegram:- @JJ_A9\n┗⊳ ⏰ • " .. getExpirationDate() .. " 👑"

  local menuprincipal = gg.multiChoice({
    "BYPASS LOGO 🔰",
    "BYPASS LOBBY 🛡 ",
    "BYPASS lSAND  🏝",
    "MAGIC   V2     🎯",
    "ANTENNA ♻️",
    "IPAD 📸",
    "ClEAR RAPORTS LOBBY ☂️",
    "SDK RISK ⚙️",
    "SKINS 🦋",
    "BLACK  SKY 🌌",
    "EXIT 🚪"
  }, nil, menuTitle) 

  if menuprincipal == nil then return end

  if menuprincipal[1] then BYPASS_LOGO() end
  if menuprincipal[2] then BYPASS_LOBBY() end
  if menuprincipal[3] then BYPASS_VV() end
  if menuprincipal[4] then MAGIC_BULLET() end
  if menuprincipal[5] then ANTENNA() end
  if menuprincipal[6] then IPAD() end
  if menuprincipal[7] then AIMBOT() end
  if menuprincipal[8] then SmallCrosshair() end
  if menuprincipal[9] then skins() end
  if menuprincipal[10] then CL() end
  if menuprincipal[11] then
    gg.setVisible(true)
    print("💀 SCRIPT BY @JJ_A9")
    os.exit()
  end
end







function BYPASS_LOGO()
  gg.toast(" Activation Protection ...... ⏳ ")

--اكتب كودك هنا

local ranges = gg.getRangesList("libanogs.so")
if #ranges == 0 then
  gg.alert("🏝  ادخل لعبه")
  os.exit()
end

print("🧠 EYAD: VIP")
print("📣 Telegram: @JJ_A9")
print("🛠️ TELEGRAM CHANNEL: @DO_3K")

local so = ranges[1].start

-- تعريف دالة setvalue

local libue4 = gg.getRangesList("libUE4.so")[1]
if libue4 then
  setvalue(libue4.start + 0x1, 32, "h FF FF FF FF FF FF FF FF")
end


local progress = {
  "□□□□□□□□□□0%", "■□□□□□□□□□10%", "■■□□□□□□□□20%", "■■■□□□□□□□30%", "■■■■□□□□□□40%",
  "■■■■■□□□□□50%", "■■■■■■□□□□60%", "■■■■■■■□□□70%", "■■■■■■■■□□80%", "■■■■■■■■■□90%", "■■■■■■■■■■100%"
}
for _, msg in ipairs(progress) do
  gg.toast(msg)
  gg.sleep(100)
end


function S_Pointer(t_So, t_Offset, _bit)
	local function getRanges()
		local ranges = {}
		local t = gg.getRangesList('^/data/*.so*$')
		for i, v in pairs(t) do
			if v.type:sub(2, 2) == 'w' then
				table.insert(ranges, v)
			end
		end
		return ranges
	end
	local function Get_Address(N_So, Offset, ti_bit)
		local ti = gg.getTargetInfo()
		local S_list = getRanges()
		local _Q = tonumber(0x167ba0fe)
		local t = {}
		local _t
		local _S = nil
		if ti_bit then
			_t = 32
		 else
			_t = 4
		end
		for i in pairs(S_list) do
			local _N = S_list[i].internalName:gsub('^.*/', '')
			if N_So[1] == _N and N_So[2] == S_list[i].state then
				_S = S_list[i]
				break
			end
		end
		if _S then
			t[#t + 1] = {}
			t[#t].address = _S.start + Offset[1]
			t[#t].flags = _t
			if #Offset ~= 1 then
				for i = 2, #Offset do
					local S = gg.getValues(t)
					t = {}
					for _ in pairs(S) do
						if not ti.x64 then
							S[_].value = S[_].value & 0xFFFFFFFF
						end
						t[#t + 1] = {}
						t[#t].address = S[_].value + Offset[i]
						t[#t].flags = _t
					end
				end
			end
			_S = t[#t].address
			print(string.char(231,190,164,58).._Q)
		end
		return _S
	end
	local _A = string.format('0x%X', Get_Address(t_So, t_Offset, _bit))
	return _A
end


local t = {"libanogs.so:bss", "Cb"}
local tt = {0x300}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})

local t = {"libanogs.so:bss", "Cb"}
local tt = {0x3F8}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})

local t = {"libanogs.so:bss", "Cb"}
local tt = {0x430}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})

local t = {"libanogs.so:bss", "Cb"}
local tt = {0x5D8}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})

local t = {"libanogs.so:bss", "Cb"}
local tt = {0x550}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})

local t = {"libanogs.so:bss", "Cb"}
local tt = {0x4CA0}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})

local t = {"libanogs.so:bss", "Cb"}
local tt = {0x5A34}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})

local t = {"libanogs.so:bss", "Cb"}
local tt = {0x5B00}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})

local t = {"libanogs.so:bss", "Cb"}
local tt = {0x9FB0}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})









 
 
 
 gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber(":Java_com_tdatamaster_tdm_TDataMaster_TDMEnableReportLL.", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("hC0035FD6C0035FD6", gg.TYPE_BYTE)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber(":Java_com_tdatamaster_tdm_TDataMaster_TDMPause", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.clearResults()
    
    
-- @JJ_A9 اقوه  مطور مصري     بعد  اخويا يوسف 

  



gg.toast("✔ Done")

		






--  قسم مدفوع


function setvalue(address, flags, value)
  if address == nil then return end
  if flags == nil then return end
  if value == nil then return end

  local refinevalues = {
     { address = address, flags = flags, value = value }
  }
  
  gg.setValues(refinevalues)
end


so=gg.getRangesList('libUE4.so')[1].start
setvalue(so + "0xCA95440", 32, "h 00 00 80 D2 C0 03 5F D6")



so=gg.getRangesList('libTDataMaster.so')[1].start
setvalue(so + " 0x14", 32, "h 00 00 80 D2 C0 03 5F D6")








gg.toast("ANT BAN V4 ✔️")



end

function MAGIC_BULLET()
  gg.alert(" MAGIC BULLET 🪽 ")
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("-88.66608428955;26:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("26", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(2)
  gg.editAll("-160", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("-88.73961639404;28:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(2)
  gg.editAll("-260", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("9.201618;30.5;25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("450", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_BSS)
  gg.searchNumber("2048D;1F", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("0.07", gg.TYPE_FLOAT)
  gg.clearResults()

gg.toast("✅ MAGIC ACTIVATED")
    end

function ANTENNA()
    gg.toast("🛠️ Tuning Antenna  ...")
    gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("88.50576019287F;87.27782440186F;-100.91194152832F;1F::13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("88.50576019287F;87.27782440186F;1F", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(6)
gg.editAll("1.96875;1.96875;999;1.96875;1.96875;999", gg.TYPE_FLOAT)
gg.clearResults()
   os.remove("/mnt/shell/0/emulated/Android/data/com.pubg.krmobile/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.pubg.krmobile/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.tmgp.pubgmhd/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.tmgp.pubgmhd/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.tmgp.pubgmhd/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.tmgp.pubgmhd/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.tmgp.pubgmhd/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.vng.pubgmobile/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.vng.pubgmobile/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.ig/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.ig/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.igce/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.igce/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.igce/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.igce/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.igce/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.iglite/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.iglite/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.iglite/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.iglite/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.iglite/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
  gg.sleep(500)
end


-- دالة مساعدة لعرض رسائل (بديل PS)


-- دالة IPAD
function IPAD()
function S_Pointer(t_So, t_Offset, _bit)
	local function getRanges()
		local ranges = {}
		local t = gg.getRangesList('^/data/*.so*$')
		for i, v in pairs(t) do
			if v.type:sub(2, 2) == 'w' then
				table.insert(ranges, v)
			end
		end
		return ranges
	end
	local function Get_Address(N_So, Offset, ti_bit)
		local ti = gg.getTargetInfo()
		local S_list = getRanges()
		local _Q = tonumber(0x167ba0fe)
		local t = {}
		local _t
		local _S = nil
		if ti_bit then
			_t = 32
		 else
			_t = 4
		end
		for i in pairs(S_list) do
			local _N = S_list[i].internalName:gsub('^.*/', '')
			if N_So[1] == _N and N_So[2] == S_list[i].state then
				_S = S_list[i]
				break
			end
		end
		if _S then
			t[#t + 1] = {}
			t[#t].address = _S.start + Offset[1]
			t[#t].flags = _t
			if #Offset ~= 1 then
				for i = 2, #Offset do
					local S = gg.getValues(t)
					t = {}
					for _ in pairs(S) do
						if not ti.x64 then
							S[_].value = S[_].value & 0xFFFFFFFF
						end
						t[#t + 1] = {}
						t[#t].address = S[_].value + Offset[i]
						t[#t].flags = _t
					end
				end
			end
			_S = t[#t].address
			print(string.char(231,190,164,58).._Q)
		end
		return _S
	end
	local _A = string.format('0x%X', Get_Address(t_So, t_Offset, _bit))
	return _A
end


local t = {"libanogs.so:bss", "Cb"}
local tt = {0x300}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})

local t = {"libanogs.so:bss", "Cb"}
local tt = {0x3F8}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})

local t = {"libanogs.so:bss", "Cb"}
local tt = {0x430}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})

local t = {"libanogs.so:bss", "Cb"}
local tt = {0x5D8}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})

local t = {"libanogs.so:bss", "Cb"}
local tt = {0x550}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})

local t = {"libanogs.so:bss", "Cb"}
local tt = {0x4CA0}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 4096, freeze = true}})
gg.setRanges(gg.REGION_ANONYMOUS)
gg.clearResults()
gg.searchNumber('220;178;15 ', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber('220', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(300)
gg.editAll('480', gg.TYPE_FLOAT)
gg.clearResults()
end
function AIMBOT()
gg.toast("🛠️ Clear reports lobby ...")


function setvalue(address, flags, value)
  if address == nil then return end
  if flags == nil then return end
  if value == nil then return end

  local refinevalues = {
     { address = address, flags = flags, value = value }
  }
  
  gg.setValues(refinevalues)
end
so = gg.getRangesList('libgcloud.so')[1].start


setvalue(so + 0x8C840, 4, "00 00 00 00 00")
setvalue(so + 0x93B20, 4, "00 00 00 00 00")
setvalue(so + 0x94048, 4, "00 00 00 00 00")
setvalue(so + 0x9411A, 4, "00 00 00 00 00")
setvalue(so + 0x12A81C, 4, "00 00 00 00 00")
setvalue(so + 0x12A8B0, 4, "00 00 00 00 00")


    os.execute("rm -rf /data/data/com.pubg.krmobile/databases")
    os.execute("rm -rf /data/data/com.pubg.krmobile/cache")
    os.execute("rm -rf /data/data/com.pubg.krmobile/app_crashKit")
    os.execute("rm -rf /data/data/com.pubg.krmobile/app_webview")
    os.execute("rm -rf /storage/emulated/0/Android/data/com.pubg.krmobile/cache*")
    os.execute("rm -rf /storage/emulated/0/Android/data/com.pubg.krmobile/files/cacheFile.txt")
    os.execute("rm -rf /storage/emulated/0/Android/data/com.pubg.krmobile/files/login-identifier.txt")
    os.execute("rm -rf /storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Avatar*")
    os.execute("rm -rf /storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Collision_Detection")
    os.execute("rm -rf /storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Demos/UserReplay*")
    os.execute("rm -rf /storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/ImageDownload*")
    os.execute("rm -rf /storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/ImageDownloadMgr")
    os.execute("rm -rf /storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs*")
    os.execute("rm -rf /storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/MMKV*")
    os.execute("rm -rf /storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/RoleInfo*")
    os.execute("rm -rf /storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
    os.execute("rm -rf /storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/StatEventReportedFlag")
    os.execute("adb shell am compat disable BLOCK_UNTRUSTED_TOUCHES com.pubg.krmobile")


local antiCrash = false

    gg.toast("✅ Clear reports  Activated")
end
-- دالة BYPASS_LOBBY
function BYPASS_LOBBY()
    gg.alert("Bypass Lobby Running...")
    
    
--[[ return: { -- table(39bdcf0)
	[3] = true,
} ]]
gg.getTargetInfo()
gg.getRangesList("^/data/*.so*$")
gg.addListItems({ -- table(b0e91fa)
	[1] = { -- table(70a83ab)
		['address'] = '0x70DE7DDCF0',
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = 4096,
	},
})
gg.getTargetInfo()
gg.getRangesList("^/data/*.so*$")
gg.addListItems({ -- table(60c4add)
	[1] = { -- table(5f96652)
		['address'] = '0x70DE7DDD6C',
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = 4096,
	},
})
gg.getTargetInfo()
gg.getRangesList("^/data/*.so*$")
gg.addListItems({ -- table(5dc5538)
	[1] = { -- table(2178911)
		['address'] = '0x70DE7DDCEC',
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = 4096,
	},
})
gg.getTargetInfo()
gg.getRangesList("^/data/*.so*$")
gg.addListItems({ -- table(6b98877)
	[1] = { -- table(79d8ce4)
		['address'] = '0x70DE7DDCBC',
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = 4096,
	},
})
gg.getTargetInfo()
gg.getRangesList("^/data/*.so*$")
gg.addListItems({ -- table(a840802)
	[1] = { -- table(8343513)
		['address'] = '0x70DE7DDCB8',
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = 4096,
	},
})
gg.getTargetInfo()
gg.getRangesList("^/data/*.so*$")
gg.addListItems({ -- table(5394949)
	[1] = { -- table(52ea24e)
		['address'] = '0x70DE7DDCB4',
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = 4096,
	},
})
gg.getTargetInfo()
gg.getRangesList("^/data/*.so*$")
gg.addListItems({ -- table(2fb947c)
	[1] = { -- table(443105)
		['address'] = '0x70DE7DDCB0',
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = 4096,
	},
})
gg.getTargetInfo()
gg.getRangesList("^/data/*.so*$")
gg.addListItems({ -- table(47b338b)
	[1] = { -- table(aab7c68)
		['address'] = '0x70DE7DDCAC',
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = 4096,
	},
})
gg.getTargetInfo()
gg.getRangesList("^/data/*.so*$")
gg.addListItems({ -- table(6d8ad26)
	[1] = { -- table(677d67)
		['address'] = '0x70DE7DDCA8',
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = 4096,
	},
})
gg.getTargetInfo()
gg.getRangesList("^/data/*.so*$")
gg.addListItems({ -- table(8ec7bbd)
	[1] = { -- table(b9275b2)
		['address'] = '0x70DE7DDCA4',
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = 4096,
	},
})
gg.toast("تم تفعيل ال لوبي")
    
    
    
    
function setvalue(address, flags, value)
  if address == nil then return end
  if flags == nil then return end
  if value == nil then return end

  local refinevalues = {
     { address = address, flags = flags, value = value }
  }
  
  gg.setValues(refinevalues)
end
so = gg.getRangesList('libanogs.so')[1].start

setvalue(so + 0x19CD0, 4, "00 00 00 00 00")
setvalue(so + 0x7D33CEC330, 4, "00 00 00 00 00")
setvalue(so + 0x65330, 4, "00 00 00 00 00")
setvalue(so + 0x19CC8, 4, "00 00 00 00 00")
setvalue(so + 0x7D33CEC338, 4, "00 00 00 00 00")
setvalue(so + 0x65338, 4, "00 00 00 00 00")
setvalue(so + 0x19CC0, 4, "00 00 00 00 00")
setvalue(so + 0x7D33CEC340, 4, "00 00 00 00 00")
setvalue(so + 0x65340, 4, "00 00 00 00 00")
setvalue(so + 0x19CB8, 4, "00 00 00 00 00")
setvalue(so + 0x7D33CEC348, 4, "00 00 00 00 00")
setvalue(so + 0x65348, 4, "00 00 00 00 00")
setvalue(so + 0x19CB0, 4, "00 00 00 00 00")
setvalue(so + 0x7D33CEC350, 4, "00 00 00 00 00")
setvalue(so + 0x65350, 4, "00 00 00 00 00")
setvalue(so + 0x19CA8, 4, "00 00 00 00 00")
setvalue(so + 0x7D33CEC358, 4, "00 00 00 00 00")
setvalue(so + 0x65358, 4, "00 00 00 00 00")
setvalue(so + 0x19CA0, 4, "00 00 00 00 00")
setvalue(so + 0x7D33CEC360, 4, "00 00 00 00 00")
setvalue(so + 0x65360, 4, "00 00 00 00 00")
setvalue(so + 0x19C98, 4, "00 00 00 00 00")
setvalue(so + 0x7D33CEC368, 4, "00 00 00 00 00")
setvalue(so + 0x65368, 4, "00 00 00 00 00")
setvalue(so + 0x19C90, 4, "00 00 00 00 00")
setvalue(so + 0x7D33CEC370, 4, "00 00 00 00 00")
setvalue(so + 0x65370, 4, "00 00 00 00 00")
setvalue(so + 0x19C88, 4, "00 00 00 00 00")
setvalue(so + 0x7D33CEC378, 4, "00 00 00 00 00")
setvalue(so + 0x65378, 4, "00 00 00 00 00")
setvalue(so + 0x5D6CD8, 4, "00 00 00 00 00")
setvalue(so + 0x7D336A5328, 4, "00 00 00 00 00")
setvalue(so + 0x65328, 4, "00 00 00 00 00")
setvalue(so + 0x5D6CD0, 4, "00 00 00 00 00")
setvalue(so + 0x7D336A5330, 4, "00 00 00 00 00")
setvalue(so + 0x65330, 4, "00 00 00 00 00")
setvalue(so + 0x5D6CC8, 4, "00 00 00 00 00")
setvalue(so + 0x7D336A5338, 4, "00 00 00 00 00")
setvalue(so + 0x65338, 4, "00 00 00 00 00")
setvalue(so + 0x5D6CB8, 4, "00 00 00 00 00")
setvalue(so + 0x7D336A5348, 4, "00 00 00 00 00")
setvalue(so + 0x65348, 4, "00 00 00 00 00")
setvalue(so + 0x5D6CB0, 4, "00 00 00 00 00")
setvalue(so + 0x7D336A5350, 4, "00 00 00 00 00")
setvalue(so + 0x65350, 4, "00 00 00 00 00")
setvalue(so + 0x5D6CA0, 4, "00 00 00 00 00")
setvalue(so + 0x7D336A5360, 4, "00 00 00 00 00")


setvalue(so + 0x37AB7C, 4, "00 00 00 00 00")
setvalue(so + 0x37ADFC, 4, "00 00 00 00 00")
setvalue(so + 0x37B2FC, 4, "00 00 00 00 00")
setvalue(so + 0x37B4E0, 4, "00 00 00 00 00")
setvalue(so + 0x37B8F0, 4, "00 00 00 00 00")
setvalue(so + 0x37BC4C, 4, "00 00 00 00 00")
setvalue(so + 0x37C18C, 4, "00 00 00 00 00")
setvalue(so + 0x37C2B8, 4, "00 00 00 00 00")
setvalue(so + 0x37C58C, 4, "00 00 00 00 00")
setvalue(so + 0x37C904, 4, "00 00 00 00 00")
setvalue(so + 0x37CBB4, 4, "00 00 00 00 00")
setvalue(so + 0x37D384, 4, "00 00 00 00 00")
setvalue(so + 0x37D9B8, 4, "00 00 00 00 00")
setvalue(so + 0x37DC28, 4, "00 00 00 00 00")
setvalue(so + 0x37DF9C, 4, "00 00 00 00 00")
setvalue(so + 0x387504, 4, "00 00 00 00 00")
setvalue(so + 0x387A3C, 4, "00 00 00 00 00")
setvalue(so+ 0x42DC24, 4, "00 00 00 00 00")
setvalue(so+ 0x3315A0, 4, "00 00 00 00 00")
setvalue(so+ 0x6004778, 4, "00 00 00 00 00")
setvalue(so+ 0x0e428fa8, 4, "00 00 00 00 00")
    end
-- دالة عمل باتش على الاوفستات
function patch_offset(lib, offset, words)
    local ranges = gg.getRangesList(lib)
    if #ranges == 0 then
        gg.toast("Library not found: " .. lib)
        return
    end
    local base = ranges[1].start
    local addr = base + offset

    for i, word in ipairs(words) do
        local values = {
            {address = addr, flags = gg.TYPE_BYTE, value = 0} 
        }
        gg.setValues(values)
    end
end

-- دالة السكربت الرئيسي
function main_script()
    gg.alert("Starting Anti-Detection Patch")

    local libName = "libanogs.so"
    local offsets = {0x26E178, 0x29EA30}

    local block_words = {
        "egl", "ro.boot.", "orange.", "unlocked.", "SHA-256",
        "/dev/", "/sys/", "/data/", "/sdcard/"
    }

    for i, offset in ipairs(offsets) do
        patch_offset(libName, offset, block_words)
    end

    gg.toast("Patching Done!")
end  -- <-

    

function SmallCrosshair()

  local choice = gg.alert("RISK SDK ⚠️", "Magic Bullet 💥", "SmallCrosshair 🔮", "No recoil🌐")

    if choice == 1 then
            gg.alert("Magic Bullet ✔")
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber("-2.92050004005;-86.45761108398;-88.66608428955;16;26::17", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
        gg.searchNumber("26", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
        gg.getResults(2)
        gg.editAll("-860", gg.TYPE_FLOAT)
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber("0.15122038126;90.48510742188;-88.73961639404;18;28::17", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
        gg.searchNumber("18;28::5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
        gg.getResults(2)
        gg.editAll("-960", gg.TYPE_FLOAT)
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber("9.20161819458;23;25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
        gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
        gg.getResults(10)
        gg.editAll("250", gg.TYPE_FLOAT)
        gg.clearResults()
        end


    if choice == 2 then
        gg.alert("SmallCrosshair ✔")
 if gg.getRangesList("libUE4.so")[1] then
	local t = {}
	t[1] = gg.getRangesList("libUE4.so")[1]["start"] + 0x6711FC8;
	gg.setValues({ 
		[1] = { 
			address = t[1],
			flags = 16,
			value = 8.479635254434225E-21, 
		}, 
	}) 
	gg.toast("DON")
end 
        gg.toast("SmallCrosshair ✅")
    end

    if choice == 3 then
        gg.alert("No recoil✔")
function S_Pointer(t_So, t_Offset, _bit)
	local function getRanges()
		local ranges = {}
		local t = gg.getRangesList('^/data/*.so*$')
		for i, v in pairs(t) do
			if v.type:sub(2, 2) == 'w' then
				table.insert(ranges, v)
			end
		end
		return ranges
	end
	local function Get_Address(N_So, Offset, ti_bit)
		local ti = gg.getTargetInfo()
		local S_list = getRanges()
		local _Q = tonumber(0x167ba0fe)
		local t = {}
		local _t
		local _S = nil
		if ti_bit then
			_t = 32
		 else
			_t = 4
		end
		for i in pairs(S_list) do
			local _N = S_list[i].internalName:gsub('^.*/', '')
			if N_So[1] == _N and N_So[2] == S_list[i].state then
				_S = S_list[i]
				break
			end
		end
		if _S then
			t[#t + 1] = {}
			t[#t].address = _S.start + Offset[1]
			t[#t].flags = _t
			if #Offset ~= 1 then
				for i = 2, #Offset do
					local S = gg.getValues(t)
					t = {}
					for _ in pairs(S) do
						if not ti.x64 then
							S[_].value = S[_].value & 0xFFFFFFFF
						end
						t[#t + 1] = {}
						t[#t].address = S[_].value + Offset[i]
						t[#t].flags = _t
					end
				end
			end
			_S = t[#t].address
			print(string.char(231,190,164,58).._Q)
		end
		return _S
	end
	local _A = string.format('0x%X', Get_Address(t_So, t_Offset, _bit))
	return _A
end



local t = {"libUE4.so:bss", "Cb"}
local tt = {0x563370,0x30,0x460,0x29D0,0x84}
local ttt = S_Pointer(t, tt, true)
gg.setValues({{address = ttt, flags = 16, value = -1}}) -- Sets the value to -1


local t = {"libanogs.so", "Cd"}
local tt = {0x42DD0}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 6, freeze = true}}) -- Add/set value to 6 and freeze it

local t = {"libanogs.so", "Cd"}
local tt = {0x42D48}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 0, freeze = true}}) -- Add/set value to 0 and freeze it

local t = {"libanogs.so:bss", "Cb"}
local tt = {0x5A4}
local ttt = S_Pointer(t, tt, true)
gg.addListItems({{address = ttt, flags = 4, value = 5, freeze = true}}) -- Add/set value to 5 and freeze it
        gg.toast("No recoil ✅")
        
    end
end


--@JJ_A9



function BYPASS_VV()
    local choice = gg.alert("ON BYPASS GAME ⚠️", "[رجوع]", "[ON BYPASS 🏝 ]", "[OF BYPASS 🌐 ]")

    if choice == 2 then
        gg.alert("ISLAND BYPASS ON ✔")
        function setvalue(address, flags, value)
  if address == nil then return end
  if flags == nil then return end
  if value == nil then return end

  local refinevalues = {
     { address = address, flags = flags, value = value }
  }
  
  gg.setValues(refinevalues)
end



so = gg.getRangesList('libgcloud.so')[1].start
setvalue(so + 0x437AD8, 32, 'h 00 00 80 D2 C0 03 5F')

so = gg.getRangesList('libgcloud.so')[1].start
setvalue(so + 0xD65F03C0, 32, 'h 00 00 80 D2 C0 03 5F')

so = gg.getRangesList('libgcloud.so')[1].start
setvalue(so + 0x4B60A8, 32, 'h 00 00 80 D2 C0 03 5F')

so = gg.getRangesList('libgcloud.so')[1].start
setvalue(so + 0xD65F03C0, 32, 'h 00 00 80 D2 C0 03 5F')

so = gg.getRangesList('libgcloud.so')[1].start
setvalue(so + 0x4B6C44, 32, 'h 00 00 80 D2 C0 03 5F')

so = gg.getRangesList('libgcloud.so')[1].start
setvalue(so + 0xD65F03C0, 32, 'h 00 00 80 D2 C0 03 5F')

so = gg.getRangesList('libgcloud.so')[1].start
setvalue(so + 0x438674, 32, 'h 00 00 80 D2 C0 03 5F')

so = gg.getRangesList('libgcloud.so')[1].start
setvalue(so + 0xD65F03C0, 32, 'h 00 00 80 D2 C0 03 5F')



   local so = gg.getRangesList('libgcloud.so')[1].start
gg.getRangesList("libgcloud.so")
gg.addListItems({ -- table(2aa0f44)
	[1] = { -- table(5a7682d)
		['address'] = 0x7a07bc0ad8,
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = -698416192,
	},
})
gg.getRangesList("libgcloud.so")
gg.addListItems({ -- table(aae2f3)
	[1] = { -- table(4dadbb0)
		['address'] = 0x7a07bc1674,
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = -698416192,
	},
})
gg.getRangesList("libgcloud.so")
gg.addListItems({ -- table(f2811ae)
	[1] = { -- table(406bb4f)
		['address'] = 0x7a07c3f0a8,
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = -698416192,
	},
})
gg.getRangesList("libgcloud.so")
gg.addListItems({ -- table(d4a6fe5)
	[1] = { -- table(6e79aba)
		['address'] = 0x7a07c3fc44,
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = -698416192,
	},
})
gg.toast("🌴 Island Mode Enabled")
end
so=gg.getRangesList("libUE4.so")[1].start
py=124291632
setvalue(so+py,4,-698416192)
        gg.toast("ISLAND DONE ✅")
    end

    if choice == 3 then
        gg.alert("ISLAND BYPASS OFF ✖")
    gg.getRangesList("libgcloud.so")
gg.addListItems({ -- table(c85178e)
	[1] = { -- table(7ac7baf)
		['address'] = 0x7a07bc0ad8,
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = 1033081774,
	},
})
gg.getRangesList("libgcloud.so")
gg.addListItems({ -- table(ec01745)
	[1] = { -- table(33f1e9a)
		['address'] = 0x7a07bc1674,
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = 16843522,
	},
})
gg.getRangesList("libgcloud.so")
gg.addListItems({ -- table(29c47a8)
	[1] = { -- table(e4fe2c1)
		['address'] = 0x7a07c3f0a8,
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = 1033081774,
	},
})
gg.getRangesList("libgcloud.so")
gg.addListItems({ -- table(12a31a7)
	[1] = { -- table(8423654)
		['address'] = 0x7a07c3fc44,
		['flags'] = 4, -- gg.TYPE_DWORD
		['freeze'] = true,
		['value'] = 16843522,
	},
})
gg.toast("🌑 Island Mode Disabled")
    end



function skins()
local choice = gg.alert("Mummy set", "[رجوع]", "[Mummy set]", "[Weapon AK & M4 & UP & Bag ]")

    if choice == 2 then
        gg.alert("Mummy set ✔")
--[[ return: { -- table(4f2c35d)
	[3] = true,
} ]]
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("403003", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 6 ]]
gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 6 ]]
gg.editAll("1400687", gg.TYPE_DWORD)
gg.toast("Done ☑️")
        gg.toast("Mummy  DONE ✅")
    end

    if choice == 3 then
        gg.alert("Weapon Skins all game ✔ ")
--[[ return: { -- table(9f544ba)
	[1] = true,
} ]]
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("501001", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 179 ]]
gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 179 ]]
gg.editAll("1501001174", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("501002", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 833 ]]
gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 833 ]]
gg.editAll("1501002174", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("501003", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 25 ]]
gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 25 ]]
gg.editAll("1501003174", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("501004", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 30 ]]
gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 30 ]]
gg.editAll("1501001174", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("501005", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 13 ]]
gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 13 ]]
gg.editAll("1501002174", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("501006", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 20 ]]
gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 20 ]]
gg.editAll("1501003174", gg.TYPE_DWORD)
gg.clearResults()
gg.toast("شنطه فرعون ")
gg.setVisible(false)
gg.clearResults()

--[[ return: { -- table(633e60a)
	[1] = true,
} ]]
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("10100400", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 323 ]]
gg.searchNumber("10100400", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 323 ]]
gg.getResults(9999, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 323 ]]
gg.editAll("1101004046", gg.TYPE_DWORD)
gg.clearResults()
gg.searchNumber("10100400", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 0 ]]
gg.getResults(9999, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 0 ]]
gg.editAll("1101004046", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("20300800", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 6 ]]
gg.getResults(9999, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 6 ]]
gg.editAll("1,010,040,462", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("20500200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 1 ]]
gg.getResults(9999, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 1 ]]
gg.editAll("1,010,040463", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("20500500", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 2 ]]
gg.processResume()
gg.getResults(9999, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 2 ]]
gg.editAll("1,010,040463", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("29100400", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 4 ]]
gg.getResults(9999, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 4 ]]
gg.editAll("1010040461", gg.TYPE_DWORD)
gg.clearResults()
gg.toast("Done ☑️")

--[[ return: { -- table(1d03d2c)
	[3] = true,
} ]]
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("10100100", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 412 ]]
gg.searchNumber("10100100", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 412 ]]
gg.getResults(9999, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 412 ]]
gg.editAll("1101001089", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("29100100", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--[[ found: 2 ]]
gg.getResults(9999, nil, nil, nil, nil, nil, nil, nil, nil)
--[[ count: 2 ]]
gg.editAll("1010010891", gg.TYPE_DWORD)
gg.clearResults()
gg.toast("Done")

--[[ return: { -- table(c32fa71)
	[7] = true,
} ]]
gg.clearResults()
gg.searchNumber("10200200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
--[[ found: 271 ]]
gg.searchNumber("10200200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
--[[ found: 271 ]]
gg.getResults(9999)
--[[ count: 271 ]]
gg.editAll("1102002090", gg.TYPE_DWORD)
gg.searchNumber("10200200 ", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
--[[ found: 0 ]]
gg.searchNumber("10200200 ", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
--[[ found: 0 ]]
gg.getResults(9999)
--[[ count: 0 ]]
gg.editAll("1102002090", gg.TYPE_DWORD)
gg.toast("DONE")
        gg.toast("Weapon Skins all game ✅ ")
        
    end
end




function CL()


gg.toast(" BLACK  SKY 🌌" )
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("3.4028235e38;0.05000000075::5", gg.TYPE_FLOAT, false)
  gg.searchNumber("0.05000000075", gg.TYPE_FLOAT, false)
  gg.getResults(30)
  gg.editAll("100", gg.TYPE_FLOAT)
gg.toast(" BLACK  SKY 🛸" )


end

-- الحلقة الرئيسية
while true do
  if gg.isVisible() then
    gg.setVisible(false)
    script()
  end
end