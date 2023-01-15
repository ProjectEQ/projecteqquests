-- items: 11197, 11445, 11448, 11474, 11576, 11596, 11619, 11599, 12596, 16753, 12665, 47100, 15836, 16147, 16451, 16334, 16576, 11425, 11179, 11419, 11044, 11282, 11200, 11433, 11148, 11413, 11194, 11424, 11279, 11436, 11166, 11418, 11095, 11299, 11102, 11412, 11439, 16675, 16623
function event_say(e)
  local qglobals = eq.get_qglobals(e.other);

  if (e.message:findi("final task") and qglobals["wiz_epic"] == "4") then
    e.self:Say("Your first task is to take the right half of the orb to the highest point achieved by a wizards spire on Norrath. On the western prong, you will find a small tear in space. Place the orb inside this tear; it will absorb the pure essence of teleportation. The second task will take you to the highest point achieved by a wizards spire on Luclin. Find another tear in space there and absorb that essence as well. Return to me with both halves imbued with the proper essence and hand them to me, along with your staff.");
  elseif (e.message:findi("hail") and e.other:HasItem(12665)) then -- Item: Staff of Prismatic Power
    e.self:Say("The power of the wizard courses through your veins thoroughly, ever in search of the opportunity to harness even more power. You have created a staff of immense power, yet even in its glory, is limited. To unleash the full potential of this weapon will be a large undertaking of its own. You must obtain a globe of pure discordant energy and return it to me. Look for assistance from the Plane of Discord from Grathnok Gilforgan. I know not where this being may be, but I do know that once you find him, he will be willing to assist you in finding the globe you seek.");
    if (qglobals["wiz_epic20"] == nil) then
      eq.set_global("wiz_epic20", "1", 5, "F"); -- Start epic 2.0
    end
  elseif (e.message:findi("hail") and e.other:HasItem(14341)) then -- Item: Staff of the Four
    if (qglobals["wiz_epic"] == nil) then
      e.self:Say("The fire of destruction burns within you, does it not? I can see that your affinity for destructive magic has served you well in your travels. It has served you so well that it has caught the eye of Solusek Ro. He has created and sent me here to discuss the matter of joining his legions. If you do, you will be granted power unheard of on mortal lands. Will you [" .. eq.say_link("agree") .. "]?");
      eq.set_global("wiz_epic","1",5,"F"); -- Start epic 1.5, Step 1 of 5
    end
  elseif (e.message:findi("hail") and e.other:GetClass() == 12 and e.other:GetLevel() >= 65) then
    if (qglobals["wiz_epic"] == nil and qglobals["wiz_epic_pre"] == nil) then
      e.self:Say("The fire of destruction burns within you, does it not? I can see that your affinity for destructive magic has served you well in your travels. It has served you so well that it has caught the eye of Solusek Ro. He has created and sent me here to discuss the matter of joining his legions. If you do, you will be granted power unheard of on mortal lands. Will you [" .. eq.say_link("agree") .. "]?");
      eq.set_global("wiz_epic_pre","1",5,"F"); -- Start pre 1.5 epic
    elseif (qglobals["wiz_epic_pre"] == "5") then -- Test of Subtlety complete
      e.self:Say("You have completed the four tests of your abilities, but your journey to joining Solusek's legion is far from complete. You must now assemble a wand to help further focus your energies. In the lands of Discord, power surges and fades in an awesome display, the fluxing power flows through all things on the landscape. Go, investigate the lands of Discord; return to me with a [" .. eq.say_link("fluxing rod") .. "], [" .. eq.say_link("gem") .. "], [" .. eq.say_link("rune") .. "], and [" .. eq.say_link("ore") .. "]. With them you will be ready to take your first steps as a new soldier.");
      eq.delete_global("wiz_epic_pre"); -- Finished pre 1.5
      eq.set_global("wiz_epic","1",5,"F"); -- Start epic 1.5, Step 1 of 5
    else
      e.self:Say("The fire of destruction burns within you, does it not? I can see that your affinity for destructive magic has served you well in your travels. It has served you so well that it has caught the eye of Solusek Ro. He has created and sent me here to discuss the matter of joining his legions. If you do, you will be granted power unheard of on mortal lands. Will you [" .. eq.say_link("agree") .. "]?");
    end
  elseif (e.message:findi("agree")) then
    if (qglobals["wiz_epic_pre"] ~= nil) then -- Working on pre 1.5
      e.self:Say("I knew you would... What wizard could refuse an offer of such power? Since you have proven yourself only through combat and not yet through adventuring, I require you to prove yourself worthy once more. A small set of [" .. eq.say_link("tests") .. "], really.");
    elseif (qglobals["wiz_epic"] == "1") then -- Working on 1.5
      e.self:Say("You have completed the tests of your abilities, but your journey to joining Solusek's legion is far from complete. You must now assemble a wand to help further focus your energies. In the lands of Discord power surges and fades in an awesome display, the fluxing power flows thru all things in the landscape. Go, investigate the lands of Discord; return to me with a [" .. eq.say_link("fluxing rod") .. "], [" .. eq.say_link("gem") .. "], [" .. eq.say_link("rune") .. "], and [" .. eq.say_link("ore") .. "]. With them you will be ready to take your first steps as a new soldier.");
    end
  elseif (e.message:findi("fluxing rod")) then
    e.self:Say("The rod that will be used to create the foundation for the staff can only be found in the place where magic tears and screams across the landscape. Only in the plane where discord reigns does the power exist to charge the rod properly. A race that has been recently discovered there has been seen carrying around rods of super charged discordant magic. We are unsure of their origin, but we believe the rods hold a great, yet unknown power worthy of use in this staff.");
  elseif (e.message:findi("gem")) then
    e.self:Say("Fluxing gems have been found growing in the desert of Luclin. They form from the sand that has been blasted by magic. Sun Revenants have been known to collect them. Go to the plateau, and speak the word proclaim your desire to take their gems, this will draw out the elite revenants, one of them should be carrying the fluxing gem.");
  elseif (e.message:findi("rune")) then
    e.self:Say("Fluxing runes are carried by the army of Terris Thule. These runes help her minions slip into their victim's dreams more easily. I believe you would be able to find one being carried by the lord of the hobgoblins.");
  elseif (e.message:findi("ore")) then
    e.self:Say("It shouldn't be too hard to find some fluxing ore in an area we have termed the Ruined City of Dranik. Look in areas where one might expect to find ore-veins. Look on the mountain sides, beneath cliffs, even among the loose pieces of rock in the area.");
  elseif (e.message:findi("powerful item") and qglobals.wiz_epic == "2") then
    e.self:Say("To lay hands on this staff you will have to construct it of items of this world. Power is not given out freely, you must earn it. You will be pressed to the limits of your knowledge and abilities. To begin you will need to gather the fires of Solusek himself. These fires burn in the deepest part of the dungeons named after him. The pure flame burns near the runes. Bring it to me to examine when you get it.");
  elseif (e.message:findi("tests")) then
    e.self:Say("The tests I require of you are merely to measure your ability as a wizard and follower of Solusek. They will draw upon the focal points of being a wizard. Through intelligence and its application to magic, you can call upon the elements more often without strain. Through subtlety, you are able to be destructive without calling the attention unto yourself. Through research, new, more powerful spells and incantations are discovered. Through channeling, the ability to concentrate on spells is enhanced, even in the most distracting of environments. Once you have completed these tests, return to me with the results, so that I may review them.");
  elseif (e.message:findi("test of intelligence")) then
    if (qglobals["wiz_epic_pre"] == "1" and qglobals["wiz_test_intel"] == nil) then
      e.self:Say("Through the intelligent use of magic, we are able to become more efficient at what we do. To prove to me that you have this gift, I will need you to work your way through a set of riddles. These riddles will take you full circle, beginning with me and ending with me. The path between those two points must be discovered by your own mettle. Take this note and do as it instructs. Take care when handling these notes, they are the lifeblood that will guide you on your journey and should you lose them, you will fail the test. I hope to see you back here with the correct answer soon.");
      e.other:SummonItem(11197); -- Item: Old Parchment
      eq.set_global("wiz_test_intel","1",5,"F"); -- Start Test of Intelligence
    elseif (qglobals["wiz_epic_pre"] > "1") then
      e.self:Say("You have already successfully completed this test of your abilities! Waste no more time, young wizard, continue on with the other tasks that have been entrusted to you!");
    end
  elseif (e.message:findi("test of channeling")) then
    if (qglobals["wiz_epic_pre"] == "2") then
      e.self:Say("In the fortress of the sarnak, amidst some old bones, you will find a small, cursed trinket that I require you to obtain. I say that it is cursed because any that try to take it are surrounded in a swarm of scorpions. The scorpions are small and not dangerous by themselves, but when a hundred of them engulf your body, you can't stand but to run away. With your proficiency in channeling, you must go and retrieve this trinket for me. Prepare yourself for the curse will land on you and only by cutting through them will you find it.");
    elseif (qglobals["wiz_epic_pre"] > "2") then
      e.self:Say("You have already successfully completed this test of your abilities! Waste no more time, young wizard, continue on with the other tasks that have been entrusted to you!");
    end
  elseif (e.message:findi("test of research")) then
    if (qglobals["wiz_epic_pre"] == "3") then
      e.self:Say("Our ranks simply cannot be filled with slouches! We need to know that you will take the time and effort to be an effective wizard, not only for your own preservation, but also to be a contributor to our cause. You will be required to create a new spell. The research will be difficult, the runes many, but through cascade, coruscation, flash, desiccation, glint, impulse, synergy, tempest, vortex, and conflagration, you will find the path that burns deep within you. As with all spells, keep in mind the runes must be combined in a spell research kit. When you have crafted the spell, return it to me so that I may inspect it.");
    elseif (qglobals["wiz_epic_pre"] > "3") then
      e.self:Say("You have already successfully completed this test of your abilities! Waste no more time, young wizard, continue on with the other tasks that have been entrusted to you!");
    end
  elseif (e.message:findi("test of subtlety")) then
    if (qglobals["wiz_epic_pre"] == "4") then
      e.self:Say("In Steamfont you will find a friend of mine, Yama Twerik, with a bit of a dilemma on his hands. He was able to bring a non-functional clockwork back to Ak`Anon from the Plane of Innovation. He is by no means a wizard, so he needs help recharging the battery of the clockwork to get it working again. Go see, he will discuss with you the details of his predicament.");
    elseif (qglobals["wiz_epic_pre"] > "4") then
      e.self:Say("You have already successfully completed this test of your abilities! Waste no more time, young wizard, continue on with the other tasks that have been entrusted to you!");
    end
  end
