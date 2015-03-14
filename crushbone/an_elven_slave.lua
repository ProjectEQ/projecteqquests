function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Slavedrivers are just lackeys for the [taskmaster]. He is the real orc in charge.");
	elseif(e.message:findi("taskmaster")) then
		e.self:Say("The taskmaster?? He is that large orc who runs around with that [bronze earring] in his ear.");
	elseif(e.message:findi("bronze earring")) then
		e.self:Say("Yeah, a bronze earring; He wears it like a newly crowned king. If I ever had that earring I know I would stand a chance at escape.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.self:GetRace() == 5 and e.self:GetGender() == 0) then -- male high elf slave
		if(item_lib.check_turn_in(e.trade, {copper = 1})) then
			e.self:Say("Not that!! I need key number 20!!");
		elseif(item_lib.check_turn_in(e.trade, {item1 = 20020})) then
			e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
			e.other:Ding();
			e.other:Faction(170,1,0);
			e.other:Faction(178,1,0);
			e.other:AddEXP(1000);
			e.other:GiveCash(0,7,3,0);
			eq.depop_with_timer();
		elseif(item_lib.check_turn_in(e.trade, {item1 = 10351})) then
			e.self:Say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			e.other:Ding();
			e.other:SummonItem(18901);
			e.other:AddEXP(1500);
			eq.depop_with_timer();		
		end
	elseif(e.self:GetRace() == 5 and e.self:GetGender() == 1) then -- female high elf slave
		if(item_lib.check_turn_in(e.trade, {copper = 1})) then
			e.self:Say("Please!! I need a key with a number 21!!");
		elseif(item_lib.check_turn_in(e.trade, {item1 = 20021})) then
			e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
			e.other:Ding();
			e.other:Faction(170,1,0);
			e.other:Faction(178,1,0);
			e.other:AddEXP(1000);
			e.other:GiveCash(0,7,3,0);
			eq.depop_with_timer();
		elseif(item_lib.check_turn_in(e.trade, {item1 = 10351})) then
			e.self:Say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			e.other:Ding();
			e.other:SummonItem(18902);
			e.other:AddEXP(1500);
			eq.depop_with_timer();		
		end
	elseif(e.self:GetRace() == 4 and e.self:GetGender() == 0) then -- male wood elf slave
		if(item_lib.check_turn_in(e.trade, {copper = 1})) then
			e.self:Say("Not that!! I need key number 18!!");
		elseif(item_lib.check_turn_in(e.trade, {item1 = 20018})) then
			e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
			e.other:Ding();
			e.other:Faction(99,1,0);
			e.other:Faction(174,1,0);
			e.other:Faction(212,1,0);
			e.other:AddEXP(1000);
			e.other:GiveCash(0,7,3,0);
			eq.depop_with_timer();
		elseif(item_lib.check_turn_in(e.trade, {item1 = 10351})) then
			e.self:Say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			e.other:Ding();
			e.other:SummonItem(18903);
			e.other:AddEXP(1500);
			eq.depop_with_timer();		
		end
	elseif(e.self:GetRace() == 4 and e.self:GetGender() == 1) then -- female wood elf slave
		if(item_lib.check_turn_in(e.trade, {copper = 1})) then
			e.self:Say("Please!! I need a key with a number 19!!");
		elseif(item_lib.check_turn_in(e.trade, {item1 = 20019})) then
			e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
			e.other:Ding();
			e.other:Faction(99,1,0);
			e.other:Faction(174,1,0);
			e.other:Faction(212,1,0);
			e.other:AddEXP(1000);
			e.other:GiveCash(0,7,3,0);
			eq.depop_with_timer();
		elseif(item_lib.check_turn_in(e.trade, {item1 = 10351})) then
			e.self:Say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			e.other:Ding();
			e.other:SummonItem(18904);
			e.other:AddEXP(1500);
			eq.depop_with_timer();		
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end