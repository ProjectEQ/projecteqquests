local mirc = {
  expedition = { name="Miragul's Menagerie: Spider Den", min_players=6, max_players=54 },
  instance   = { zone="mirc", version=0, duration=eq.seconds("3h") },
  compass    = { zone="everfrost", x=-5457.705, y=-827.538, z=187.38 },
  safereturn = { zone="everfrost", x=-5461.0, y=-848.0, z=190.0, h=0 },
  zonein     = { x=-767, y=722, z=-185.625, h=0 }
}

-- not implemented
-- function event_say(e)
--   if e.message:findi("hail") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Mathii Faurls points out in the direction of the snowy dunes of Everfrost, 'Careful where you step, %s!  Yet another raiding party was lost a few days ago while scouring the icy halls of the Menagerie.  Oh, wait. Are you for hire?  If you could rally the call of your friends you might be able to help us with a serious [" .. eq.say_link("problem") .. "].'"):format(e.other:GetCleanName()))
--   elseif e.message:findi("problem") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Mathii Faurls says, 'One of our research parties exploring in Miragul's Menagerie was ambushed by Frostfoot clan goblins.  All of them were captured, save one, who made it out and returned with tales of the goblins possessing mysterious magic and an unusually cunning intellect.  We will need a large group of adventurers to venture into the depths of Miragul's Menagerie to defeat the goblin leaders and rescue any of the surviving members of the party.  Are you [" .. eq.say_link("interested") .. "]?'")
--   elseif e.message:findi("interested") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Mathii Faurls says, 'Splendid, %s!  I knew the moment you arrived that you would help us.'"):format(e.other:GetCleanName()))
--     e.other:CreateExpedition(mirc)
--   end
-- end
