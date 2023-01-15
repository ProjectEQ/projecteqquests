-- #Gnarlick (166275) for Hollowshade war
-- Wolf leader at fort

function event_death_complete(e)
    eq.signal(166257, 1000); -- zone reset signal
end

