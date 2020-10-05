local taka_info = { "Takish-Hiz: Sunken Library", 6, 54 }
local taka_dz = { "taka", 50, eq.seconds("3h") }
taka_dz.zonein = { -77, 493, 3.125, 0 }
taka_dz.compass = { "nro", 92, -942, -44 }
taka_dz.safereturn = { "nro", 94, -1002, -33, 0 } -- made up, live uses northro
-- taka_dz.compass = { "northro", -1187.608, 5567.216, 12.897 }
-- taka_dz.safereturn = { "northro", -1252, 5548, 28.25, 0 }

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tarakix V`Rasyrn glares at you, as if sizing you up. 'Well, are you going to stand there and gawk at me like a severed fishhead, or do you possess some minor semblance of skill and intellect?  If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link("problem") .. "].'")
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tarakix V`Rasyrn says, 'Well then, 'friend'.  We have recently discovered that the sand elves within Takish-Hiz are planning to perform a ritual ceremony soon.  We will need a raid of foolish... Er, brave adventurers to head into the depths of the sandy caves to investigate and bring a halt to the ceremony, if possible.  Be on your guard, for there are sure to be many guards and other insidious traps in place to stop you.  Are you [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Tarakix V`Rasyrn says, 'Good luck, %s.  You will need it.'"):format(e.other:GetCleanName()))
    -- e.other:CreateExpedition(taka_dz, taka_info)
  end
end
