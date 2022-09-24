-- items: 13171
function event_say(e)

	local qglobals = eq.get_qglobals(e.other);
	
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s.  What brings you to the Tin Soldier?  We have the finest in previously owned weapons and armor.  Feel free to browse.",e.other:GetName()));
	elseif(e.message:findi("tax collection") and qglobals.tax_collection ~= nil) then
		e.self:Say(string.format("Here are the taxes, %s. Boy, you call the guards and they take their time to show up but be a few days late on your taxes and they send the goons after you. Sheesh!",e.other:GetName()));
		e.other:Faction(291,-10,0); -- Faction: Merchants of Qeynos
		e.other:SummonItem(13171); -- Item: Sedder's Tax Payment
	end
	
end
