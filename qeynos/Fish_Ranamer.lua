-- items: 13178
function event_say(e)

	local qglobals = eq.get_qglobals(e.other);
	
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s!  Welcome to Fish's Ale. I am Fish Ranamer, owner of the joint.  Come in and have some brew but don't be startin' no trouble or Bruno will bust you open!",e.other:GetName()));
	elseif(e.message:findi("tax collection") and qglobals.tax_collection ~= nil) then
		e.self:Say("Taxes?! Taxes?! Tax me right out of business is what you folks are doing! Take your taxes and get out of my pub! Unless, of course, you care to buy some drinks...?");
		e.other:SummonItem(13178); -- Item: Ranamer's Tax Payment
		e.other:Faction(291,-10,0); -- Faction: Merchants of Qeynos
	end
	
end

function event_trade(e)

	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
	
end
