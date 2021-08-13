--#Altar_Sustainer (294617)
--Ikkinz Raid #4: Chambers of Destruction 


function event_death_complete(e)
eq.signal(294613,1); -- #Oracle_of_the_Altar (294613) signal to reduce regen
eq.signal(294613,2); -- #Oracle_of_the_Altar (294613) signal to reduce hp
end
