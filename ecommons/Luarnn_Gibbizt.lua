local rujd = {
  expedition = { name="The Rujarkian Hills: Prison Break", min_players=6, max_players=54 },
  instance   = { zone="rujd", version=50, duration=eq.seconds("3h") },
  zonein     = { x=-322, y=1254, z=-95.75, h=0 },
  compass    = { zone="sro", x=1346.18, y=-2099.33, z=-88.0377 },
  safereturn = { zone="sro", x=1349, y=-2161, z=-87, h=0 } -- made up, live uses southro
  -- compass    = { zone="southro", x=-157.091, y=19.310, z=132.856 },
  -- safereturn = { zone="southro", x=-1, y=-221, z=134, h=0 }
}

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Luarnn Gibbizt says, 'Thinking of venturing into the Rujarkian Hills? I admire that kind of spirit. Coincidentally, we're looking for a few brave souls to help us with an interesting task -- if you don't mind danger.  If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link("problem") .. "].'")
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Luarnn Gibbizt says, 'A party of our most experienced adventurers recently went to the Rujarkian Hills as scouts.  We have not heard from them for several days and suspect that they've been captured. We need you to gather a force and make an assault on the Rujarkian jails. Find the eight members of the missing party and free them. Be warned, the Rujarkian Warden is a brute even by orcish standards. He will not allow his prisoners to escape while he still draws breath.  Are you [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Luarnn Gibbizt says, 'Bring our people back alive, %s.  Please.'"):format(e.other:GetCleanName()))
    e.other:CreateExpedition(rujd)
  end
end
