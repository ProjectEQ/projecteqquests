function event_spawn(e)
e.self:SetRunning(true);
end

function event_death_complete(e)
eq.signal(215450,5); --Signal to Air_Trigger
end
