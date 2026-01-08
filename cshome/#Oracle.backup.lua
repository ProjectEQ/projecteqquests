--#####################################################################
-- NPC: Lockout Normalizer
-- File: #Oracle.lua (example)
--
-- Version History:
--   v1.1 - 2025-11-24
--     * Replaced eq.database with eq.query_sql and eq.execute_sql
--       for full compatibility (avoids nil 'database' field).
--     * Added comments and safety messages.
--
--   v1.0 - 2025-11-24
--     * Initial implementation of 9-hour clamp logic.
--
-- Purpose:
--   Ensures no expedition lockout (character_expedition_lockouts)
--   exceeds 9 hours. Any duration or expire_time beyond that limit
--   gets reduced automatically when the player says "normalize".
--#####################################################################

local SCRIPT_VERSION = "1.1"

local MAX_HOURS   = 9
local MAX_SECONDS = MAX_HOURS * 3600

function event_say(e)

    -------------------------------------------------------------
    -- Greeting
    -------------------------------------------------------------
    if e.message:findi("hail") then
        e.self:Say(
            string.format(
                "Hello %s. (Script v%s) I can normalize your expedition lockouts. " ..
                "No lockout will exceed %d hours. Say [normalize] to begin.",
                e.other:GetCleanName(), SCRIPT_VERSION, MAX_HOURS
            )
        )
        return
    end

    -------------------------------------------------------------
    -- Normalize Command
    -------------------------------------------------------------
    if e.message:findi("normalize") then

        if not e.other:IsClient() then
            e.self:Say("Only players may use this service.")
            return
        end

        local client = e.other:CastToClient()
        local charid = client:CharacterID()

        ---------------------------------------------------------
        -- Step 1: Check how many lockouts exceed 9 hours
        ---------------------------------------------------------
        local count_query = string.format([[
            SELECT COUNT(*) AS cnt
            FROM character_expedition_lockouts
            WHERE character_id = %d
              AND (
                   duration > %d
                OR TIMESTAMPDIFF(SECOND, NOW(), expire_time) > %d
              );
        ]], charid, MAX_SECONDS, MAX_SECONDS)

        local res = eq.query_sql(count_query)
        local count = 0
        if res and res[1] and res[1].cnt then
            count = tonumber(res[1].cnt)
        end

        if count == 0 then
            e.self:Say(
                string.format(
                    "All your lockouts are already within the %d-hour limit. Nothing to adjust.",
                    MAX_HOURS
                )
            )
            return
        end

        ---------------------------------------------------------
        -- Step 2: Perform the clamp
        ---------------------------------------------------------
        local update_query = string.format([[
            UPDATE character_expedition_lockouts
            SET
                duration = CASE
                    WHEN duration > %d THEN %d
                    ELSE duration
                END,
                expire_time = CASE
                    WHEN TIMESTAMPDIFF(SECOND, NOW(), expire_time) > %d
                    THEN DATE_ADD(NOW(), INTERVAL %d SECOND)
                    ELSE expire_time
                END
            WHERE character_id = %d;
        ]], MAX_SECONDS, MAX_SECONDS, MAX_SECONDS, MAX_SECONDS, charid)

        eq.execute_sql(update_query)

        ---------------------------------------------------------
        -- Step 3: Tell the player what happened
        ---------------------------------------------------------
        e.self:Say(
            string.format(
                "I have normalized %d of your lockout(s). No timer now exceeds %d hours.",
                count, MAX_HOURS
            )
        )
    end
end
