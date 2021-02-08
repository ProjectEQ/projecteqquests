-- sewer trials all share the same compass
-- items: 68298
local sewers = {
  snplant = { -- should be version 0 of zone, named can spawn in progression version
    expedition = { name="Sewers of Nihilia, The Purifying Plant", min_players=1, max_players=6 },
    instance   = { zone="snplant", version=0, duration=eq.seconds("6h") },
    zonein     = { x=150.00, y=127.00, z=-6.87, h=126.00 }
  },
  sncrematory = {
    expedition = { name="Sewers of Nihilia, The Crematory", min_players=1, max_players=6 },
    instance   = { zone="sncrematory", version=0, duration=eq.seconds("6h") },
    zonein     = { x=31.00, y=175.00, z=-17.87, h=254.00 }
  },
  snlair = {
    expedition = { name="Sewers of Nihilia, Lair of the Trapped Ones", min_players=1, max_players=6 },
    instance   = { zone="snlair", version=0, duration=eq.seconds("6h") },
    zonein     = { x=234.00, y=-70.00, z=-14.87, h=508.00 }
  },
  snpool = {
    expedition = { name="Sewers of Nihilia, The Pool of Sludge", min_players=1, max_players=6 },
    instance   = { zone="snpool", version=0, duration=eq.seconds("6h") },
    zonein     = { x=137.00, y=-5.00, z=-19.87, h=378.00 }
  }
}

for _, sewer in pairs(sewers) do
  sewer.compass    = { zone="barindu", x=-645.859, y=-338.502, z=-118.309 }
  sewer.safereturn = { zone="barindu", x=-605.0, y=-337.0, z=-123.84, h=0.0 }
end

local function create_sewer_expedition(client, sewer)
  local dz = client:CreateExpedition(sewer)
  if dz.valid then
    dz:AddReplayLockout(eq.seconds("5m"))
  end
end

