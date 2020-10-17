-- Efrelle_Treiui
-- 034146
local takc = {
  expedition = { name="Takish-Hiz: Within the Compact", min_players=6, max_players=54 },
  instance   = { zone="takc", version=0, duration=eq.seconds("3h") },
  zonein     = { x=251, y=33, z=4.375, h=0 },
  compass    = { zone="nro", x=92, y=-942, z=-44 },
  safereturn = { zone="nro", x=94, y=-1002, z=-33, h=0 } -- made up, live uses northro
  -- compass    = { zone="northro", x=-1187.608, y=5567.216, z=12.897 },
  -- safereturn = { zone="northro", x=-1252, y=5548, z=28.25, h=0 }
}

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Efrelle Treiui says, 'To have seen shades of my former ancestors in the broken city of Takish-Hiz has brought a darkness to my heart that I've never known. If I knew a way to restore the sand elves to their former beauty I would. For now though, there is much to learn from them. You look to be well-versed in the ways of the sand elves and Takish-Hiz.  If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link("problem") .. "].'")
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Efrelle Treiui says, 'Our presence in Takish-Hiz has given the aimless Jeweled Guard a purpose after so many years. Each day, more of them recall how to organize themselves in battle and they are forming armies with one purpose, to put an end to any intruder. That's us, friend. You will need your own army to put a stop to that growing force so it is safer for the rest of the us.  Are you [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Efrelle Treiui says, 'Do what is necessary, %s.  We cannot afford to allow the Jeweled Guard to impede our progress.'"):format(e.other:GetCleanName()))
    e.other:CreateExpedition(takc)
  end
end
