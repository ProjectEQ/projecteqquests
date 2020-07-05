-- items: 20016, 10351, 18905, 20017, 18906
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
			e.other:Faction(274,2,0); -- Faction: Kazon Stormhammer
			e.other:Faction(293,1,0); -- Miners Guild 249 (293)
			e.other:Faction(227,2,0); -- Clerics of Underfoot (227)
			e.other:AddEXP(800);
			e.other:GiveCash(0,7,3,0);
			eq.depop_with_timer();
		elseif(item_lib.check_turn_in(e.trade, {item1 = 10351})) then
			e.self:Say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			e.other:Ding();
			e.other:SummonItem(18905); -- Item: Worn Rune
			e.other:AddEXP(5000);
			eq.depop_with_timer();		
		end
	elseif(e.self:GetRace() == 8 and e.self:GetGender() == 1) then -- female dwarven slave
		if(item_lib.check_turn_in(e.trade, {copper = 1})) then
			e.self:Say("What is this!!? Get me key number 17!!");
		elseif(item_lib.check_turn_in(e.trade, {item1 = 20017})) then
			e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
			e.other:Ding();
			e.other:Faction(274,1,0); -- Faction: Kazon Stormhammer
			e.other:Faction(312,2,0); -- Faction: Storm Guard
			e.other:Faction(293,1,0); -- Miners Guild 249 (293)
			e.other:Faction(290,1,0); -- Faction: Merchants of Kaladim
			e.other:Faction(232,-1,0); -- Faction: Craknek Warriors
			e.other:AddEXP(800);
			e.other:GiveCash(0,7,3,0);
			eq.depop_with_timer();
		elseif(item_lib.check_turn_in(e.trade, {item1 = 10351})) then
			e.self:Say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			e.other:Ding();
			e.other:SummonItem(18906); -- Item: Small Wood Carving
			e.other:AddEXP(5000);
			eq.depop_with_timer();		
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
