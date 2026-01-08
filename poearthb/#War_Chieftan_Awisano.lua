-- #War_Chieftan_Awisano.lua
-- When this Chieftain dies, tell the Warlord spawner to re-check.
-- Kill order does NOT matter; the spawner decides when all 3 are dead.

local WARLORD_SPAWNER_NPCID = 222023  -- #Warlord_Spawner

function event_death_complete(e)
    eq.signal(WARLORD_SPAWNER_NPCID, 1)
end
