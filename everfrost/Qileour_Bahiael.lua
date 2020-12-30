local mirb = {
  expedition = { name="Miragul's Menagerie: Frozen Nightmare", min_players=6, max_players=54 },
  instance   = { zone="mirb", version=50, duration=eq.seconds("3h") },
  compass    = { zone="everfrost", x=-5457.705, y=-827.538, z=187.38 },
  safereturn = { zone="everfrost", x=-5461.0, y=-848.0, z=190.0, h=0 },
  zonein     = { x=607.0, y=1504.0, z=28.0, h=156.0 }
}

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Qileour Bahiael says, 'I am busy building a strategy to take on those oddities deep under the ice here.  If you need something, speak up now.  I have little time for pleasantries.  However, if you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link("problem") .. "].'")
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Qileour Bahiael says, 'It is terrible that we are losing so many faithful Wayfarers to the chaos of Miragul's Menagerie. As experienced as you are, I hesitate to burden you with this task. It would require you to venture into an extremely dangerous area in the menagerie from which you may not return. I implore you to go deep into an area known as the Frozen Nightmare. It is through there that you would be dropped into the heart of the pandemonium where we have lost our best comrades. I need you to locate and exterminate whatever is killing our people.  Are you [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Qileour Bahiael says, 'Keep an eye out for the lost members while you're there, and always be on your toes.  Miragul's oddities are as strange as they are deadly.  These caves are not called the Frozen Nightmare for nothing.'")
    -- ldon raids have no requirements, level 1 without adventurer's stone can request
    e.other:CreateExpedition(mirb)
  end
end
