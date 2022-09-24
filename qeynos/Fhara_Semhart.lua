-- items: 13175
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	
	if(e.message:findi("tax collection") and qglobals.tax_collection ~= nil) then
		e.self:Say("Taxes? How can I afford more taxes? You tax us poor merchants right out of Qeynos. Freeport is looking better and better every day.");
		e.other:SummonItem(13175); -- Item: Semhart's Tax Payment
		e.other:Faction(291,-10,0); -- Faction: Merchants of Qeynos
	end
	
end
