-- bard 1.5
-- also used in prequest

function event_say(e)
    if e.other:Class() == "Bard" then
        local qglobals = eq.get_qglobals(e.other)
        if e.message:findi("hail") then
            if qglobals["bard15"] == "1" then
                e.self:Say("Journey to the necropolis and stop the mercenaries " .. e.other:GetRace() .. ".  May Veeshan protect you.")
            elseif qglobals["bard15"] == "2" then
                e.self:Say("Journey to the necropolis and lay Hsagra's spirit to rest! You must hurry!")
            elseif qglobals["bard15"] == "3" then
                e.self:Say("Return to the necropolis and stop Vesthon before it is too late " .. e.other:GetRace() .. "!")
            elseif qglobals["bard15"] ~= nil and qglobals["bard15"] >= "4" then
                e.self:Say("The kin thank you for your efforts in saving the spirit of Hsagra.  May Veeshan guide your path in the destruction of the orb.")
            elseif e.other:HasItem(20542) then
                e.self:Emote(" seems surprised as you approach him.  He peers down at you with an inquisitive glint in his eyes. 'I sense a familiar aura around you " .. e.other:GetRace() .. "  One I have not felt in a long time.  Tell me " .. e.other:GetRace() .. ", do you have news of a man named Baldric?")
            else
                -- 1.5 start
                e.self:Emote("glances down at you with an almost palatable indifference. Small wonder, considering his significant stature. 'I have better things to do then deal with you mortal. The [" .. eq.say_link("children of Zek") .. "] hunt this land, and they hunt for me and my kin. I advise you to stay away from both them, and their quarry.'")
            end
        elseif e.message:findi("Baldric Slezaf") then -- you don't say this for prequest, prequest should just set bard15 to 1. This lore is covered by the prequest
            if e.other:HasItem(20542) then
                e.self:Emote("'s eyes glitter with energy as you mention Baldric's Name. 'So I was not mistaken, you do know Baldric.  He was a friend, and as a great a mortal as I have ever known.  You must be an exceptional mortal yourself if Baldric saw fit to bequeath the blade to you.  Yes I know of it.  I could feel it's energy around your body.  Perhaps fate has brought you to me this day.  I am in great need of help " .. e.other:GetRace() .. ".")
                e.self:Say("One of our scouts recently came upon a band of mercenaries in possession of a letter from King Tormax.  The letter described a mission to recover relics from the necropolis.  This cannot be allowed to happen.  The holy resting place of my kin shall not be defiled!  Journey to the necropolis and stop the mercenaries.  Bring me anything you might find that would provide a clue as to what Tormax has planned.")
                if qglobals["bard15"] == nil then
                    eq.set_global("bard15", "1", 5, "F")
                end
            end
        end
    end
end

function event_trade(e)
    local item_lib = require("items")
    local qglobals = eq.get_qglobals(e.other)

    if qglobals["bard15"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 77608}) then -- Cracked Dragon Bone
        eq.set_global("bard15", "2", 5 , "F") -- this lets you spawn Hsagra
        e.self:Emote("'s eyes grow wide as he studies the bone fragment.  'My greatest fears have been proven true " .. e.other:GetRace() .. ".  The fragment you recovered from the mercenaries is a piece of the skeleton of Hsagra.  The deceased mate of Yelinak and the only dragon of the first brood who has been put to rest.  They are fools if they think they can animate the corpse of Hsagra.  No mortal can hope to manipulate the power of a fallen child of Veeshan.  Never the less you must protect her relics from the mercenaries. Tormax will most certainly send more.  Return to the Necropolis and locate the relics of Hsagra and put them to final rest in the pool of fire.  Hsagra's skull is still held by Tormax, but if you collect three of her rib bones and the shard you brought me they will suffice for the fires of the necropolis.")
        e.self:Say("You must summon the spirit of Hsagra if you hope to put her to final rest.  Go to the fires and call to her spirit and she will surely anwer to one marked with the symbol of the kin.  Give her spirit the relics of her broken body and her final rest will be complete.  Hurry " .. e.other:GetName() .. ", before the Kromzek Mercenaries find the rest of her relics!")
        e.other:QuestReward(e.self, 0, 0, 0, 0, 77608, 1) -- Cracked Dragon Bone
    elseif qglobals["bard15"] == "2" and item_lib.check_turn_in(e.trade, {item1 = 77612}) then -- Blackened Dragon Bone
        eq.set_global("bard15", "3", 5, "F") -- this lets you spawns the lich event
        e.self:Say("So we finally uncover the Kromzek's true goals.  They hope to take control of the spirit of Hsagra and animate her corpse into an undead abomination.  I cannot fathom the strength of will needed to control a will as strong as Hsagra.  The necromancer you encountered must have some sort of focus that helps him control her spirit.  The bones that he has stolen aren't enough on their own to summon and control Hsagra's spirit, but Tormax already has her skull as a trophy in his throne room.  Those pieces combined will certainly have a sufficient connection to her spirit to draw it out.")
        e.self:Say("Vesthon will certainly return to the Necropolis and try to capture the spirit of Hsagra again.  Once more the kin ask for your assistance " .. e.other:GetName() .. ".  We haven't time to gather forces from skyshrine, we must go now.  Gather what ever forces you can muster quickly!  Hurry " .. e.other:GetRace() .. "! The fate of a first brood spirit rests in your hands.")
        e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 1)
    elseif qglobals["bard15"] == "3" and item_lib.check_turn_in(e.trade, {item1 = 77613}) then -- Dark Orb
        eq.set_global("bard15", "4", 5, "F") -- lets you ask Walthin Fireweaver about dragons
        e.self:Say("It must be an object of considerable power to be able to imbue a mere mortal such as Vesthon with the power to control a dragon kin spirit.  This orb must be destroyed, but I know not how that might be done.  For now I entrust the orb to your care, and charge you with finding a way to destroy it.  You must not fail " .. e.other:GetName() .. ".  An artifact of that much evil potential must not be allowed to exist.")
        e.other:QuestReward(e.self, 0, 0, 0, 0, 77613, 1) -- Dark Orb
    end

    item_lib.return_items(e.self, e.other, e.trade)
end
