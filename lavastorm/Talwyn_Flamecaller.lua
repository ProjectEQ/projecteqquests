function event_say(e)
	local qglobals = eq.get_qglobals(e.other);

	if(e.message:findi("hail") and e.other:HasItem(14341)) then
		if(qglobals["wiz_epic"] == nil) then
			e.self:Say("The fire of destruction burns within you, does it not? I can see that your affinity for destructive magic has served you well in your travels. It has served you so well that it has caught the eye of Solusek Ro. He has created and sent me here to discuss the matter of joining his legions. If you do, you will be granted power unheard of on mortal lands. Will you [" .. eq.say_link("agree") .. "]?");
			eq.set_global("wiz_epic","1",5,"F"); --Flagged to start epic, Step 1 of 5, Step 2 == \lavastorm\Talwyn_Flamecaller.lua line 31
		end
elseif(e.message:findi("agree")) then
		e.self:Say("You have completed the tests of your abilities, but your journey to joining Solusek's legion is far from complete. You must now assemble a wand to help further focus your energies. In the lands of Discord power surges and fades in an awesome display, the fluxing power flows thru all things in the landscape. Go, investigate the lands of Discord; return to me with a [" .. eq.say_link("fluxing rod") .. "], [" .. eq.say_link("gem") .. "], [" .. eq.say_link("rune") .. "], and [" .. eq.say_link("ore") .. "]. With them you will be ready to take your first steps as a new soldier.");
	elseif(e.message:findi("fluxing rod")) then
		e.self:Say("The rod that will be used to create the foundation for the staff can only be found in the place where magic tears and screams across the landscape. Only in the plane where discord reigns does the power exist to charge the rod properly. A race that has been recently discovered there has been seen carrying around rods of super charged discordant magic. We are unsure of their origin, but we believe the rods hold a great, yet unknown power worthy of use in this staff.");
	elseif(e.message:findi("gem")) then
		e.self:Say("Fluxing gems have been found growing in the desert of Luclin. They form from the sand that has been blasted by magic. Sun Revenants have been known to collect them. Go to the plateau, and speak the word proclaim your desire to take their gems, this will draw out the elite revenants, one of them should be carrying the fluxing gem.");
	elseif(e.message:findi("rune")) then
		e.self:Say("Fluxing runes are carried by the army of Terris Thule. These runes help her minions slip into their victim's dreams more easily. I believe you would be able to find one being carried by the lord of the hobgoblins.");
	elseif(e.message:findi("ore")) then
		e.self:Say("It shouldn't be too hard to find some fluxing ore in an area we have termed the Ruined City of Dranik. Look in areas where one might expect to find ore-veins. Look on the mountain sides, beneath cliffs, even among the loose pieces of rock in the area.");
	elseif(e.message:findi("powerful item")  and qglobals.wiz_epic == "2") then
		e.self:Say("To lay hands on this staff you will have to construct it of items of this world. Power is not given out freely, you must earn it. You will be pressed to the limits of your knowledge and abilities. To begin you will need to gather the fires of Solusek himself. These fires burn in the deepest part of the dungeons named after him. The pure flame burns near the runes. Bring it to me to examine when you get it.");
	elseif(e.message:findi("test")) then
		e.self:Say("no match");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 11445, item2 = 11448, item3 = 11474, item4 = 11576})) then --  Fluxing Staff
		e.self:Say("You are indeed ready to join the ranks as a soldier of Solusek Ro. Every soldier in Solusek's league must wield a staff of power, which will focus your abilities in a way that you have never felt before! Fear will consume you as you feel your essence being ripped from your body. Do not give up, use the staff with faith and hope that you will be rewarded with the most [" .. eq.say_link("powerful item") .. "] you could ever imagine.");
		e.other:SummonItem(11596);
		eq.set_global("wiz_epic","2",5,"F"); --1.5 Progression Flag, Step 2 of 5, next step 
	elseif(item_lib.check_turn_in(e.trade, {item1 = 11619})) then -- Wisp of Pure Flame
		e.self:Say("You have obtained the pure flame? That was impressive how quickly you did it, the other wizards I am recruiting have not returned yet. Back to the recruitment, you will need pure ice. The ice is coldest in the wastes of Velious. Retrieve this pure ice and bring it back to me.");
		e.other:SummonItem(11619);
		if(qglobals.wiz_epic == "2") then
			eq.set_global("wiz_epic_wisp","1",5,"F");
		end
	elseif(item_lib.check_turn_in(e.trade, {item1 = 11599})) then -- Shard of Pure Ice
		e.self:Say("I can see the pure ice is in your possession. Take care while handling it because it is fragile. To infuse the staff with the powers you have attained you will need to retrieve a tapestry bag from the weavers in the Plane of Tranquility. Go talk to Kalym; he should be able to help you.");
		e.other:SummonItem(11599);
		if(qglobals.wiz_epic == "2") then
			eq.set_global("wiz_epic_shard","1",5,"F");
		end
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12596})) then -- Silken Tapestry Satchel
		e.self:Say("So you got the tapestry satchel, did you? Good, you can begin to retrieve the final portions of the staff. I cannot tell you where exactly, but you will have to find four differently colored fragments. These fragments will circle your staff and feed it power. Think of them as the staff's own familiars. These crystal fragments only grow on the ground that has not seen footsteps for some time. The vibration in the ground is enough to destroy these delicate shards. When combined though, they will form a material harder than diamond. Once you have the four pieces, place them in your tapestry satchel along with the fluxing staff, a cohesion gem, and the two elements that you gathered previously, and then return with it to me");
		eq.set_global("wiz_epic_satchel","1",5,"F");
		eq.set_global("wiz_epic","4",5,"F");
		eq.delete_global("wiz_epic_wisp");
		eq.delete_global("wiz_epic_shard");
		e.other:SummonItem(12596);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 16753})) then -- Full Tapestry Satchel
		e.self:Emote("removes the components from the tapestry satchel they begin to vibrate with power. They pulse quickly as they move towards each other, static flies in each direction as the pieces fuse into each other. In a final burst of magic the staff is complete. Talwyn looks it over with wise eyes before giving it to you.");
		e.self:Say("The staff of power is yours to wield. If you are up to the task I can set you on the final portions of what is needed to become a true avatar of Solusek.");
		eq.set_global("wiz_epic","5",5,"F");  -- Final Flag for Quest Completion == 6
		eq.delete_global("wiz_epic_satchel");
		e.other:SummonItem(12665); -- Staff of Prismatic Power, Wizard 1.5
		e.other:AddAAPoints(5);
		e.other:Ding();
		e.other:Message(15,'You have gained 5 ability points!');
	end
	item_lib.return_items(e.self, e.other, e.trade);
end