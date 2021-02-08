local taka = {
  expedition = { name="Takish-Hiz: Sunken Library", min_players=6, max_players=54 },
  instance   = { zone="taka", version=50, duration=eq.seconds("3h") },
  zonein     = { x=-77, y=493, z=3.125, h=0 },
  compass    = { zone="nro", x=92, y=-942, z=-44 },
  safereturn = { zone="nro", x=94, y=-1002, z=-33, h=0 } -- made up, live uses northro
  -- compass    = { zone="northro", x=-1187.608, y=5567.216, z=12.897 },
  -- safereturn = { zone="northro", x=-1252, y=5548, z=28.25, h=0 }
}

-- not implemented
-- function event_say(e)
--   if e.message:findi("hail") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tarakix V`Rasyrn glares at you, as if sizing you up. 'Well, are you going to stand there and gawk at me like a severed fishhead, or do you possess some minor semblance of skill and intellect?  If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link("problem") .. "].'")
--   elseif e.message:findi("problem") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tarakix V`Rasyrn says, 'Well then, 'friend'.  We have recently discovered that the sand elves within Takish-Hiz are planning to perform a ritual ceremony soon.  We will need a raid of foolish... Er, brave adventurers to head into the depths of the sandy caves to investigate and bring a halt to the ceremony, if possible.  Be on your guard, for there are sure to be many guards and other insidious traps in place to stop you.  Are you [" .. eq.say_link("interested") .. "]?'")
--   elseif e.message:findi("interested") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Tarakix V`Rasyrn says, 'Good luck, %s.  You will need it.'"):format(e.other:GetCleanName()))
--     e.other:CreateExpedition(taka)
--   end
-- end
