-- items: 17814, 10952, 10953
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings friend %s! I am a provider of the highest quality steel ore known to Norrath! This ore is in such demand that I often run low and find it difficult to restock my supplies. If you're [looking for a job] I will gladly pay you for some of your time.",e.other:GetName()));
	elseif(e.message:findi("looking for a job")) then
		e.self:Say("I need you to take this crate and fill it with either Small Bracks of Unrefined Ore or Large Bricks of Unrefined Ore then return it to me so that I may refine it and sell it. The unrefined ore that I require is often mined by the goblins in the ruins of Permafrost Keep.");
		e.other:SummonItem(17814) -- Empty Ore Crate
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 10952})) then
		local random_plat = math.random(7);
		e.self:Say(string.format("Why thank you, %s. If you do happen to come across any more of these, please bring them to me.",e.other:GetName()));
		e.other:Ding();
		e.other:Faction(121,10,0); -- Faction: Qeynos Citizens
		e.other:AddEXP(500);
		e.other:GiveCash(0,0,0,random_plat);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10953})) then
		local random_plat = math.random(15);
		e.self:Say(string.format("Why thank you, %s. If you do happen to come across any more of these, please bring them to me.",e.other:GetName()));
		e.other:Ding();
		e.other:Faction(121,10,0); -- Faction: Qeynos Citizens
		e.other:AddEXP(500);
		e.other:GiveCash(0,0,0,random_plat);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end
