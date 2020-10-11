local mmcf_info = { "Mistmoore's Catacombs: Scion Lair of Fury", 6, 54 }
local mmcf_dz = { "mmcf", 50, eq.seconds("3h") }
mmcf_dz.compass = { "lfaydark", 3877.23, -127.446, -53.598 }
mmcf_dz.safereturn = { "lfaydark", 3847, -56, -50, 0 }
mmcf_dz.zonein = { -184, 399, -12, 0 }

-- not implemented
-- function event_say(e)
--   if e.message:findi("hail") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Glopruk Tigglum says, 'Me hate dem vampires over in doze dark catacombs. They do have some of de shiny tings though. Me seen lots of dem come through here.  I mean shiny tings, not vampires.  My new friends have lots of work to do. If youz can rally de call of your friend perhaps youz can help us wit a serious [" .. eq.say_link("problem") .. "].'")
--   elseif e.message:findi("problem") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Glopruk Tigglum says, 'One of de rogues heard dat Valdoon Kel'Novar, a Trueborn, was on his way to de rocky summoning place to make an army of gargoyles to do de Trueborn's biddin'. If he make dat stony army, de Trueborn can rule over de rest of Mayong Mistmoore's Progeny. We can't let dat happen, see? You gonna need lots of help. Are youz [" .. eq.say_link("interested") .. "]?'")
--   elseif e.message:findi("interested") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Glopruk Tigglum says, 'Bring back de shiny tings for me!'")
--     e.other:CreateExpedition(mmcf_dz, mmcf_info)
--   end
-- end
