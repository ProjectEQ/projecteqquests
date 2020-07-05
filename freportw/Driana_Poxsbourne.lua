-- items: 1797, 1793
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail! %s, You best not be associating yourself with the likes of Najena.",e.other:GetName()));
	elseif(e.message:findi("reagent")) then
		e.self:Say("The infamous Mage, Najena employs several apprentices. These apprentices are most likely well equiped with just the reagents I need. Perhaps you can relieve them of their burden for me? Bring me 3 pouches of reagents from the Mages and you'll have the substance.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 1797,item2 = 1797,item3 = 1797})) then
		e.self:Say(string.format("Ahh wonderful work %s Here is the substance....don't spill it HAHAHAaahhahehehe...yes......you don't want to spill that heheh.",e.other:GetName()));
		e.other:SummonItem(1793); -- Putrid substance
		e.other:Ding();
		e.other:Faction(221,1,0); -- Bloodsabers
		e.other:Faction(296,1,0); -- Opal Dark Briar
		e.other:Faction(230,1,0); -- Corrupt Qeynos Guards
		e.other:Faction(262,-1,0); -- Guards of Qeynos
		e.other:Faction(341,-1,0); -- Priests of Life
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:freportw  -- Driana_Poxsbourne
