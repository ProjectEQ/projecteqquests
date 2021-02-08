-- items: 13861, 13862, 13002, 13007
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Pleased to meet you. %s. Have you seen how clear the water is underneath the Academy? All sorts of life could flourish there. What a shame there are no [Marr Minnows] there.",e.other:GetName()));
	elseif(e.message:findi("marr minnow")) then
		e.self:Say("The Marr Minnow swims in the pond near the Temple of Marr. I wish I had one. Not a dead one. A live one. I need someone to [get the minnow].");
	elseif(e.message:findi("get the minnow")) then
		e.self:Say("Please try. Here you are. Take this jar. Offer the jar to the minnows. Maybe they will swim into it.");
		e.other:SummonItem(13861); -- Item: Jar of Liquid
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13862})) then
		e.self:Say("");
		e.other:SummonItem(eq.ChooseRandom(13002,13007)); -- Item(s): Torch (13002), Ration (13007)
		e.other:Ding();
		e.other:Faction(220,5,0); -- Arcane Scientists
		e.other:Faction(281,1,0); -- Knights of Truth
		e.other:Faction(296,-1,0); -- Opal Dark Briar
		e.other:Faction(330,-1,0); -- Freeport Militia
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Palon_Deskeb
