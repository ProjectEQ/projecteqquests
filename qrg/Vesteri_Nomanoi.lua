-- items: 18012, 13864
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s. I am Vesteri Namanoi. I provide training to the Jaggedpine Treefolk and their allies. If you are not busy, I would like to ask a small [favor] of you.",e.other:GetName()));
	elseif(e.message:findi("favor")) then
		e.self:Say("I need you to take this claim check to Qeynos for me. Nesiff Talaherd is a woodcarver who owns a shop in South Qeynos. I am having him carve a small statue of Tunare for Te'Anara. With my training schedule, I can not make the journey to Qeynos. Please give this claim check to Nesiff and bring the statue to me. It is a surprise, so please do not say anything to Te'Anara about it.");
		e.other:SummonItem(18012); -- Item: Claim Check
	end
end

function event_trade(e)
	local item_lib =require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13864})) then
		e.self:Say("Oh thank you so much! Here. Take this reward for your time. I will also tell Te'Anara of you.");
		e.other:Ding();
		e.other:Faction(272, 10,0); --Jaggedpine Treefolk
		e.other:Faction(302, 10,0); --Protectors of Pine
		e.other:Faction(343, 10,0); --QRG Protected Animals
		e.other:Faction(324, -30,0); --Unkempt Druids
		e.other:Faction(262, 10,0);   --Guards of Qeynos
		e.other:AddEXP(250);
		e.other:GiveCash(10,2,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
