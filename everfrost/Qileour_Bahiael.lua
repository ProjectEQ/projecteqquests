local mirb_info = { "Miragul's Menagerie: Frozen Nightmare", 6, 54 }
local mirb_dz = { "mirb", 50, eq.seconds("3h") }
mirb_dz.compass = { "everfrost", -5457.705, -827.538, 187.38 }
mirb_dz.safereturn = { "everfrost", -5461.0, -848.0, 190.0, 0 } -- { "everfrost", -5477.0, -846.0, 189.44, 0 }
mirb_dz.zonein = { 607.0, 1504.0, 28.0, 156.0 }

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Qileour Bahiael says, 'I am busy building a strategy to take on those oddities deep under the ice here.  If you need something, speak up now.  I have little time for pleasantries.  However, if you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link("problem") .. "].'")
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Qileour Bahiael says, 'It is terrible that we are losing so many faithful Wayfarers to the chaos of Miragul's Menagerie. As experienced as you are, I hesitate to burden you with this task. It would require you to venture into an extremely dangerous area in the menagerie from which you may not return. I implore you to go deep into an area known as the Frozen Nightmare. It is through there that you would be dropped into the heart of the pandemonium where we have lost our best comrades. I need you to locate and exterminate whatever is killing our people.  Are you [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Qileour Bahiael says, 'Keep an eye out for the lost members while you're there, and always be on your toes.  Miragul's oddities are as strange as they are deadly.  These caves are not called the Frozen Nightmare for nothing.'")
    -- ldon raids have no requirements, level 1 without adventurer's stone can request
    e.other:CreateExpedition(mirb_dz, mirb_info)
  end
end
