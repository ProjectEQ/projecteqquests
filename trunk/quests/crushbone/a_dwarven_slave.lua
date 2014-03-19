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

	if(e.self:GetRace() == 8 and e.self:GetGender() == 0) then -- male dwarven slave
		if(item_lib.check_turn_in(e.trade, {copper = 1})) then
			e.self:Say("No, no!! I do not need this!! Get me key number 16!!");
		elseif(item_lib.check_turn_in(e.trade, {item1 = 20016})) then
			e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
			e.other:Ding();
			e.other:Faction(169,1,0);
			e.other:Faction(314,1,0);
			e.other:Faction(220,1,0);
			e.other:Faction(215,1,0);
			e.other:AddEXP(1000);
			e.other:GiveCash(0,7,3,0);
			eq.depop_with_timer();
		elseif(item_lib.check_turn_in(e.trade, {item1 = 10351})) then
			e.self:Say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			e.other:Ding();
			e.other:SummonItem(18905);
			e.other:AddEXP(1500);
			eq.depop_with_timer();		
		end
	elseif(e.self:GetRace() == 8 and e.self:GetGender() == 1) then -- female dwarven slave
		if(item_lib.check_turn_in(e.trade, {copper = 1})) then
			e.self:Say("What is this!!? Get me key number 17!!");
		elseif(item_lib.check_turn_in(e.trade, {item1 = 20017})) then
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
			e.other:SummonItem(18906);
			e.other:AddEXP(1500);
			eq.depop_with_timer();		
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end