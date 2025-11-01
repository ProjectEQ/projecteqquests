-- ================================================================
-- quests/global/global_npc.lua
-- Pet rename + PoP flags + Primal upgrade (global queue fallback) + AA rewards
-- ================================================================

local DEBUG_MODE = true
local PRIMAL_CHANCE = 100
local PRIMAL_OFFSET = 1000000
local death_queue = {}   -- holds {npc_id, time}

local function dbg(msg)
    if DEBUG_MODE then eq.debug("[GLOBAL_NPC] " .. msg, 1) end
end

------------------------------------------------------------
-- PET RENAME
------------------------------------------------------------
function event_spawn(e)
    if not e.self then return end
    local owner_id = e.self:GetOwnerID()
    if owner_id > 0 then
        eq.set_timer("Rename", 5000)
    end
end

function event_timer(e)
    if e.timer == "Rename" then
        eq.stop_timer("Rename")
        local el = eq.get_entity_list()
        if not el then return end
        local owner = el:GetClientByID(e.self:GetOwnerID())
        if owner then owner:SignalClient(2) end
        return
    end
    if e.timer == "PrimalScanner" then
        process_primal_queue()
    end
end

------------------------------------------------------------
-- CORE: PRIMAL UPGRADE ENGINE
------------------------------------------------------------
local function upgrade_corpse_items(corpse)
    if not corpse or not corpse:IsCorpse() then return end
    local npc_name = corpse:GetCleanName()
    dbg("Scanning corpse of " .. npc_name .. " for primals")

    local loot_table = corpse:GetLootTableID()
    if loot_table == 0 then return end

    local rows = eq.query_database(string.format([[
        SELECT item_id FROM lootdrop_entries
        WHERE lootdrop_id IN (
            SELECT lootdrop_id FROM loottable_entries WHERE loottable_id=%d
        )
    ]], loot_table))

    if not rows or #rows == 0 then return end

    for _, r in ipairs(rows) do
        local base_id = tonumber(r.item_id)
        if base_id and base_id > 0 then
            local primal_id = base_id + PRIMAL_OFFSET
            local check = eq.query_database(string.format("SELECT id FROM items WHERE id=%d", primal_id))
            if check and #check > 0 then
                local roll = math.random(100)
                if roll <= PRIMAL_CHANCE then
                    corpse:AddItem(primal_id, 1)
                    dbg(string.format("Added primal upgrade %d for %s", primal_id, npc_name))
                end
            end
        end
    end
end

------------------------------------------------------------
-- QUEUED CORPSE SCAN
------------------------------------------------------------
function process_primal_queue()
    if #death_queue == 0 then return end
    local now = os.time()
    local el = eq.get_entity_list()
    if not el then return end
    local corpse_list = el:GetCorpseList()
    if not corpse_list then return end

    for i = #death_queue, 1, -1 do
        local entry = death_queue[i]
        if now - entry.time >= 3 then
            local found = false
            for corpse in corpse_list.entries do
                if corpse and corpse:IsCorpse() and corpse:GetNPCTypeID() == entry.npc_id then
                    upgrade_corpse_items(corpse)
                    found = true
                    break
                end
            end
            if found then
                table.remove(death_queue, i)
            elseif now - entry.time > 10 then
                table.remove(death_queue, i) -- expire stale entry
            end
        end
    end
end

function event_death_complete(e)
    if not e.self or not e.self:IsNPC() then return end
    local npc_id = e.self:GetNPCTypeID()
    dbg("Death event queued for " .. e.self:GetCleanName() .. " (ID=" .. npc_id .. ")")
    table.insert(death_queue, {npc_id = npc_id, time = os.time()})

    -- Start the scanner timer if not already running
    eq.stop_timer("PrimalScanner")
    eq.set_timer("PrimalScanner", 2000) -- runs every 2s globally
end

------------------------------------------------------------
-- PLANE OF POWER FLAGS + AA REWARDS
------------------------------------------------------------
function event_killed_merit(e)
    local npc = e.self
    local client = e.other
    if not npc or not npc:IsNPC() or not client or not client:IsClient() then return end

    local function flag(name)
        eq.set_global(name, "1", 5, "F")
        client:Message(4, "You receive a character flag!")
        dbg("Flag granted: " .. name .. " to " .. client:GetName())
    end

    local id = npc:GetNPCTypeID()
    if id == 205091 then flag("pop_pod_grimmus_planar_projection") end
    if id == 206074 then flag("pop_poi_behometh_flag") end
    if id == 221008 then flag("pop_ponb_terris") end
    if id == 200055 then flag("pop_cod_bertox") end
    if id == 207001 then
        flag("pop_pot_saryrn")
        client:Message(12, "The Planar Projection flickers, grateful for Saryrn's fall.")
    end
    if id == 208074 then flag("pop_pov_aerin_dar") end
    if id == 209026 then
        flag("pop_bot_agnarr")
        client:Message(4, "Very good mortal... visit Karana upstairs.")
    end
    if id == 220006 then flag("pop_hohb_marr") end
    if id == 214083 then flag("pop_tactics_vallon") end
    if id == 214026 then flag("pop_tactics_tallon") end
    if id == 214113 then
        flag("pop_tactics_ralloz")
        eq.zone_emote(0, "Maelin Starpyre's thoughts enter your mind: 'Bring me the singed parchment of Rallos.'")
    end
    if id == 212014 then flag("pop_sol_ro_jiva") end
    if id == 212061 then flag("pop_sol_ro_dresolik") end
    if id == 212023 then flag("pop_sol_ro_arlyxir") end
    if id == 212026 then flag("pop_sol_ro_rizlona") end
    if id == 212055 then flag("pop_sol_ro_xuzl") end
    if id == 212025 then flag("pop_sol_ro_solusk") end

    if id == 223201 or id == 162227 or id == 124155 then
        client:AddAAPoints(1)
        client:Message(4, "You receive an Alternate Advancement point!")
        dbg("AA reward granted to " .. client:GetName())
    end
end
