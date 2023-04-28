-- A_summoner_of_destruction - 1st

function event_signal(e)
	if e.signal == 1 then
		e.self:SetAppearance(3); -- Dead
	else
		e.self:SetAppearance(0); -- Stand Up
	end
end
