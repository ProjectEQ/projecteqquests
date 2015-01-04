-- Kyv Runner 1.5 Cleric Epic Quest // Harmony of the Soul


function event_combat(e)
	if(e.joined) then
		e.self:Say("Commander Votal will want to see this!");
	end
end

function event_death_complete(e)
	e.self:Emote("falls to the ground. It manages to wrap the note around an arrow and shoot it into the ground nearby where it is quickly picked up by a Muramite.");
end
