-- items: 15769
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);	
	if(e.message:findi("Violet Roses") and qglobals["mage_epic"] == "2" ) then --has 1.0
		e.self:Say("Oh? Yes. The tunips blow clockwise, or something or other. Here you go. Stay diligent. The enemy may be anyone.");
		e.other:SummonItem(15769); -- Item: Tome of Primal Fires
	end
end