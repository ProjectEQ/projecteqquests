function event_say(e)

	local tax = eq.get_qglobals(e.other);
	
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, adventurer!  A mighty warrior such as yourself deserves only the finest in armor and we here at Firepride's were trained by the finest dwarven smiths.  We shall be branching out and crafting [other items] soon, also.");
	elseif(e.message:findi("other items")) then
		e.self:Say("Well, soon I shall be showing my fantastic art inweapons making. I would hate to have the good people of Qeynos continue purchasing inferior weapons from that so-called blacksmith at [Ironforge Estates].");
	elseif(e.message:findi("ironforge estate")) then
		e.self:Say("The Ironforge family has called Qeynos their own for far too long. He was never trained inthe dwarven techniques as I was. He will not be cornering the weapons market very much longer.");
	elseif(e.message:findi("tax collection") and tax.tax_collection ~= not nil) then
		e.self:Say("Oh I see, Vicus has got some other sap to do his work. Fine. Here are your stinking taxes. If Kane were in charge, things would be different around here.");
		e.other:Faction(53,-10);
		e.other:SummonItem(13170);
	end
	
end

function event_trade(e)

	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 13129})) then
		local random_silver = math.random(8);
		e.self:Say("Ha! This is great. Here's your money, murderer! Hope the guards don't find you. Now get lost! Take the tunic. Maybe Garuc will reward you for such a vile deed. I sure don't want to keep it around here.");
		e.other:SummonItem(13134);
		e.other:Ding();
		e.other:Faction(135,-5,0);
		e.other:Faction(9,-5,0);
		e.other:Faction(53,5,0);
		e.other:Faction(33,5,0);
		e.other:Faction(217,-5,0);
		e.other:AddEXP(400);
		e.other:GiveCash(0,random_silver,0,0);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
	
end