function event_say(e)
  local char_id = e.other:CharacterID()

  local sewer_flag_key = string.format("%s-god_sewers", char_id)
  local sewers_flag = tonumber(eq.get_data(sewer_flag_key)) or 0

  local snplant_complete     = (eq.get_data(string.format("%s-god_snplant", char_id)) == "1")
  local sncrematory_complete = (eq.get_data(string.format("%s-god_sncrematory", char_id)) == "1")
  local snlair_complete      = (eq.get_data(string.format("%s-god_snlair", char_id)) == "1")
  local snpool_complete      = (eq.get_data(string.format("%s-god_snpool", char_id)) == "1")

  eq.debug(string.format("god_sewers[%s] snplant[%s] sncrematory[%s] snlair[%s] snpool[%s]",
           sewers_flag, tostring(snplant_complete), tostring(sncrematory_complete), tostring(snlair_complete), tostring(snpool_complete)))

  if e.message:findi("hail") then
    if sewers_flag == 0 then
      e.other:Message(MT.NPCQuestSay, "High Priest Diru tells you, 'These are sad times.  Not only have the invaders taken away all that we own, but our own problems still occur.  If only there was someone willing to help our cause.  I beg of you, please, help us with all the problems going on in the sewers underneath this city.  They have become the breeding grounds for stonemites.  These nasty bugs get into everything.  They eat our stored food and our crops.  We need to terminate the source of the stonemites so that we will have enough food to survive.  The invaders do not provide enough for us, and we need these crops to live.  Please prepare and talk to me again when you are ready to help.'")
      eq.set_data(sewer_flag_key, "1") -- preflag
    elseif sewers_flag == 1 and not snplant_complete then
      e.other:Message(MT.NPCQuestSay, "High Priest Diru tells you, 'Go find Ansharu.  He has been researching their behavior patterns, and will be able to tell you what needs to be done.  I hope that you will be able to help us out in these dire times.  Please head to the sewer plant and find the source of the stonemite infestation.  If you do this for us, I will share with you how to pass through the mountains and up to the temples created by the trusik, our exiled kin.'")
      create_sewer_expedition(e.other, sewers.snplant)
    elseif sewers_flag == 1 then
      e.other:Message(MT.NPCQuestSay, "High Priest Diru tells you, 'You defeated the Kayserops?  I had my doubts about your kind, but it seems we can trust you with our affairs.  I will reveal to you how to pass through the mountains, but first you will need to help us with another problem, a sacred one.  In the past, Taelosians were sent to the crematory on death.  Here their souls were separated from their bodies and imbued into the Spiritstone.  However, since the invaders came, those that had expected to be part of the Spiritstone were robbed of that right as they died with no one able to conduct the final ceremony.  They are angry because they must spend eternity in limbo, looking for a way to become a part of the Spiritstone.  We must set their spirits at ease.  Please talk to me again when you are ready and I will give you more information on the matter.'")
      eq.set_data(sewer_flag_key, "2")
    elseif sewers_flag == 2 and not sncrematory_complete then
      e.other:Message(MT.NPCQuestSay, "High Priest Diru tells you, 'I know that you can do this for us.  I have seen your action in this city and have heard of them on the rest of the continent.  Please set the spirits of the fallen at ease.  Seek out a way to into the crematory, find the remains of Ngozi, Mabiki, Talokoi, and Yogundi.   Take the remains into the furnace and their spirits will present themselves.  All will become clear when the time has come.'")
      create_sewer_expedition(e.other, sewers.sncrematory)
    elseif sewers_flag == 2 then
      e.other:Message(MT.NPCQuestSay, "High Priest Diru tells you, 'Your reputation precedes you.  I have heard of your exploits in the crematory.  It warms my heart to know that those spirits will now be at ease after a lifetime of misery.  I was going to tell you of the way through the mountains, but an emergency has come up.  You must hurry back down into the sewers.  It seems there was one who thought that he could get the purification devices working again.  He has gone down to fix whatever was wrong with it.  He should have returned by now, but no one has heard from him.  After you have prepared come talk to me again, and I will give you more information on the matter.'")
      eq.set_data(sewer_flag_key, "3")
    elseif sewers_flag == 3 and not snlair_complete then
      e.other:Message(MT.NPCQuestSay, "High Priest Diru tells you, 'Our sewer system was an integral part of the city before the great explosion. After the sewer system was deserted by most Taelosians, many of the processes that occurred below the city ceased to work.  In the sewers, many insects, animals, and other slimy diseased creatures thrive.  Take this seal.  I know that Alej is very timid and may think you are there to harm him unless he sees something familiar from you.  Please be careful while you\'re down there and be on the look out for cave-ins.'")
      e.other:SummonItem(68298) -- Item: Seal of the Nihil High Priest
      create_sewer_expedition(e.other, sewers.snlair)
    elseif sewers_flag == 3 then
      e.other:Message(MT.NPCQuestSay, "High Priest Diru tells you, 'Thank you so much for finding our fallen.  You will be happy to know that he has returned safely for a moment, but insisted on going back down to check on the status of things.  He really wants to try and make all of that machinery work again to help purify all the waters.  As promised, I will tell you how to get through the mountain pass safely.  To get through you will need to... talk to the city map maker.  The only issue with this is that he is in the sewers.  He was banished there by the Muramites.  If you go to the area of the sewers that has the large pool, you should be able to find him.  Talk to me again when you are ready and I will give you more information.'")
      eq.set_data(sewer_flag_key, "4")
    elseif sewers_flag == 4 and not snpool_complete then
      e.other:Message(MT.NPCQuestSay, "High Priest Diru tells you, 'Utandi, the map maker, should be in the sewers.  I must apologize for him in advance.  He is wonderful with his maps, but very timid.  Good luck and I hope that we can stand together, defiant against the invaders.'")
      create_sewer_expedition(e.other, sewers.snpool)
    elseif sewers_flag >= 4 then
      e.other:Message(MT.NPCQuestSay, "High Priest Diru tells you, 'You have done excellent work helping our tribe.  You and your kind are powerful and have done more for us than we expected, so I will reward you with the information you've been wanting.  In order to pass through the mountains, you must work with those who have the most sacred knowledge of our lands -- the master stonespiritists.  You will find an apprentice in Barindu, named Udranda.  She will grant you access to the mountain pass and then tell you what you must do.  Also, if you ever need to go back into the sewers for any reason, you can ask Gamesh to show you the way through.  Good luck to you, and to us all.'")
      eq.set_global("god_vxed_access", "1", 5, "F")	-- finished with sewers (had to talk to priest otherwise vxed was a "temporary" flag)
    end
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
