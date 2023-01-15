local rujj = {
  expedition = { name="The Rujarkian Hills: War March of Imal Ojun", min_players=6, max_players=54 },
  instance   = { zone="rujj", version=50, duration=eq.seconds("3h") },
  zonein     = { x=750, y=-134, z=27.125, h=0 },
  compass    = { zone="sro", x=1346.18, y=-2099.33, z=-88.0377 },
  safereturn = { zone="sro", x=1349, y=-2161, z=-87, h=0 } -- made up, live uses southro
  -- compass    = { zone="southro", x=-157.091, y=19.310, z=132.856 },
  -- safereturn = { zone="southro", x=-1, y=-221, z=134, h=0 }
}

-- not implemented
-- function event_say(e)
--   if e.message:findi("hail") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Uzmanya Zsiksta says, 'Hail, %s. Those Rujarkian orcs are mighty beasts, indeed! I've felt the blade of a few of them myself.  We have many tasks that we need to address in those hills. If you are brave and strong enough, I'm sure we can find some work you could help us with.  If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link("problem") .. "].'"):format(e.other:GetCleanName()))
--   elseif e.message:findi("problem") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Uzmanya Zsiksta says, 'We have learned that Warlord Imal Ojun is organizing a great army in the Rujarkian Hills. Should he complete his army, the orcs will prove to be an even greater threat. The Warlord must be stopped. We need you to disrupt his activities. Our scouts report that the Warlord has appointed three captains. If you slay them, much of the army will crumble.  Are you [" .. eq.say_link("interested") .. "]?'")
--   elseif e.message:findi("interested") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Uzmanya Zsiksta says, 'The captains will not lay down without a fight, %s.  Be ready for anything.'"):format(e.other:GetCleanName()))
--     e.other:CreateExpedition(rujj)
--   end
-- end
