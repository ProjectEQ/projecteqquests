function event_combat(e)
	if(e.joined) then
		if(math.random(2) == 1) then
			e.self:Say("" .. e.other:Race() .. "s like you are better left dead than alive.");
		else
			e.self:Say("You ssssshall know the horror of Cazic-Thule!");
		end
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Do you [know fear]?");
	elseif(e.message:findi("know fear")) then
		e.self:Say("That's great!");
	elseif(e.message:findi("know no fear")) then
		e.self:Say("YOU SSSSSSHALL! For I, Roror, High Prissst of Cazic-Thule, I sssshall teach you!");
		eq.attack(e.other:GetName());
	elseif(e.message:findi("bless my hay")) then
		e.self:Say("I require 66 gold coin and the hay in order to bless it.");
	elseif(e.message:findi("curse my hay")) then
		e.self:Say("I require 66 gold coin and the hay in order to curse it.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13990,gold = 66})) then
		e.other:SummonItem(14320);
		e.other:Ding();
		e.other:Faction(18,10,0);
		e.other:AddEXP(300);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end