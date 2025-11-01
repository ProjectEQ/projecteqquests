-- Urthon the Unbinder
-- NPC that unattunes items when given along with Urthron's Ultimate Unattuner (52024)
-- Easter Egg Bug: Giving multiple items + 1 unattuner will unattune all of them.

local UNATTUNER_ID = 52024

function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("Ah, greetings, adventurer! Hand me any attuned item along with an [Unattuner], and I shall sever the bond that ties it to your soul. I’m merely a temporary fix—until those lazy Arcane Engineers of Norrath finally sort out how to make the Unattuner function properly on its own. It’s only a matter of time… or perhaps *you* might be clever enough to solve it? Anyway, go see Merchant Tekrama to purchase the faulty device—I’ll handle the rest.")
    elseif e.message:findi("unattuner") then
        e.self:Say("A rare device forged in the fires of innovation! You can purchase one from select merchants for ~750 platinum. Bring it to me with your item, and I’ll do the rest — no questions asked.")
    end
end

function event_trade(e)
    local item_lib = require("items")
    local has_unattuner = false
    local unattune_targets = {}

    -- Loop through trade slots 1–4
    for slot = 1, 4 do
        local inst = e.trade["item" .. slot]
        if inst ~= nil and inst.valid then
            local id = inst:GetID()
            if id == UNATTUNER_ID then
                has_unattuner = true
            else
                table.insert(unattune_targets, id)
            end
        end
    end

    if has_unattuner and #unattune_targets > 0 then
        e.self:DoAnim(64)
        e.self:Emote("mutters arcane words as a flash of light surrounds the items.")
        e.self:Say("There... the attunement has been undone. May you tread new paths with them once more.")

        -- BUG FEATURE: If they hand in 3+ items, all get returned unattuned.
        for _, id in ipairs(unattune_targets) do
            e.other:SummonItem(id, 1)
        end

        e.other:Message(15, "All handed items have been unattuned! The Unattuner crumbles into dust.")
        -- Unattuner consumed automatically (not returned)

    elseif has_unattuner then
        e.self:Say("You must hand me at least one item to unattune, adventurer.")
        item_lib.return_items(e.self, e.other, e.trade)
    elseif #unattune_targets > 0 then
        e.self:Say("I require an Unattuner to perform the ritual, my friend.")
        item_lib.return_items(e.self, e.other, e.trade)
    else
        e.self:Say("I need both the Unattuner and an attuned item. Bring them to me and I’ll take care of the rest.")
    end
end
