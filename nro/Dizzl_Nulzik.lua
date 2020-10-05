local take_info = { "Takish-Hiz: The Palace Grounds", 6, 54 }
local take_dz = { "take", 50, eq.seconds("3h") }
take_dz.zonein = { 375, -406, 19.125, 0 }
take_dz.compass = { "nro", 92, -942, -44 }
take_dz.safereturn = { "nro", 94, -1002, -33, 0 } -- made up, live uses northro
-- take_dz.compass = { "northro", -1187.608, 5567.216, 12.897 }
-- take_dz.safereturn = { "northro", -1252, 5548, 28.25, 0 }

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Dizzl Nulzik bows to you.  'These are most exciting times for us!  Exploring the world with such great companions, there can be no greater occupation.  Well, maybe tinkering, but this is great. There are so many surprises around the bends of time, aren't there? Much to do, much to do!  In fact, I can see that you'd like to get involved, eh?  If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link("problem") .. "].'")
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Dizzl Nulzik says, 'It seems the sand elves of Takish-Hiz are very disturbed by our presence. Now our scouts report that some Geomantic Compact masters aim to create a beast of sand to unleash on all who enter Takish-Hiz. This would impede our gathering of information and such, so we need you to stop them. You will need your best and bravest for this task.  Are you [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Dizzl Nulzik says, 'Put the beast of sand to sleep if you must, %s.  We're counting on you.'"):format(e.other:GetCleanName()))
    -- e.other:CreateExpedition(take_dz, take_info)
  end
end
