local mirg = {
  expedition = { name="Miragul's Menagerie: Folly of Miragul's Ambition", min_players=6, max_players=54 },
  instance   = { zone="mirg", version=0, duration=eq.seconds("3h") },
  compass    = { zone="everfrost", x=-5457.705, y=-827.538, z=187.38 },
  safereturn = { zone="everfrost", x=-5461.0, y=-848.0, z=190.0, h=0 },
  zonein     = { x=482, y=28, z=76.125, h=218 }
}

-- not implemented
-- function event_say(e)
--   if e.message:findi("hail") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Trelsa McKindle says, 'Ever since I took me first steps in that icy kingdom, I thought I was seein' things, aye. Never in all me life have I crossed wit' such a motley bunch o' creatures. It was almost enough to warp me mind. The ab'rations, planar beasts and frosty creatures 'ave been the source of no end o' difficulties and problems for me, aye.  Hmm, if ye could rally the call of yer friends ye might be able to help us wit' a serious [" .. eq.say_link("problem") .. "].'"):format(e.other:GetCleanName()))
--   elseif e.message:findi("problem") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Trelsa McKindle says, 'Ere's the long and short o' it.  We have pinpointed the location o' the strongest magical emanations coming from the 'eart of Miragul's Menagerie. Rumor 'as it that the magic is sentient and has created a form for itself.  We've named it the Synarcana.  There's a better than good chance that the creature is part of Miragul 'imself, and possibly the force that keeps the menagerie alive. We are in desperate need o' your help to control the growing strength o' this presence. Are ye [" .. eq.say_link("interested") .. "]?'")
--   elseif e.message:findi("interested") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Trelsa McKindle says, 'Aye, that's the spirit, %s.  The Wayfarer's Brotherhood is counting on ye.  Beware the Synarcana!'"):format(e.other:GetCleanName()))
--     e.other:CreateExpedition(mirg)
--   end
-- end
