function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s.  If you are looking for the way to South Qeynos, the passage through the city wall south of the cobbler's shop leads to the Merchant's Square near the Clock of Ak'Anon.",e.other:GetName()));
	end
end
