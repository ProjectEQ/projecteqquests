local rujj_info = { "The Rujarkian Hills: War March of Imal Ojun", 6, 54 }
local rujj_dz = { "rujj", 50, eq.seconds("3h") }
rujj_dz.zonein = { 750, -134, 27.125, 0 }
rujj_dz.compass = { "sro", 1346.18, -2099.33, -88.0377 }
rujj_dz.safereturn = { "sro", 1349, -2161, -87, 0 } -- made up, live uses southro
-- rujd_dz.compass = { "southro", -157.091, 19.310, 132.856 }
-- rujd_dz.safereturn = { "southro", -1, -221, 134, 0 }

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Uzmanya Zsiksta says, 'Hail, %s. Those Rujarkian orcs are mighty beasts, indeed! I've felt the blade of a few of them myself.  We have many tasks that we need to address in those hills. If you are brave and strong enough, I'm sure we can find some work you could help us with.  If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link("problem") .. "].'"):format(e.other:GetCleanName()))
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Uzmanya Zsiksta says, 'We have learned that Warlord Imal Ojun is organizing a great army in the Rujarkian Hills. Should he complete his army, the orcs will prove to be an even greater threat. The Warlord must be stopped. We need you to disrupt his activities. Our scouts report that the Warlord has appointed three captains. If you slay them, much of the army will crumble.  Are you [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Uzmanya Zsiksta says, 'The captains will not lay down without a fight, %s.  Be ready for anything.'"):format(e.other:GetCleanName()))
    -- e.other:CreateExpedition(rujj_dz, rujj_info)
  end
end
