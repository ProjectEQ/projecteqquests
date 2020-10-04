local rujd_info = { "The Rujarkian Hills: Prison Break", 6, 54 }
local rujd_dz = { "rujd", 50, eq.seconds("3h") }
rujd_dz.zonein = { -322, 1254, -95.75, 0 }
rujd_dz.compass = { "sro", 1346.18, -2099.33, -88.0377 }
rujd_dz.safereturn = { "sro", 1349, -2161, -87, 0 } -- made up, live uses southro
-- rujd_dz.compass = { "southro", -157.091, 19.310, 132.856 }
-- rujd_dz.safereturn = { "southro", -1, -221, 134, 0 }

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Luarnn Gibbizt says, 'Thinking of venturing into the Rujarkian Hills? I admire that kind of spirit. Coincidentally, we're looking for a few brave souls to help us with an interesting task -- if you don't mind danger.  If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link("problem") .. "].'")
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Luarnn Gibbizt says, 'A party of our most experienced adventurers recently went to the Rujarkian Hills as scouts.  We have not heard from them for several days and suspect that they've been captured. We need you to gather a force and make an assault on the Rujarkian jails. Find the eight members of the missing party and free them. Be warned, the Rujarkian Warden is a brute even by orcish standards. He will not allow his prisoners to escape while he still draws breath.  Are you [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Luarnn Gibbizt says, 'Bring our people back alive, %s.  Please.'"):format(e.other:GetCleanName()))
    e.other:CreateExpedition(rujd_dz, rujd_info)
  end
end
