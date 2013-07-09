function event_say(e)
	local tax = eq.get_qglobals(e.self);
	
	if(e.message:findi("tax collection") and tax.tax_collection ~= nil) then
		e.self:Say("Taxes? How can I afford more taxes? You tax us poor merchants right out of Qeynos. Freeport is looking better and better every day.");
		e.other:SummonItem(13175);
		e.other:Faction(217,-10,0);
	end
	
end
