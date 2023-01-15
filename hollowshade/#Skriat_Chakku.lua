-- #Skriat_Chakku (166235) for Hollowshade war
-- Owlbear leader at fort

function event_death_complete(e)
    eq.signal(166257, 1000); -- zone reset signal
end

