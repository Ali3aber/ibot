local function modadd(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
   if not lang then
        return '*#》Ƴσυ αяє ησт вσт αɗмιη 🚷*\n*〰〰〰〰〰〰〰〰*\n💠 `Run this command only for Admins and deputies is`'
else
     return '#》 `شما` #مدیر `گروه نیستید` 🚷\n*〰〰〰〰〰〰〰〰*\n💠 اجرای این دستور فقط برای مدیران و معاونان است.'
    end
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
if not lang then
   return '#》 *Ɠяσυρ ιѕ αƖяєαɗу αɗɗєɗ* ‼️\n*〰〰〰〰〰〰〰〰*\n💠 `The robot is already in the group, the robot was is no longer need to do not`'
else
return '#》 `ربات در` #لیست `گروه ربات از قبل بود` ‼️\n*〰〰〰〰〰〰〰〰*\n💠 ربات از قبل در لیست گروه های ربات بود است دیگر نیازی به این‌کار نیست.'
  end
end
        -- create data array in moderation.json
      data[tostring(msg.to.id)] = {
			owners = {},
			mods ={},
			banned ={},
			is_silent_users ={},
			filterlist ={},
			whitelist ={},
			settings = {
				set_name = msg.to.title,
				lock_link = 'yes',
				lock_tag = 'no',
				lock_username = 'yes',
				lock_spam = 'yes',
				lock_webpage = 'yes',
				lock_mention = 'no',
				lock_markdown = 'no',
				lock_flood = 'yes',
				lock_bots = 'yes',
				lock_pin = 'no',
				welcome = 'no',
				lock_join = 'no',
				lock_edit = 'no',
				lock_arabic = 'no',
				lock_english = 'no',
				lock_all = 'no',
				num_msg_max = '50',
				set_char = '1000',
				time_check = '2',
				},
   mutes = {
                  mute_video_self = 'yes',
                  mute_forward = 'yes',
                  mute_audio = 'no',
                  mute_video = 'no',
                  mute_contact = 'warn',
                  mute_text = 'no',
                  mute_photo = 'no',
                  mute_gif = 'no',
                  mute_location = 'warn',
                  mute_document = 'no',
                  mute_sticker = 'no',
                  mute_voice = 'no',
				  mute_all = 'no',
				  mute_keyboard = 'warn',
				  mute_game = 'no',
				  mute_inline = 'warn',
				  mute_tgservice = 'no',
          }
      }
  save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
    if not lang then
  return '#》 *Ɠяσυρ нαѕ вєєη αɗɗєɗ* ✅🤖\n\n*Ɠяσυρ Ɲαмє :*'..msg.to.title..'\n*OяɗєяƁу :* [@'..check_markdown(msg.from.username or '')..'*|*`'..msg.from.id..'`]\n*〰〰〰〰〰〰〰〰*\n💠 `Group now to list the groups the robot was added`\n\n*Ɠяσυρ cнαяgєɗ 3 мιηυтєѕ  fσя ѕєттιηgѕ.*'
else
  return '#》 `گروه به` #لیست `گروه ربات اضافه شده` ✅🤖\n\n*اسم گروه :*'..msg.to.title..'\n*توسط :* [@'..check_markdown(msg.from.username or '')..'*|*`'..msg.from.id..'`]\n*〰〰〰〰〰〰〰〰*\n💠 گروه هم اکنون به لیست گروه ربات اضافه شد.\n\n_گروه به مدت_ *3* _دقیقه برای اجرای تنظیمات شارژ می‌باشد._'
end
end
local function modrem(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
    local data = load_data(_config.moderation.data)
    local receiver = msg.to.id
  if not data[tostring(msg.to.id)] then
  if not lang then
    return '#》 *Ɠяσυρ ιѕ ησт αɗɗєɗ* 🚫\n*〰〰〰〰〰〰〰〰*\n💠 `Group from the first to the group list, the robot was not added`'
else
    return '#》 `گروه در` #لیست `گروه ربات  نیست` 🚫\n*〰〰〰〰〰〰〰〰*\n💠 گروه از اول به لیست گروه ربات اضافه نشده است .'
   end
  end

  data[tostring(msg.to.id)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end
       data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
 if not lang then
  return '#》 *Ɠяσυρ нαѕ вєєη яємσνєɗ* ❌🤖\n\n*Ɠяσυρ Ɲαмє :*'..msg.to.title..'\n*OяɗєяƁу :* [@'..check_markdown(msg.from.username or '')..'*|*`'..msg.from.id..'`]\n*〰〰〰〰〰〰〰〰*\n💠 `The group now from the list of groups, the robot was removed`'
 else
  return '#》 `گروه از` #لیست `گروه های ربات حدف شد` ❌🤖\n\n*اسم گروه :*'..msg.to.title..'\n*توسط :* [@'..check_markdown(msg.from.username or '')..'*|*`'..msg.from.id..'`]\n*〰〰〰〰〰〰〰〰*\n💠 گروه هم اکنون از لیست گروه ربات حذف شد.'
end
end
----------------------------------------
 local function config_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
  --print(serpent.block(data))
   for k,v in pairs(data.members_) do
   local function config_mods(arg, data)
       local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    return
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   end
tdcli_function ({
    ID = "GetUser",
    user_id_ = v.user_id_
  }, config_mods, {chat_id=arg.chat_id,user_id=v.user_id_})
 
if data.members_[k].status_.ID == "ChatMemberStatusCreator" then
owner_id = v.user_id_
   local function config_owner(arg, data)
 -- print(serpent.block(data))
       local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    return
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   end
tdcli_function ({
    ID = "GetUser",
    user_id_ = owner_id
  }, config_owner, {chat_id=arg.chat_id,user_id=owner_id})
   end
end
 if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*AƖƖ gяσυρ αɗмιηѕ нαѕ вєєη ρяσмσтєɗ αηɗ gяσυρ cяєαтσя ιѕ ησω gяσυρ σωηєя*👤😎", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "`تمام ادمین های گروه به مقام مدیر منتصب شدند و سازنده گروه به مقام مالک گروه منتصب شد`👤😎", 0, "md")
     end

if (matches[1]:lower() == "setlang") and is_owner(msg) then
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if matches[2] == "fa" then
redis:set(hash, true)
return "*زبان گروه تنظیم شد به : فارسی*"
end
end
if (matches[1] == 'زبان انگلیسی') and is_owner(msg) then
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 redis:del(hash)
return "_Group Language Set To:_ EN"
end
 end
----------------------------------------
return {
patterns ={
 "^[!#/]([Ss]tats)$",
 "^([Ss]tats)$",
 "^(آمار)$",
 "^([Ii][Dd])$",
 "^([Mm][Ee])$",
 "^([Oo][Pp][Tt][Ii][Oo][Nn])$",
 "^([Aa][Dd][Dd])$",
 "^([Rr][Ee][Mm])$",
 "^([Rr][Ee][Mm][Mm][Aa][Nn][Aa][Gg][Ee][Rr])$",
 "^([Pp][Ii][Nn])$",
 "^([Uu][Nn][Pp][Ii][Nn])$",
 "^([Gg][Pp][Ii][Nn][Ff][Oo])$",
 "^([Ss][Ee][Tt][Mm][Aa][Nn][Aa][Gg][Ee][Rr])$",
 "^([Ww][Hh][Ii][Tt][Ee][Ll][Ii][Ss][Tt])$",
 "^([Ss][Ee][Tt][Oo][Ww][Nn][Ee][Rr])$",
 "^([Rr][Ee][Mm][Oo][Ww][Nn][Ee][Rr])$",
 "^([Pp][Rr][Oo][Mm][Oo][Tt][Ee])$",
 "^([Dd][Ee][Mm][Oo][Tt][Ee])$",
 "^([Mm][Oo][Dd][Ll][Ii][Ss][Tt])$",
 "^([Oo][Ww][Nn][Ee][Rr][Ll][Ii][Ss][Tt])$",
 "^([Ll][Ii][Nn][Kk])$",
 "^([Ss][Ee][Tt][Ll][Ii][Nn][Kk])$",
 "^([Nn][Ee][Ww][Ll][Ii][Nn][Kk])$",
 "^([Rr][Uu][Ll][Ee][Ss])$",
 "^([Ss][Ee][Tt][Tt][Ii][Nn][Gg][Ss])$",
 "^([Aa][Bb][Oo][Uu][Tt])$",
 "^([Hh][Ee][Ll][Pp])$",
 "^([Ff][Ii][Ll][Tt][Ee][Rr][Ll][Ii][Ss][Tt])$",
 "^([Cc][Oo][Nn][Ff][Ii][Gg])$",
 "^([Tt]ime)$",
 "^([Nn]erkh)$",
 "^([Hh]elpfun)$",
 "^([Tt]ophoto)$",
 "^([Tt]osticker)$",
 "^([Pp]raytime)$",
 "^([Aa]zan)$",
 "^([Aa]dminset)$", 
 "^([Aa]dmindem)$",
 "^([Aa]dminlist)$",
 "^([Hh]elptools)$", 
 "^([Ss]udoset)$", 
 "^([Ss]udodem)$",
 "^([Ss]udolist)$",
 "^([Ll]eave)$",
 "^([Tt]osuper)$",
 "^([Cc]hats)$",
 "^([Mm]ydel)$",
 "^([Mm]atador)$",
 "^([Gg]id)$",
 "^([Cc]heckexpire)$",
 "^([Cc]lear cache)$",
 "^([Bb]anlist)$",
 "^([Ss]ilent)$",
 "^([Ii][Nn][Vv][Ii]te)$",
 "^([Gg]banlist)$",
 "^([Bb]an)$",
 "^([Rr]eload)$",
 "^([Hh]elpmod)$", 
 "^([Hh]elpmute)$", 
 "^([Hh]elplock)$",
 "^([Pp]list)$",
 "^([Dd]el)$",
 "^([Ii]nfo)$",
 "^([Kk]ick)$",
 "^([Uu]nsilent)$",
 "^([Bb]anall)$",
 "^([Uu]nbanall)$",
 "^([Uu]nban)$",
 "^([Ss]ilentlist)$",
 '^([Hh]elpmute)$',
 "^([Dd]elall)$",
 '^([P][Ii][Nn][Gg])$',
 "^[#!/]([Ii][Dd])$",
 '^([Ll]ock gp)$',
 '^(قفل گروه)$',
 '^(بازکردن گروه)$',
 '^([Uu]nlock gp)$',
 "^[#!/]([Ll]ock gp)$",
 "^[#!/]([Uu]nlock gp)$",
 "^[#!/]([Mm][Ee])$",
 "^[#!/]([Oo][Pp][Tt][Ii][Oo][Nn])$",
 "^[#!/]([Aa][Dd][Dd])$",
 "^[#!/]([Rr][Ee][Mm])$",
 "^[#!/]([Rr][Ee][Mm][Mm][Aa][Nn][Aa][Gg][Ee][Rr])$",
 "^[#!/]([Pp][Ii][Nn])$",
 "^[#!/]([Uu][Nn][Pp][Ii][Nn])$",
 "^[#!/]([Gg][Pp][Ii][Nn][Ff][Oo])$",
 "^[#!/]([Ss][Ee][Tt][Mm][Aa][Nn][Aa][Gg][Ee][Rr])$",
 "^[#!/]([Ww][Hh][Ii][Tt][Ee][Ll][Ii][Ss][Tt])$",
 "^[#!/]([Ss][Ee][Tt][Oo][Ww][Nn][Ee][Rr])$",
 "^[#!/]([Rr][Ee][Mm][Oo][Ww][Nn][Ee][Rr])$",
 "^[#!/]([Pp][Rr][Oo][Mm][Oo][Tt][Ee])$",
 "^[#!/]([Dd][Ee][Mm][Oo][Tt][Ee])$",
 "^[#!/]([Mm][Oo][Dd][Ll][Ii][Ss][Tt])$",
 "^[#!/]([Oo][Ww][Nn][Ee][Rr][Ll][Ii][Ss][Tt])$",
 "^[#!/]([Ll][Ii][Nn][Kk])$",
 "^[#!/]([Ss][Ee][Tt][Ll][Ii][Nn][Kk])$",
 "^[#!/]([Nn][Ee][Ww][Ll][Ii][Nn][Kk])$",
 "^[#!/]([Rr][Uu][Ll][Ee][Ss])$",
 "^[#!/]([Ss][Ee][Tt][Tt][Ii][Nn][Gg][Ss])$",
 "^[#!/]([Aa][Bb][Oo][Uu][Tt])$",
 "^[#!/]([Hh][Ee][Ll][Pp])$",
 "^[#!/]([Ff][Ii][Ll][Tt][Ee][Rr][Ll][Ii][Ss][Tt])$",
 "^[#!/]([Cc][Oo][Nn][Ff][Ii][Gg])$",
 "^[#!/]([Tt]ime)$",
 "^[#!/]([Nn]erkh)$",
 "^[#!/]([Hh]elpfun)$",
 "^[#!/]([Tt]ophoto)$",
 "^[#!/]([Tt]osticker)$",
 "^[#!/]([Pp]raytime)$",
 "^[#!/]([Aa]zan)$",
 "^[#!/]([Aa]dminset)$", 
 "^[#!/]([Aa]dmindem)$",
 "^[#!/]([Aa]dminlist)$",
 "^[#!/]([Hh]elptools)$", 
 "^[#!/]([Ss]udoset)$", 
 "^[#!/]([Ss]udodem)$",
 "^[#!/]([Ss]udolist)$",
 "^[#!/]([Ll]eave)$",
 "^[#!/]([Tt]osuper)$",
 "^[#!/]([Cc]hats)$",
 "^[#!/]([Mm]ydel)$",
 "^[#!/]([Mm]atador)$",
 "^[#!/]([Gg]id)$",
 "^[#!/]([Cc]heckexpire)$",
 "^[#!/]([Cc]lear cache)$",
 "^[#!/]([Bb]anlist)$",
 "^[#!/]([Ss]ilent)$",
 "^[#!/]([Ii][Nn][Vv][Ii]te)$",
 "^[#!/]([Gg]banlist)$",
 "^[#!/]([Bb]an)$",
 "^[#!/]([Rr]eload)$",
 "^[#!/]([Hh]elpmod)$", 
 "^[#!/]([Hh]elpmute)$", 
 "^[#!/]([Hh]elplock)$",
 "^[#!/]([Pp]list)$",
 "^[#!/]([Dd]el)$",
 "^[#!/]([Ii]nfo)$",
 "^[#!/]([Kk]ick)$",
 "^[#!/]([Uu]nsilent)$",
 "^[#!/]([Bb]anall)$",
 "^[#!/]([Uu]nbanall)$",
 "^[#!/]([Uu]nban)$",
 "^[#!/]([Ss]ilentlist)$",
 '^[#!/]([Hh]elpmute)$',
 "^[#!/]([Dd]elall)$",
 '^[#!/]([P][Ii][Nn][Gg])$',
 '^(openchat)$',
'^(اطلاعات گروه)$',
'^(لینک جدید)$',
'^(حذف مالک)$',
'^(مدیر)$',
'^(لیست سفید)$',
'^(مالک)$',
'^(حذف ادمین گروه)$',
'^(تنظیمات)$',
'^(سنجاق)$',
'^(حذف سنجاق)$',
'^(نصب)$',
'^(لغو نصب)$',
'^(ادمین گروه)$',
'^(تنظیمات کلی)$',
'^(ایدی)$',
'^(اطلاعات من)$',
'^(راهنما بیصدا)$',
'^(لیست فیلتر)$',
'^(لیست بیصدا)$',
'^(لیست مالکان)$',
'^(لیست مدیران)$',
'^(راهنما مدیریتی)$',
'^(راهنما)$',
'^(پیکربندی)$',
'^(درباره)$',
'^(حذف)$',
'^(قوانین)$',
'^(لینک)$',
'^(تنظیم لینک)$',
"^(تبدیل به عکس)$",
"^(تبدیل به استیکر)$",
"^(اذان)$",
"^(ساعات شرعی)$",
"^(ساعت)$",
"^(لیست گروه ها)$",
"^(خروج)$",
"^(تبدیل به سوپر)$",
"^(حذف ادمین)$",
"^(افزودن ادمین)$",
"^(حذف سودو)$",
"^(راهنما ابزار)$",
"^(راهنما قفلی)$",
"^(لیست سودو)$",
"^(اطلاعات)$",
"^(نرخ)$",
"^(پیام منشی)$",
"^(اطلاعات ایدی)$",
"^(بارگذاری)$",
"^(لیست پلاگین)$",
"^(حذف پیام)$",
"^(افزودن)$",
"^(لیست سکوت)$",
"^(اخراج)$",
"^(پاکسازی پیام های من)$",
"^(حذف سکوت)$",
"^(لیست بن)$",
"^(سکوت)$",
"^(حذف بن)$",
"^(لیست سوپر بن)$",
"^(بن)$",
"^(حذف سوپر بن)$",
"^(پاک کردن حافظه)$",
"^(ماتادور)$",
"^(سوپر بن)$",
"^(اعتبار)$",
"^(لیست ادمین)$",
"^(افزودن سودو)$",
'^(زبان انگلیسی)$',
"^(راهنما سرگرمی)$",
'^(حذف مدیر)$',
'^(انلاینی)$',
"^[#!/]([Ii][Dd]) (.*)$",
"^([Ii][Dd]) (.*)$",
"^(ایدی) (.*)$",
"^[#!/]([Rr][Ee][Mm]) (.*)$",
"^([Rr][Ee][Mm]) (.*)$",
"^(لغو نصب) (.*)$",
"^[#!/]([Ss][Ee][Tt][Mm][Aa][Nn][Aa][Gg][Ee][Rr]) (.*)$",
"^([Ss][Ee][Tt][Mm][Aa][Nn][Aa][Gg][Ee][Rr]) (.*)$",
"^(ادمین گروه) (.*)$",
"^[#!/]([Rr][Ee][Mm][Mm][Aa][Nn][Aa][Gg][Ee][Rr]) (.*)$",
"^([Rr][Ee][Mm][Mm][Aa][Nn][Aa][Gg][Ee][Rr]) (.*)$",
"^(حذف ادمین گروه) (.*)$",
"^[#!/]([Ww][Hh][Ii][Tt][Ee][Ll][Ii][Ss][Tt]) ([+-])$",
"^([Ww][Hh][Ii][Tt][Ee][Ll][Ii][Ss][Tt]) ([+-])$",
"^[#!/]([Ww][Hh][Ii][Tt][Ee][Ll][Ii][Ss][Tt]) ([+-]) (.*)$",
"^([Ww][Hh][Ii][Tt][Ee][Ll][Ii][Ss][Tt]) ([+-]) (.*)$",
"^(لیست سفید) ([+-])$",
"^(لیست سفید) ([+-]) (.*)$",
"^[#!/]([Ss][Ee][Tt][Oo][Ww][Nn][Ee][Rr]) (.*)$",
"^([Ss][Ee][Tt][Oo][Ww][Nn][Ee][Rr]) (.*)$",
"^(مالک) (.*)$",
"^[#!/]([Rr][Ee][Mm][Oo][Ww][Nn][Ee][Rr]) (.*)$",
"^([Rr][Ee][Mm][Oo][Ww][Nn][Ee][Rr]) (.*)$",
"^(حذف مالک) (.*)$",
"^[#!/]([Pp][Rr][Oo][Mm][Oo][Tt][Ee]) (.*)$",
"^([Pp][Rr][Oo][Mm][Oo][Tt][Ee]) (.*)$",
"^(مدیر) (.*)$",
"^[#!/]([Dd][Ee][Mm][Oo][Tt][Ee]) (.*)$",
"^([Dd][Ee][Mm][Oo][Tt][Ee]) (.*)$",
"^(حذف مدیر) (.*)$",
"^[#!/]([Ll][Oo][Cc][Kk]) (.*)$",
"^([Ll][Oo][Cc][Kk]) (.*)$",
"^[#!/]([Un][Nn][Ll][Oo][Cc][Kk]) (.*)$",
"^([Uu][Nn][Ll][Oo][Cc][Kk]) (.*)$",
"^(قفل) (.*)$",
"^(بازکردن) (.*)$",
"^[!/#]([Pp][Hh][Oo][Tt][Oo]) (.*)$",
"^([Pp][Hh][Oo][Tt][Oo]) (.*)$",
"^(عکس) (.*)$",
"^[!/#]([Dd][Oo][Cc][Uu][Mm][Ee][Nn][Tt]) (.*)$",
"^([Dd][Oo][Cc][Uu][Mm][Ee][Nn][Tt]) (.*)$",
"^(فایل) (.*)$",
"^[!/#]([Ss][Tt][Ii][Cc][Kk][Ee][Rr]) (.*)$",
"^([Ss][Tt][Ii][Cc][Kk][Ee][Rr]) (.*)$",
"^(استیکر) (.*)$",
"^[!/#]([Kk][Ee][Yy][Bb][Oo][Aa][Rr][Dd]) (.*)$",
"^([Kk][Ee][Yy][Bb][Oo][Aa][Rr][Dd]) (.*)$",
"^(صفحه کلید) (.*)$",
"^[!/#]([Vv][Ii][Dd][Ee][Oo]) (.*)$",
"^([Vv][Ii][Dd][Ee][Oo]) (.*)$",
"^(فیلم) (.*)$",
"^[!/#]([Tt][Ee][Xx][Tt]) (.*)$",
"^([Tt][Ee][Xx][Tt]) (.*)$",
"^(متن) (.*)$",
"^[!/#]([Ff][Oo][Rr][Ww][Aa][Rr][Dd]) (.*)$",
"^([Ff][Oo][Rr][Ww][Aa][Rr][Dd]) (.*)$",
"^(فوروارد) (.*)$",
"^[!/#]([Ll][Oo][Cc][Aa][Tt][Ii][Oo][Nn]) (.*)$",
"^([Ll][Oo][Cc][Aa][Tt][Ii][Oo][Nn]) (.*)$",
"^(مکان) (.*)$",
"^[!/#]([Aa][Uu][Dd][Ii][Oo]) (.*)$",
"^([Aa][Uu][Dd][Ii][Oo]) (.*)$",
"^(اهنگ) (.*)$",
"^[!/#]([Vv][Oo][Ii][Cc][Ee]) (.*)$",
"^([Vv][Oo][Ii][Cc][Ee]) (.*)$",
"^(ویس) (.*)$",
"^[!/#]([Cc][Oo][Nn][Tt][Aa][Cc][Tt]) (.*)$",
"^([Cc][Oo][Nn][Tt][Aa][Cc][Tt]) (.*)$",
"^(مخاطب) (.*)$",
"^[!/#]([Ii][Nn][Ll][Ii][Nn][Ee]) (.*)$",
"^([Ii][Nn][Ll][Ii][Nn][Ee]) (.*)$",
"^(اینلاین) (.*)$",
"^[!/#]([Gg][Aa][Mm][Ee]) (.*)$",
"^([Gg][Aa][Mm][Ee]) (.*)$",
"^(بازی) (.*)$",
"^[!/#]([Ll][Ii][Nn][Kk]) (.*)$",
"^([Ll][Ii][Nn][Kk]) (.*)$",
"^(لینک) (.*)$",
"^[!/#]([Ee][Dd][Ii][Tt]) (.*)$",
"^([Ee][Dd][Ii][Tt]) (.*)$",
"^(ویرایش) (.*)$",
"^[!/#]([Tt][Aa][Gg]) (.*)$",
"^([Tt][Aa][Gg]) (.*)$",
"^(تگ) (.*)$",
"^[!/#]([Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]) (.*)$",
"^([Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]) (.*)$",
"^(نام کاربری) (.*)$",
"^[!/#]([Aa][Rr][Aa][Bb][Ii][Cc]) (.*)$",
"^([Aa][Rr][Aa][Bb][Ii][Cc]) (.*)$",
"^(عربی) (.*)$",
"^[!/#]([Ww][Ee][Bb][Pp][Aa][Gg][Ee]) (.*)$",
"^([Ww][Ee][Bb][Pp][Aa][Gg][Ee]) (.*)$",
"^(وب) (.*)$",
"^[!/#]([Mm][Aa][Rr][Kk][Dd][Oo][Ww][Nn]) (.*)$",
"^([Mm][Aa][Rr][Kk][Dd][Oo][Ww][Nn]) (.*)$",
"^(فراخوانی) (.*)$",
"^[!/#]([Mm][Ee][Nn][Tt][Ii][Oo][Nn]) (.*)$",
"^([Mm][Ee][Nn][Tt][Ii][Oo][Nn]) (.*)$",
"^(فونت) (.*)$",
"^[!/#]([Ee][Nn][Gg][Ll][Ii][Ss][Hh]) (.*)$",
"^([Ee][Nn][Gg][Ll][Ii][Ss][Hh]) (.*)$",
"^(انگلیسی) (.*)$",
"^[#!/]([Ss][Ee][Tt][Ll][Ii][Nn][Kk]) ([https?://w]*.?telegram.me/joinchat/%S+)$",
"^([Ss][Ee][Tt][Ll][Ii][Nn][Kk]) ([https?://w]*.?telegram.me/joinchat/%S+)$",
"^[#!/]([Ss][Ee][Tt][Ll][Ii][Nn][Kk]) ([https?://w]*.?t.me/joinchat/%S+)$",
"^([Ss][Ee][Tt][Ll][Ii][Nn][Kk]) ([https?://w]*.?t.me/joinchat/%S+)$",
"^(تنظیم لینک) ([https?://w]*.?telegram.me/joinchat/%S+)$",
"^(تنظیم لینک) ([https?://w]*.?t.me/joinchat/%S+)$",
"^[#!/]([Bb][Aa][Nn]) (.*)$",
"^([Bb][Aa][Nn]) (.*)$",
"^(بن) (.*)$",
"^[#!/]([Uu][Nn][Bb][Aa][Nn]) (.*)$",
"^([Uu][Nn][Bb][Aa][Nn]) (.*)$",
"^(حذف بن) (.*)$",
"^[#!/]([Mm][Uu][Tt][Ee][Aa][Ll][Ll]) ([Ss][Tt][Aa][Tt][Uu][Ss])$",
"^([Mm][Uu][Tt][Ee][Aa][Ll][Ll]) ([Ss][Tt][Aa][Tt][Uu][Ss])$",
"^[#!/]([Mm][Uu][Tt][Ee][Tt][Ii][Mm][Ee]) (%d+) (%d+) (%d+)$",
"^([Mm][Uu][Tt][Ee][Tt][Ii][Mm][Ee]) (%d+) (%d+) (%d+)$",
"^[#!/]([Mm][Uu][Tt][Ee][Hh][Oo][Uu][Rr][Ss]) (%d+)$",
"^([Mm][Uu][Tt][Ee][Hh][Oo][Uu][Rr][Ss]) (%d+)$",
"^[#!/]([Mm][Uu][Tt][Ee][Mm][Ii][Nn][Uu][Tt][Ee][Ss]) (%d+)$",
"^([Mm][Uu][Tt][Ee][Mm][Ii][Nn][Uu][Tt][Ee][Ss]) (%d+)$",
"^[#!/]([Mm][Uu][Tt][Ee][Ss][Ee][Cc][Oo][Nn][Dd][Ss]) (%d+)$",
"^([Mm][Uu][Tt][Ee][Ss][Ee][Cc][Oo][Nn][Dd][Ss]) (%d+)$",
"^(بیصدا) (موقعیت)$",
"^(زمان بیصدا) (%d+) (%d+) (%d+)$",
"^(ساعت بیصدا) (%d+)$",
"^(دقیقه بیصدا) (%d+)$",
"^(ثانیه بیصدا) (%d+)$",
"^[#!/]([Pp][Ll]) (+) ([%w_%.%-]+)$",
"^([Pp][Ll]) (+) ([%w_%.%-]+)$",
"^[#!/]([Pp][Ll]) (-) ([%w_%.%-]+)$",
"^([Pp][Ll]) (-) ([%w_%.%-]+)$",
"^[#!/]([Pp][Ll]) (+) ([%w_%.%-]+) ([Cc][Hh][Aa][Tt])$",
"^([Pp][Ll]) (+) ([%w_%.%-]+) ([Cc][Hh][Aa][Tt])$",
"^[#!/]([Pp][Ll]) (-) ([%w_%.%-]+) ([Cc][Hh][Aa][Tt])$",
"^([Pp][Ll]) (-) ([%w_%.%-]+) ([Cc][Hh][Aa][Tt])$",
"^[#!/]([Pp][Ll]) (*)$",
"^([Pp][Ll]) (*)$",
"^(پلاگین) (+) ([%w_%.%-]+)$",
"^(پلاگین) (-) ([%w_%.%-]+)$",
"^(پلاگین) (+) ([%w_%.%-]+) ([Cc][Hh][Aa][Tt])$",
"^(پلاگین) (-) ([%w_%.%-]+) ([Cc][Hh][Aa][Tt])$",
"^(پلاگین) (*)$",
"^[#!/]([Ss][Uu][Dd][Oo][Ss][Ee][Tt]) (.*)$",
"^([Ss][Uu][Dd][Oo][Ss][Ee][Tt]) (.*)$",
"^(افزودن سودو) (.*)$",
"^[#!/]([Ss][Uu][Dd][Oo][Dd][Ee][Mm]) (.*)$",
"^([Ss][Uu][Dd][Oo][Dd][Ee][Mm]) (.*)$",
"^(حذف سودو)$",
"^(حذف سودو) (.*)$",
"^[#!/]([Aa][Dd][Mm][Ii][Nn][Ss][Ee][Tt]) (.*)$",
"^([Aa][Dd][Mm][Ii][Nn][Ss][Ee][Tt]) (.*)$",
"^(افزودن ادمین)$",
"^(افزودن ادمین) (.*)$",
"^[#!/]([Aa][Dd][Mm][Ii][Nn][Dd][Ee][Mm]) (.*)$",
"^([Aa][Dd][Mm][Ii][Nn][Dd][Ee][Mm]) (.*)$",
"^(حذف ادمین)$",
"^(حذف ادمین) (.*)$",
"^[#!/]([Cc][Hh][Ee][Cc][Kk][Ee][Xx][Pp][Ii][Rr][Ee]) (.*)$",
"^([Cc][Hh][Ee][Cc][Kk][Ee][Xx][Pp][Ii][Rr][Ee]) (.*)$",
"^[#!/]([Cc][Hh][Aa][Rr][Gg][Ee]) (.*) (%d+)$",
"^([Cc][Hh][Aa][Rr][Gg][Ee]) (.*) (%d+)$",
"^[#!/]([Cc][Hh][Aa][Rr][Gg][Ee]) (%d+)$",
"^([Cc][Hh][Aa][Rr][Gg][Ee]) (%d+)$",
"^(اعتبار) (.*)$",
"^(شارژ) (.*) (%d+)$",
"^(شارژ) (%d+)$",
"^[#!/]([Ss][Ee][Tt][Rr][Uu][Ll][Ee][Ss]) (.*)$",
"^([Ss][Ee][Tt][Rr][Uu][Ll][Ee][Ss]) (.*)$",
"^(تنظیم قوانین) (.*)$",
"^[#!/]([Ss][Ee][Tt][Aa][Bb][Oo][Uu][Tt]) (.*)$",
"^([Ss][Ee][Tt][Aa][Bb][Oo][Uu][Tt]) (.*)$",
"^(تنظیم درباره) (.*)$",
"^[#!/]([Ss][Ee][Tt][Nn][Aa][Mm][Ee]) (.*)$",
"^([Ss][Ee][Tt][Nn][Aa][Mm][Ee]) (.*)$",
"^(تنظیم نام) (.*)$",
"^[#!/]([Cc][Ll][Ee][Aa][Nn]) (.*)$",
"^([Cc][Ll][Ee][Aa][Nn]) (.*)$",
"^(پاک کردن) (.*)$",
"^[#!/]([Ss][Ee][Tt][Ff][Ll][Oo][Oo][Dd]) (%d+)$",
"^([Ss][Ee][Tt][Ff][Ll][Oo][Oo][Dd]) (%d+)$",
"^[#!/]([Ss][Ee][Tt][Cc][Hh][Aa][Rr]) (%d+)$",
"^([Ss][Ee][Tt][Cc][Hh][Aa][Rr]) (%d+)$",
"^[#!/]([Ss][Ee][Tt][Ff][Ll][Oo][Oo][Dd][Tt][Ii][Mm][Ee]) (%d+)$",
"^([Ss][Ee][Tt][Ff][Ll][Oo][Oo][Dd][Tt][Ii][Mm][Ee]) (%d+)$",
"^(تنظیم پیام مکرر) (%d+)$",
"^(حداکثر حروف مجاز) (%d+)$",
"^(تنظیم زمان بررسی) (%d+)$",
"^[#!/]([Rr][Ee][Ss]) (.*)$",
"^([Rr][Ee][Ss]) (.*)$",
"^[#!/]([Ww][Hh][Oo][Ii][Ss]) (%d+)$",
"^([Ww][Hh][Oo][Ii][Ss]) (%d+)$",
"^(کاربری) (.*)$",
"^(شناسه) (%d+)$",
"^[#!/]([Cc][Mm][Dd][Ss]) (.*)$",
"^([Cc][Mm][Dd][Ss]) (.*)$",
"^(دستورات) (.*)$",
"^[#!/]([Ss][Ee][Tt][Ll][Aa][Nn][Gg]) ([Ff][Aa])$",
"^([Ss][Ee][Tt][Ll][Aa][Nn][Gg]) ([Ff][Aa])$",
"^[#!/]([Ss][Ee][Tt][Cc][Mm][Dd]) ([Ff][Aa])$",
"^([Ss][Ee][Tt][Cc][Mm][Dd]) ([Ff][Aa])$",
"^[#!/]([Ff][Ii][Ll][Tt][Ee][Rr]) (.*)$",
"^([Ff][Ii][Ll][Tt][Ee][Rr]) (.*)$",
"^(فیلتر) (.*)$",
"^[#!/]([Uu][Nn][Ff][Ii][Ll][Tt][Ee][Rr]) (.*)$",
"^([Uu][Nn][Ff][Ii][Ll][Tt][Ee][Rr]) (.*)$",
"^(حذف فیلتر) (.*)$",
"^[#!/]([Ss][Ee][Tt][Ww][Ee][Ll][Cc][Oo][Mm][Ee]) (.*)$",
"^([Ss][Ee][Tt][Ww][Ee][Ll][Cc][Oo][Mm][Ee]) (.*)$",
"^[#!/]([Ww][Ee][Ll][Cc][Oo][Mm][Ee]) (.*)$",
"^([Ww][Ee][Ll][Cc][Oo][Mm][Ee]) (.*)$",
"^(تنظیم خوشآمد) (.*)$",
"^(خوشآمد) (.*)$",
"^[#!/]([Ww][Ee][Aa][Tt][Hh][Ee][Rr]) (.*)$",
"^([Ww][Ee][Aa][Tt][Hh][Ee][Rr]) (.*)$",
"^[#!/]([Aa][Zz][Aa][Nn]) (.*)$",
"^([Aa][Zz][Aa][Nn]) (.*)$",
"^[#!/]([Cc][Aa][Ll][Cc]) (.*)$",
"^([Cc][Aa][Ll][Cc]) (.*)$",
"^[#!/]([Tt][Rr]) ([^%s]+) (.*)$",
"^([Tt][Rr]) ([^%s]+) (.*)$",
"^[#!/]([Ss][Hh][Oo][Rr][Tt]) (.*)$",
"^([Ss][Hh][Oo][Rr][Tt]) (.*)$",
"^[#!/]([Gg][Ii][Ff]) (.*)$",
"^([Gg][Ii][Ff]) (.*)$",
"^(گیف) (.*)$",
"^[#!/]([Ss][Tt][Ii][Cc][Kk][Ee][Rr]) (.+)$",
"^(اب و هوا) (.*)$",
"^(اذان) (.*)$",
"^(حساب کن) (.*)$",
"^(ترجمه) ([^%s]+) (.*)$",
"^(لینک کوتاه) (.*)$",
"^[#!/]([Dd][Ee][Ll][Aa][Ll][Ll]) (.*)$",
"^([Dd][Ee][Ll][Aa][Ll][Ll]) (.*)$",
"^[#!/]([Rr][Mm][Ss][Gg]) (%d*)$",
"^([Rr][Mm][Ss][Gg]) (%d*)$",
"^(پاکسازی) (%d*)$",
"^(حذف پیام) (.*)$",
"^[#!/]([Ll][Ee][Aa][Vv][Ee]) (.*)$",
"^([Ll][Ee][Aa][Vv][Ee]) (.*)$",
"^(خروج) (.*)$",
"^[#!/]([Ww][Rr][Ii][Tt][Ee]) (.*)$",
"^([Ww][Rr][Ii][Tt][Ee]) (.*)$",
"^(نوشتن) (.*)$",
"^[#!/]([Aa][Uu][Tt][Oo][Ll][Ee][Aa][Vv][Ee]) (.*)$",
"^([Aa][Uu][Tt][Oo][Ll][Ee][Aa][Vv][Ee]) (.*)$",
"^(خروج خودکار) (.*)$",
"^[#!/]([Cc][Rr][Ee][Aa][Tt][Ee][Gg][Rr][Oo][Uu][Pp]) (.*)$",
"^([Cc][Rr][Ee][Aa][Tt][Ee][Gg][Rr][Oo][Uu][Pp]) (.*)$",
"^[#!/]([Cc][Rr][Ee][Aa][Tt][Ee][Ss][Uu][Pp][Ee][Rr]) (.*)$",
"^([Cc][Rr][Ee][Aa][Tt][Ee][Ss][Uu][Pp][Ee][Rr]) (.*)$",
"^(ساخت گروه) (.*)$",
"^(ساخت سوپر گروه) (.*)$",
"^[#!/]([Jj][Oo][Ii][Nn]) (.*)$",
"^([Jj][Oo][Ii][Nn]) (.*)$",
"^[#!/]([Jj][Oo][Ii][Nn][Tt][Oo]) (.*)$",
"^([Jj][Oo][Ii][Nn][Tt][Oo]) (.*)$",
"^(ورود به) (.*)$",
"^(ورود) (.*)$",
"^[#!/]([Ss][Ee][Tt][Bb][Oo][Tt][Nn][Aa][Mm][Ee]) (.*)$",
"^([Ss][Ee][Tt][Bb][Oo][Tt][Nn][Aa][Mm][Ee]) (.*)$",
"^[#!/]([Ss][Ee][Tt][Bb][Oo][Tt][Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]) (.*)$",
"^([Ss][Ee][Tt][Bb][Oo][Tt][Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]) (.*)$",
"^[#!/]([Dd][Ee][Ll][Bb][Oo][Tt][Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]) (.*)$",
"^([Dd][Ee][Ll][Bb][Oo][Tt][Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]) (.*)$",
"^(حذف یوزرنیم ربات) (.*)$",
"^(تغییر یوزرنیم ربات) (.*)$",
"^(تغییر نام ربات) (.*)$",
"^[#!/]([Bb][Aa][Nn][Aa][Ll][Ll]) (.*)$",
"^([Bb][Aa][Nn][Aa][Ll][Ll]) (.*)$",
"^[#!/]([Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll]) (.*)$",
"^([Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll]) (.*)$",
"^[#!/]([Ss][Ii][Ll][Ee][Nn][Tt]) (.*)$",
"^([Ss][Ii][Ll][Ee][Nn][Tt]) (.*)$",
"^[#!/]([Uu][Nn][Ss][Ii][Ll][Ee][Nn][Tt]) (.*)$",
"^([Uu][Nn][Ss][Ii][Ll][Ee][Nn][Tt]) (.*)$",
"^(سوپر بن) (.*)$",
"^(حذف سوپر بن)$",
"^(حذف سوپر بن) (.*)$",
"^(سکوت) (.*)$",
"^(حذف سکوت)$",
"^(حذف سکوت) (.*)$",
"^[#!/]([Kk][Ii][Cc][Kk]) (.*)$",
"^([Kk][Ii][Cc][Kk]) (.*)$",
"^(اخراج) (.*)$",
"^[#!/]([Ii][Nn][Ff][Oo]) (.*)$",
"^([Ii][Nn][Ff][Oo]) (.*)$",
"^(اطلاعات ایدی) (.*)$",
"^[#!/]([Ii][Mm][Pp][Oo][Rr][Tt]) (.*)$",
"^([Ii][Mm][Pp][Oo][Rr][Tt]) (.*)$",
"^[#!/]([Mm][Aa][Rr][Kk][Rr][Ee][Aa][Dd]) (.*)$",
"^([Mm][Aa][Rr][Kk][Rr][Ee][Aa][Dd]) (.*)$",
"^[#!/]([Bb][Cc]) +(.*) (.*)$",
"^([Bb][Cc]) +(.*) (.*)$",
"^[#!/]([Bb][Rr][Oo][Aa][Dd][Cc][Aa][Ss][Tt]) (.*)$",
"^([Bb][Rr][Oo][Aa][Dd][Cc][Aa][Ss][Tt]) (.*)$",
"^[#!/]([Ss][Ee][Nn][Dd][Ff][Ii][Ll][Ee]) (.*) (.*)$",
"^([Ss][Ee][Nn][Dd][Ff][Ii][Ll][Ee]) (.*) (.*)$",
"^[#!/]([Ss][Ee][Nn][Dd][Pp][Ll][Uu][Gg]) (.*)$",
"^([Ss][Ee][Nn][Dd][Pp][Ll][Uu][Gg]) (.*)$",
"^[#!/]([Pp][Ll][Aa][Nn]) ([123]) (.*)$",
"^([Pp][Ll][Aa][Nn]) ([123]) (.*)$",
"^(ارسال فایل) (.*)$",
"^(ارسال به همه) (.*)$",
"^(ارسال پلاگین) (.*)$",
"^(پلن) ([123]) (.*)$",
"^(تیک دوم) (.*)$",
"^(ارسال) +(.*) (.*)$",
"^(ورود لینک (.*)$",
"^[!/#]([Ss][Ee][Tt][Ww][Aa][Rr][Nn]) (%d+)$",
"^([Ss][Ee][Tt][Ww][Aa][Rr][Nn]) (%d+)$",
"^(حداکثر اخطار) (%d+)$",
"^[!/#]([Ss][Ee][Tt][Ee][Nn][Dd]) (.*)$",
"^([Ss][Ee][Tt][Ee][Nn][Dd]) (.*)$",
"^(تنظیم پایان) (.*)$",
"^[!/#]([Oo][Pp][Ee][Nn]) (.*)$",
"^([Oo][Pp][Ee][Nn]) (.*)$",
"^[!/#]([Cc][Hh][Ee][Cc][Kk]) (.*)$",
"^([Cc][Hh][Ee][Cc][Kk]) (.*)$",
"^(چک) (.*)$",
"^(باز گپ) (.*)$",
"^([https?://w]*.?telegram.me/joinchat/%S+)$",
"^([https?://w]*.?t.me/joinchat/%S+)$"
},
run=run,
pre_process = pre_process,
}

