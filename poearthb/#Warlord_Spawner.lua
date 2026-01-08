-- #Warlord_Spawner.lua
-- Spawns #Warlord_Gintolaken (222019) once all three Chieftains are dead.
-- Kill order does NOT matter. Debugging enabled.

local WARLORD_NPC_ID = 222019  -- #Warlord_Gintolaken

-- The three Chieftain NPC Type IDs that must all be dead
local CHIEFTAINS = {
    [222016] = "#War_Chieftan_Awisano",
    [222017] = "#War_Chieftan_Birak",
    [222018] = "#War_Chieftan_Galronar"
}

local function chieftain_status_dump()
    local el = eq.get_entity_list()
    local msg = "[DEBUG] Warlord_Spawner status: "

    for id, name in pairs(CHIEFTAINS) do
        local alive = el:IsMobSpawnedByNpcTypeID(id)
        msg = msg .. string.format("%s(%d)=%s  ", name, id, alive and "ALIVE" or "DEAD")
    end

    eq.zone_emote(MT.White, msg)
end

local function all_chieftains_dead()
    local el = eq.get_entity_list()
    for id, _ in pairs(CHIEFTAINS) do
        if el:IsMobSpawnedByNpcTypeID(id) then
            return false
        end
    end
    return true
end

function event_signal(e)
    eq.zone_emote(MT.White, string.format("[DEBUG] #Warlord_Spawner received signal %d", e.signal))

    -- Dump who is alive vs dead right now
    chieftain_status_dump()

    if all_chieftains_dead() then
        eq.zone_emote(MT.White, "[DEBUG] All three Chieftains are DEAD. Attempting to spawn #Warlord_Gintolaken...")

        local el = eq.get_entity_list()

        if not el:IsMobSpawnedByNpcTypeID(WARLORD_NPC_ID) then
            eq.zone_emote(MT.White, "[DEBUG] Spawning #Warlord_Gintolaken (222019) now!")
            eq.unique_spawn(WARLORD_NPC_ID, 0, 0, 415, 161, -55, 383)
        else
            eq.zone_emote(MT.White, "[DEBUG] Warlord already spawned — not spawning again.")
        end

        eq.zone_emote(MT.White, "[DEBUG] #Warlord_Spawner depopping — event complete.")
        eq.depop_with_timer()
    else
        eq.zone_emote(MT.White, "[DEBUG] Not all Chieftains are dead yet — waiting for more signals.")
    end
end
