-- a_sonic_wolf_fiend (166280) for Hollowshade war

-- signals for camp takeover when arrives at an undefended. everything else handled by coordinator.
function event_waypoint_arrive(e)
    local grid = e.self:GetGrid()
    -- signals are coded as (camp)(race)
    if (e.wp >= 14 and grid == 201) or (e.wp >= 16 and grid == 301) then
        eq.signal(166257, 12) -- change camp 1 (north) to race 2 (wolf)
    elseif (e.wp >= 14 and grid == 102) or (e.wp >= 13 and grid == 302) then
        eq.signal(166257, 22) -- change camp 2 (east) to race 2 (wolf)
    elseif (e.wp >= 15 and grid == 103) or (e.wp >= 12 and grid == 203) then
        eq.signal(166257, 32) -- change camp 3 (east) to race 2 (wolf)
    end
end
    