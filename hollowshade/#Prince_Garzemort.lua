-- #Prince_Garzemort (166277) for Hollowshade war
-- Grimling leader at fort

function event_death_complete(e)
    eq.signal(166257, 1000); -- zone reset signal
end