end

function event_trade(e)
  local qglobals = eq.get_qglobals(e.other);
  local item_lib = require("items");

  if (item_lib.check_turn_in(e.trade, {item1 = 11445, item2 = 11448, item3 = 11474, item4 = 11576})) then -- Item: Fluxing Staff
    e.self:Say("You are indeed ready to join the ranks as a soldier of Solusek Ro. Every soldier in Solusek's league must wield a staff of power, which will focus your abilities in a way that you have never felt before! Fear will consume you as you feel your essence being ripped from your body. Do not give up, use the staff with faith and hope that you will be rewarded with the most [" .. eq.say_link("powerful item") .. "] you could ever imagine.");
    e.other:SummonItem(11596); -- Item: Staff of Fluxing Power
    eq.set_global("wiz_epic","2",5,"F"); --1.5 Progression Flag, Step 2 of 5
  elseif (item_lib.check_turn_in(e.trade, {item1 = 11619})) then -- Item: Wisp of Pure Flame
    e.self:Say("You have obtained the pure flame? That was impressive how quickly you did it, the other wizards I am recruiting have not returned yet. Back to the recruitment, you will need pure ice. The ice is coldest in the wastes of Velious. Retrieve this pure ice and bring it back to me.");
    e.other:SummonItem(11619); -- Item: Wisp of Pure Flame
    if(qglobals.wiz_epic == "2") then
      eq.set_global("wiz_epic_wisp","1",5,"F");
    end
  elseif (item_lib.check_turn_in(e.trade, {item1 = 11599})) then -- Item: Shard of Pure Ice
    e.self:Say("I can see the pure ice is in your possession. Take care while handling it because it is fragile. To infuse the staff with the powers you have attained you will need to retrieve a tapestry bag from the weavers in the Plane of Tranquility. Go talk to Kalym; he should be able to help you.");
    e.other:SummonItem(11599); -- Item: Shard of Pure Ice
    if(qglobals.wiz_epic == "2") then
      eq.set_global("wiz_epic_shard","1",5,"F");
    end
  elseif (item_lib.check_turn_in(e.trade, {item1 = 12596})) then -- Item: Silken Tapestry Satchel
    e.self:Say("So you got the tapestry satchel, did you? Good, you can begin to retrieve the final portions of the staff. I cannot tell you where exactly, but you will have to find four differently colored fragments. These fragments will circle your staff and feed it power. Think of them as the staff's own familiars. These crystal fragments only grow on the ground that has not seen footsteps for some time. The vibration in the ground is enough to destroy these delicate shards. When combined though, they will form a material harder than diamond. Once you have the four pieces, place them in your tapestry satchel along with the fluxing staff, a cohesion gem, and the two elements that you gathered previously, and then return with it to me");
    eq.set_global("wiz_epic_satchel","1",5,"F");
    eq.set_global("wiz_epic","4",5,"F");
    eq.delete_global("wiz_epic_wisp");
    eq.delete_global("wiz_epic_shard");
    e.other:SummonItem(12596); -- Item: Silken Tapestry Satchel
  elseif (item_lib.check_turn_in(e.trade, {item1 = 16753})) then -- Item: Full Tapestry Satchel
    e.self:Emote("removes the components from the tapestry satchel they begin to vibrate with power. They pulse quickly as they move towards each other, static flies in each direction as the pieces fuse into each other. In a final burst of magic the staff is complete. Talwyn looks it over with wise eyes before giving it to you.");
    e.self:Say("The staff of power is yours to wield. If you are up to the task I can set you on the final portions of what is needed to become a true avatar of Solusek.");
    eq.set_global("wiz_epic","5",5,"F");  -- Final Flag for Quest Completion == 6
    eq.delete_global("wiz_epic_satchel");
    e.other:SummonItem(12665); -- Item: Staff of Prismatic Power, Wizard 1.5
    e.other:AddAAPoints(5);
    e.other:Ding();
    e.other:Message(15,'You have gained 5 ability points!');
  elseif (qglobals["wiz_epic20"] ~= nil and qglobals["wiz_epic20"] >= "3" and item_lib.check_turn_in(e.trade, {item1 = 47100})) then -- Item: Globe of Discordant Energy
    e.self:Say("To obtain this globe was no trivial task, yet you have prevailed! Your staff is nearly complete now, you have only two final tasks remaining.', he says as he begins to murmur a brief incantation. Without warning, the orb splits into two equal halves and are then given to you. They will infuse your staff with one of the most useful powers of a wizard; teleportation.'");
    e.other:SummonItem(15836); -- Item: Broken Orb of Discordant Energy
    e.other:SummonItem(16147); -- Item: Broken Orb of Discordant Energy
    eq.set_global("wiz_epic20", "4", 5, "F"); -- flag for talking
  elseif (qglobals["wiz_epic20"] == "4" and item_lib.check_turn_in(e.trade, {item1 = 16451, item2 = 16334, item3 = 12665})) then
    e.self:Say("With these Infused Orbs, your path to becoming a soldier of Solusek's legions has been completed. You have surpassed even my expectations!' he says. You hear Talwyn chant in low, almost inaudible tones. His hands glow bright with power as he assembles a weapon worthy of Solusek himself. 'Take this staff as a symbol of your loyalty to Solusek and wield it proudly, wizard!");
    e.other:SummonItem(16576); -- Item: Staff of Phenomenal Power, Wiz 2.0
    e.other:AddAAPoints(10);
    e.other:Ding();
    e.other:Message(15, 'You have gained 10 ability points!');
  elseif (qglobals["wiz_test_intel"] ~= nil) then -- 10 items for Test of Intelligence in order
    if (qglobals["wiz_test_intel"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 11425})) then -- Item: Empty Jug
      e.self:Say("Excellent, you are impressing me more and more with each passing day. This note will begin the next riddle that you will need to solve. Return to me with the correct answer to continue your journey. Again, I remind you, take care when handling these notes, they are the lifeblood that will guide you on your journey and should you lose them, you will fail the test. I hope to see you back here with the correct answer soon.");
      e.other:SummonItem(11179); -- Item: Old Parchment
      eq.set_global("wiz_test_intel","2",5,"F");
    elseif (qglobals["wiz_test_intel"] == "2" and item_lib.check_turn_in(e.trade, {item1 = 11419})) then -- Item: Emerald-Tipped Staff
      e.self:Say("Excellent, you are impressing me more and more with each passing day. This note will begin the next riddle that you will need to solve. Return to me with the correct answer to continue your journey. Again, I remind you, take care when handling these notes, they are the lifeblood that will guide you on your journey and should you lose them, you will fail the test. I hope to see you back here with the correct answer soon.");
      e.other:SummonItem(11044); -- Item: Old Parchment
      eq.set_global("wiz_test_intel","3",5,"F");
    elseif (qglobals["wiz_test_intel"] == "3" and item_lib.check_turn_in(e.trade, {item1 = 11282})) then -- Item: Meditation Basket
      e.self:Say("Excellent, you are impressing me more and more with each passing day. This note will begin the next riddle that you will need to solve. Return to me with the correct answer to continue your journey. Again, I remind you, take care when handling these notes, they are the lifeblood that will guide you on your journey and should you lose them, you will fail the test. I hope to see you back here with the correct answer soon.");
      e.other:SummonItem(11200); -- Item: Old Parchment
      eq.set_global("wiz_test_intel","4",5,"F");
    elseif (qglobals["wiz_test_intel"] == "4" and item_lib.check_turn_in(e.trade, {item1 = 11433})) then -- Item: Platinum Token
      e.self:Say("Excellent, you are impressing me more and more with each passing day. This note will begin the next riddle that you will need to solve. Return to me with the correct answer to continue your journey. Again, I remind you, take care when handling these notes, they are the lifeblood that will guide you on your journey and should you lose them, you will fail the test. I hope to see you back here with the correct answer soon.");
      e.other:SummonItem(11148); -- Item: Old Parchment
      eq.set_global("wiz_test_intel","5",5,"F");
    elseif (qglobals["wiz_test_intel"] == "5" and item_lib.check_turn_in(e.trade, {item1 = 11413})) then -- Item: White Sash
      e.self:Say("Excellent, you are impressing me more and more with each passing day. This note will begin the next riddle that you will need to solve. Return to me with the correct answer to continue your journey. Again, I remind you, take care when handling these notes, they are the lifeblood that will guide you on your journey and should you lose them, you will fail the test. I hope to see you back here with the correct answer soon.");
      e.other:SummonItem(11194); -- Item: Old Parchment
      eq.set_global("wiz_test_intel","6",5,"F");
    elseif (qglobals["wiz_test_intel"] == "6" and item_lib.check_turn_in(e.trade, {item1 = 11424})) then -- Item: Golden Dagger
      e.self:Say("Excellent, you are impressing me more and more with each passing day. This note will begin the next riddle that you will need to solve. Return to me with the correct answer to continue your journey. Again, I remind you, take care when handling these notes, they are the lifeblood that will guide you on your journey and should you lose them, you will fail the test. I hope to see you back here with the correct answer soon.");
      e.other:SummonItem(11279); -- Item: Old Parchment
      eq.set_global("wiz_test_intel","7",5,"F");
    elseif (qglobals["wiz_test_intel"] == "7" and item_lib.check_turn_in(e.trade, {item1 = 11436})) then -- Item: Ivory Bone
      e.self:Say("Excellent, you are impressing me more and more with each passing day. This note will begin the next riddle that you will need to solve. Return to me with the correct answer to continue your journey. Again, I remind you, take care when handling these notes, they are the lifeblood that will guide you on your journey and should you lose them, you will fail the test. I hope to see you back here with the correct answer soon.");
      e.other:SummonItem(11166); -- Item: Old Parchment
      eq.set_global("wiz_test_intel","8",5,"F");
    elseif (qglobals["wiz_test_intel"] == "8" and item_lib.check_turn_in(e.trade, {item1 = 11418})) then -- Item: Red Cloth
      e.self:Say("Excellent, you are impressing me more and more with each passing day. This note will begin the next riddle that you will need to solve. Return to me with the correct answer to continue your journey. Again, I remind you, take care when handling these notes, they are the lifeblood that will guide you on your journey and should you lose them, you will fail the test. I hope to see you back here with the correct answer soon.");
      e.other:SummonItem(11095); -- Item: Old Parchment
      eq.set_global("wiz_test_intel","9",5,"F");
    elseif (qglobals["wiz_test_intel"] == "9" and item_lib.check_turn_in(e.trade, {item1 = 11299})) then -- Item: Worn Turban
      e.self:Say("Excellent, you are impressing me more and more with each passing day. This note will begin the next riddle that you will need to solve. Return to me with the correct answer to continue your journey. Again, I remind you, take care when handling these notes, they are the lifeblood that will guide you on your journey and should you lose them, you will fail the test. I hope to see you back here with the correct answer soon.");
      e.other:SummonItem(11102); -- Item: Old Parchment
      eq.set_global("wiz_test_intel","10",5,"F");
    elseif (qglobals["wiz_test_intel"] == "10" and item_lib.check_turn_in(e.trade, {item1 = 11412})) then -- Item: Old Pipe
      e.self:Say("Excellent work, wizard! There was once a time when I thought these puzzles could not be solved, but through perseverance and knowledge, you have passed the Test of Intelligence.");
      e.other:SummonItem(11439); -- Item: Rune of Greater Desiccation
      eq.delete_global("wiz_test_intel");
      eq.set_global("wiz_epic_pre","2",5,"F"); -- Test of Intelligence complete
    end
  elseif (qglobals["wiz_epic_pre"] == "2" and item_lib.check_turn_in(e.trade, {item1 = 16675})) then -- Item: Cursed Talisman
    e.self:Say("Your speed and concentration impress even me. The Test of Channeling is no easy feat to accomplish, especially with so many dangerous distractions nearby.");
    e.other:SummonItem(16675); -- Item: Cursed Talisman
    eq.set_global("wiz_epic_pre","3",5,"F"); -- Test of Channeling complete
  elseif ((qglobals["wiz_epic_pre"] == "3" or qglobals["wiz_epic_pre"] == "4") and item_lib.check_turn_in(e.trade, {item1 = 16623})) then -- Item: Spell: Electrical Charge
    e.self:Say("The Test of Research wears thin upon you, but with this parchment I hold in my hand, you have proven your worth as a contributor to the cause!");
    e.other:SummonItem(16623); -- Item: Spell: Electrical Charge
    eq.set_global("wiz_epic_pre","4",5,"F"); -- Test of Research complete
  end
  item_lib.return_items(e.self, e.other, e.trade);
end
