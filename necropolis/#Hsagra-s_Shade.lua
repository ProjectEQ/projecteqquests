-- bard 1.5
-- items involved:
-- Cracked Dragon Bone (77608)
-- Dragon Claw Bone (77609)
-- Dragon Tail Bone (77610)
-- Dragon Wing Bone (77611)
--
-- NPCs triggered:
-- #Vesthon_Marijakin (123167)
-- a_mercenary_guard (123168)
-- a_Marijakin_acolyte (123169)
-- a_lumbering_zombie (123170)
function event_say(e)
    local qglobals = eq.get_qglobals(e.other)
    -- text implies you have collected stuff and only seen by the bard, neither of those assumptions are true though
    if qglobals["bard15"] == "2" and e.message:findi("hail") then
        e.self:Emote("'s shadowy eyes fall on your face for a moment.  She seems to be looking for something.  Her's head bows and you hear a soft voice inside your head.  Greetings young " .. e.other:GetName() .. ".  I thank you for gathering my relics.  Though I wish it were not necessary, I must drift further past the veil into a new existence.  Give me the shards of my broken body and I will take care of the rest.  You have the eternal gratitude of the first brood.")
    end
end

function event_trade(e)
    local item_lib = require("items")
    local qglobals = eq.get_qglobals(e.other)
    if qglobals["bard15"] == "2" then
        -- if you don't turn in everything it says "You must turn in all quest items at once in order to complete this quest."
        if item_lib.check_turn_in(e.trade, {item1 = 77608, item2 = 77609, item3 = 77610, item4 = 77611}) then
            e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 1)
            eq.zone_emote(15, "As you hold out the relics towards the spirit of Hsagra they begin to rise from your hands and glow softly.  They drift slowly through the air towards Hsagra and are soon enveloped in the shadow of her spirit.  The outline of Hsagra begins to glow softly along with the relics as she drifts towards the fiery pit of the necropolis.")
            eq.zone_emote(15, "Just as her spirit drifts to the edge of the pit, you feel a dark presence behind you.  Suddenly the draconic spirit before you quivers as if the spirit were drifting between realities.  The bones inside the spirit begin to grow dark and a black ethereal ooze begins to envelope them.  As the last of the calcified bone is covered in dark ether the bones are torn from the spirit causing a spasm of pain to jerk across her visage.  The screech of a thousand draconic voices echoes through the caverns of the necropolis in complete agony.")
            eq.zone_emote(15, "You hear a dark cackle slither through your ears and your eyes drift across the lingering trail of drifting black ooze back towards the opening of the cavern.")
            local vesthon = eq.spawn2(123167, 0, 0, -2653, -222, 12, 310) -- we'll emote off him later
            -- Alla says the mercs spawn later, but my capture says stuff spawns in this order
            -- merc guards
            eq.spawn2(123168, 0, 0, -2494, -5, 12, 370)
            eq.spawn2(123168, 0, 0, -2448, -30, 12, 381)
            eq.spawn2(123168, 0, 0, -2469, -3, 12, 382)
            eq.spawn2(123168, 0, 0, -2510, -19, 12, 383)
            -- marijakin acolyte
            eq.spawn2(123169, 0, 0, -2485, -35, 12, 383)
            eq.spawn2(123169, 0, 0, -2462, -19, 12, 383)
            eq.spawn2(123169, 0, 0, -2443, -7, 12, 383)
            -- zombies
            eq.spawn2(123170, 0, 0, -2639, -214, 12, 310):Emote("shambles forward, dripping flesh.")
            --vesthon:Emote("smiles wickedly as he begins a dark spell.") -- not working for some reason
            eq.spawn2(123170, 0, 0, -2638, -225, 12, 310)
            eq.spawn2(123170, 0, 0, -2639, -233, 12, 310)
            eq.set_global("hsagra_cooldown", "1", 0, "m20") -- unsure if there should be one
            eq.depop()
        end
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
