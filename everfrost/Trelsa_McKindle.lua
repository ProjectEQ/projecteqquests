local mirg_info = { "Miragul's Menagerie: Folly of Miragul's Ambition", 6, 54 }
local mirg_dz = { "mirg", 0, eq.seconds("3h") }
mirg_dz.compass = { "everfrost", -5457.705, -827.538, 187.38 }
mirg_dz.safereturn = { "everfrost", -5461.0, -848.0, 190.0, 0 }
mirg_dz.zonein = { 482, 28, 76.125, 218 }

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Trelsa McKindle says, 'Ever since I took me first steps in that icy kingdom, I thought I was seein' things, aye. Never in all me life have I crossed wit' such a motley bunch o' creatures. It was almost enough to warp me mind. The ab'rations, planar beasts and frosty creatures 'ave been the source of no end o' difficulties and problems for me, aye.  Hmm, if ye could rally the call of yer friends ye might be able to help us wit' a serious [" .. eq.say_link("problem") .. "].'"):format(e.other:GetCleanName()))
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Trelsa McKindle says, 'Ere's the long and short o' it.  We have pinpointed the location o' the strongest magical emanations coming from the 'eart of Miragul's Menagerie. Rumor 'as it that the magic is sentient and has created a form for itself.  We've named it the Synarcana.  There's a better than good chance that the creature is part of Miragul 'imself, and possibly the force that keeps the menagerie alive. We are in desperate need o' your help to control the growing strength o' this presence. Are ye [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Trelsa McKindle says, 'Aye, that's the spirit, %s.  The Wayfarer's Brotherhood is counting on ye.  Beware the Synarcana!'"):format(e.other:GetCleanName()))
    -- e.other:CreateExpedition(mirg_dz, mirg_info)
  end
end
