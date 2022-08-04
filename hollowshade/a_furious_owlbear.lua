-- a_furious_owlbear (166139) for Hollowshade war

-- signals for camp takeover when arrives at an undefended. everything else handled by coordinator.
function event_waypoint_arrive(e)
    local grid = e.self:GetGrid()
    -- signals are coded as (camp)(race)
    if (e.wp >= 14 and grid == 201) or (e.wp >= 16 and grid == 301) then
        eq.signal(166257, 11) -- change camp 1 (north) to race 1 (owlbear)
    elseif (e.wp >= 14 and grid == 102) or (e.wp >= 13 and grid == 302) then
        eq.signal(166257, 21) -- change camp 2 (east) to race 1 (owlbear)
    elseif (e.wp >= 15 and grid == 103) or (e.wp >= 12 and grid == 203) then
        eq.signal(166257, 31) -- change camp 3 (east) to race 1 (owlbear)
    end
end
    