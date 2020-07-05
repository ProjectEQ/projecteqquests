-- items: 31828, 22570, 6949, 6950, 22571
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Make it a habit of walking into peoples rooms now do ya? Well seeing as I'm here on business I may have a [proposition] for you.");
	elseif(e.message:findi("proposition")) then
		e.self:Say("I'm in the employment of an alchemist that desires some rare venom from this region of Norrath. I will reward you with a special weapon treatment if you can return to me with a venomous spikefish poison sac, an ancient poison sac, an ancient snake fang, and the blood of a necromancer.");
	elseif(e.message:findi("special weapon treatment")) then
		e.self:Say("My employer has uncovered the secrets of the Bloodclaw and can reproduce the weapon treatment used in the forging of the legendary Stiletto of the Bloodclaw.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 31828,item2 = 22570, item3 = 6949,item4 = 6950})) then
		e.self:Say("There is the weapon treatment I promised you. Use it in a forge with either a Long Sword or a Scimitar. Choose which weapon you prefer carefully as there is only enough of the substance for a single treatment.");
		e.other:SummonItem(22571); -- Item: Thick Caustic Liquid
		e.other:Ding();
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
