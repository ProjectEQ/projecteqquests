-- Rogue Epic NPC -- Eldreth (Lua version, fixed)
-- Zone: lakerathe
-- NPC ID: 51025
-- Items:
--   13087 = Bottle of Milk
--   28012 = Encoded Document
--   28053 = Scribbled Parchment (result)

local item_lib = require("items")

local MILK_ID   = 13087
local DOC_ID    = 28012
local RESULT_ID = 28053

-------------------------------------------------
-- DIALOGUE
-------------------------------------------------
function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("Go away! I'm busy! I don't have time for scoundrels like you! Leave me alone or I shall, um..turn you into, er, a fish or something! That is what us powerful wizards do to those who annoy us! Yes, that is it. A fish! Did that sound scary enough?")
    elseif e.message:findi("that was scary") then
        local race_name = e.other:GetRaceName() or "traveler"
        e.self:Say("Ha! I knew it. I could see you trembling! Everyone fears an angry wizard and nobody wants to be a fish. I know I detest fish, it is always fish fish fish around here. Fish cakes, fish stew, fish wine, I am sick of fish. But alas, while I am a powerful wizard, I am also a poor one. Oh well, good things come to those who wait. So, why are you here, " .. race_name .. "?")
    elseif e.message:findi("stanos sent me") then
        e.self:Say("Stanos? Stanos Herkanor? I thought he was long dead. He nearly got me killed, in any case. What does the old fool want of me now?")
    elseif e.message:findi("translate") then
        e.self:Say("Ah, codes are my specialty! It's what I did for the Circle before Hanns took over. But the Fox is wrong. I owe him nothing! As a fact, he owes me! He wants this translated - he will have to pay!")
    elseif e.message:findi("pay") then
        e.self:Say("Aye, pay, and pay you must. I need 100 platinum pieces to begin my work. This tower is old and drafty and it will take that much to make it bearable. And while you're at it, I need something else. Bring me two bottles of milk along with your 100 platinum, and I will translate anything you wish.")
    end
end

-------------------------------------------------
-- HELPERS
-------------------------------------------------

local function join_list(parts)
    local n = #parts
    if n == 0 then
        return ""
    elseif n == 1 then
        return parts[1]
    elseif n == 2 then
        return parts[1] .. " and " .. parts[2]
    else
        local s = ""
        for i = 1, n - 1 do
            s = s .. parts[i]
            if i < n - 1 then
                s = s .. ", "
            end
        end
        return s .. ", and " .. parts[n]
    end
end

-- Count specific items + raw coin for failure messages
local function analyze_trade(e)
    local milk_count = 0
    local doc_count  = 0

    for i = 1, 4 do
        local inst = e.trade["item" .. i]
        if inst and inst.valid then
            local id = inst:GetID()
            if id == MILK_ID then milk_count = milk_count + 1 end
            if id == DOC_ID  then doc_count  = doc_count  + 1 end
        end
    end

    local p = e.trade.platinum or 0
    local g = e.trade.gold     or 0
    local s = e.trade.silver   or 0
    local c = e.trade.copper   or 0

    return milk_count, doc_count, p, g, s, c
end

-------------------------------------------------
-- TRADE
-------------------------------------------------
function event_trade(e)
    local milk_count, doc_count, p, g, s, c = analyze_trade(e)

    -- SUCCESS: exactly what the original quest required:
    -- 100 platinum, 2 milk, 1 document (order doesn't matter)
    if item_lib.check_turn_in(e.trade, {
        item1    = DOC_ID,
        item2    = MILK_ID,
        item3    = MILK_ID,
        platinum = 100
    }) then
        e.self:Say("Hmm, interesting... This document is encoded and written in a very obscure variant of elder Teir'Dal. I can only partially translate it. Find Yendar and give him this.")

        -- Reward ONLY (do NOT return items here)
        e.other:SummonItem(RESULT_ID)  -- Scribbled Parchment
        e.other:AddEXP(500)
        return
    end

    -------------------------------------------------
    -- FAILURE: tell the player what’s missing
    -------------------------------------------------
    local missing = {}

    if p < 100 then
        table.insert(missing, (100 - p) .. " more platinum (and it must be platinum, not gold)")
    end
    if milk_count < 2 then
        table.insert(missing, "two bottles of milk")
    end
    if doc_count < 1 then
        table.insert(missing, "the encoded parchment you want translated")
    end

    if #missing > 0 then
        e.self:Say("No, no... this isn't right. I still need " .. join_list(missing) .. ". Bring me exactly what we agreed upon and THEN I shall work.")
    else
        e.self:Say("Something about this trade is wrong. Bring me 100 platinum, two bottles of milk, and the encoded parchment.")
    end

    -- On failure, give everything back (including coin)
    item_lib.return_items(e.self, e.other, e.trade)
end
