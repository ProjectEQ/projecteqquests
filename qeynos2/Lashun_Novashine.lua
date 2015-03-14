function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Well met, %s. My name is Lashun Novashine and I am a humble priest of Rodcet Nife, the Prime Healer. I wish to spread His word to every corner of Norrath. My job gets more difficult each day with so many so willing to take lives rather than preserve them.",e.other:GetName()));
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 13 or e.wp == 14 or e.wp == 15) then
		e.self:Shout("Cease this endless conflict and seek salvation in the Temple of Life! The glory of Rodcet Nife awaits you!");
	elseif(e.wp == 57) then
		e.self:Say("Greetings, people of Qeynos! Are you lost? Has the chaotic life of an adventurer left you empty and alone? Seek redemption in the glorious light of the Prime Healer. Only through Rodcet Nife and the Temple of Life will you find true health and salvation.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local number_of_bone_chip = 0;
	local two_gold = 0;
	
	if(item_lib.check_turn_in(e.trade, {item1 = 13073,item2 = 13073,item3 = 13073,item4 = 13073})) then
		number_of_bone_chip = 4;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13073,item2 = 13073,item3 = 13073})) then
		number_of_bone_chip = 3;	
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13073,item2 = 13073})) then
		number_of_bone_chip = 2;	
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13073})) then
		number_of_bone_chip = 1;
	elseif(item_lib.check_turn_in(e.trade, {gold = 2})) then
		number_of_bone_chip = 1;
		two_gold = 1;
	end

	if(number_of_bone_chip >= 1) then
		e.other:Ding();
		e.self:CastSpell(17,e.other:GetID());
		repeat
			if(two_gold == 1) then
				e.self:Say("Thank you for the donation to the Temple of Life. May Rodcet Nife cleanse your body of all ills.");
				two_gold = 0;
			else
				e.self:Say("Very well, young one. May the light of the Prime Healer wash away your scars.");
			end
			e.other:Faction(257,2,0);
			e.other:Faction(183,2,0);
			e.other:Faction(135,2,0);
			e.other:Faction(21,-2,0);
			e.other:Faction(9,2,0);
			e.other:AddEXP(10);
			number_of_bone_chip = number_of_bone_chip - 1;
		until number_of_bone_chip == 0
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
