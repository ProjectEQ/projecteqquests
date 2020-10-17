local mmcf = {
  expedition = { name="Mistmoore's Catacombs: Scion Lair of Fury", min_players=6, max_players=54 },
  instance   = { zone="mmcf", version=50, duration=eq.seconds("3h") },
  compass    = { zone="lfaydark", x=3877.23, y=-127.446, z=-53.598 },
  safereturn = { zone="lfaydark", x=3847, y=-56, z=-50, h=0 },
  zonein     = { x=-184, y=399, z=-12, h=0 }
}

-- not implemented
-- function event_say(e)
--   if e.message:findi("hail") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Glopruk Tigglum says, 'Me hate dem vampires over in doze dark catacombs. They do have some of de shiny tings though. Me seen lots of dem come through here.  I mean shiny tings, not vampires.  My new friends have lots of work to do. If youz can rally de call of your friend perhaps youz can help us wit a serious [" .. eq.say_link("problem") .. "].'")
--   elseif e.message:findi("problem") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Glopruk Tigglum says, 'One of de rogues heard dat Valdoon Kel'Novar, a Trueborn, was on his way to de rocky summoning place to make an army of gargoyles to do de Trueborn's biddin'. If he make dat stony army, de Trueborn can rule over de rest of Mayong Mistmoore's Progeny. We can't let dat happen, see? You gonna need lots of help. Are youz [" .. eq.say_link("interested") .. "]?'")
--   elseif e.message:findi("interested") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Glopruk Tigglum says, 'Bring back de shiny tings for me!'")
--     e.other:CreateExpedition(mmcf)
--   end
-- end
