-- quests/bazaar/zone.lua
-- TraderCurrency System (Zone Controller with Countdown)
-- Rewards traders with Doubloons.
-- Shows per-player countdown every 5 seconds.

local REWARD_INTERVAL = 30    -- 30 seconds (testing mode)
local CHECK_INTERVAL  = 5     -- check every 5 seconds
local CURRENCY_ID     = 123   -- replace with your Doubloon currency_id

function event_spawn(e)
    eq.debug("Bazaar zone.lua loaded. TraderCurrency countdown active.", 1)
    eq.set_timer("check_traders", CHECK_INTERVAL * 1000)
end

function event_timer(e)
    if e.timer == "check_traders" then
        local client_list = eq.get_entity_list():GetClientList()
        if client_list == nil then return end

        for c in client_list.entries do
            if c.valid then
                local name = c:GetName()
                local char_id = c:CharacterID()
                local now = os.time()
                local last = tonumber(eq.get_data("doubloon_reward_" .. char_id)) or now
                local diff = now - last

                -- Detect trader mode
                local trader_flag = false
                local appearance = c:GetAppearance()

                if c.IsTrader ~= nil and c:IsTrader() then
                    trader_flag = true
                elseif c.GetTrader ~= nil and c:GetTrader() == 1 then
                    trader_flag = true
                elseif appearance == 115 then
                    trader_flag = true
                end

                if trader_flag then
                    if diff >= REWARD_INTERVAL then
                        -- Reward
                        c:AddAlternateCurrency(CURRENCY_ID, 1)
                        c:Message(15, ">> You earned 1 DOUBLOON for trader activity! <<")
                        eq.set_data("doubloon_reward_" .. char_id, tostring(now))
                    else
                        -- Show per-player countdown every 5 seconds
                        local remaining = REWARD_INTERVAL - diff
                        c:Message(11, string.format("Next Doubloon in %d sec", remaining))
                    end
                else
                    -- Optional debug so you can see non-traders too
                    -- c:Message(12, "[DEBUG] You are NOT in trader mode.")
                end
            end
        end
    end
end
