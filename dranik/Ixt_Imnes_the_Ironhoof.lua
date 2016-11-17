--dranik/Ixt_Imnes_the_Ironhoof.lua
--Spawned as part of #Battlemaster_Rhorious.lua event

function event_death(e)
  eq.signal(336240,90); --Signal to Rhorious_Chest_Spawner.lua
end
