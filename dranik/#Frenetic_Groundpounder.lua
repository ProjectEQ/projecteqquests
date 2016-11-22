--dranik/Frenetic_Groundpounder.lua
--Spawned as part of #Battlemaster_Rhorious.lua event

function event_death(e)
   eq.signal(336240,92); --Signal to Rhorious_Chest_Spawner.lua
end
