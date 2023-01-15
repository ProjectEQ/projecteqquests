-- items: 13179
function event_say(e)

	local qglobals = eq.get_qglobals(e.other);
	
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Oh, it's so nice to see you again %s. Why don't you have a look around and buy something nice for yourself today?",e.other:GetName()));
	elseif(e.message:findi("tax collection") and qglobals.tax_collection ~= nil) then
		e.self:Say(string.format("Oh dear. We had forgotten about those pesky taxes. Here you go, %s. Sorry you had to come collect them. We will try to be on time from now on.",e.other:GetName()));
		e.other:SummonItem(13179); -- Item: Tassen's Tax Payment
		e.other:Faction(291,-10,0); -- Faction: Merchants of Qeynos
	end
	
end

function event_trade(e)

	local item_lib =require("items");
	item_lib.return_items(e.self, e.other, e.trade)
	
end
