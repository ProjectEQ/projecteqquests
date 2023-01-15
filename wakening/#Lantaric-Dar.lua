-- bard 1.5
-- also used in prequest
-- items: 77608, 77612, 77613, 77600, 77601, 77602, 77604, 77605, 77606, 77607

function event_say(e)
    if e.other:Class() == "Bard" then
        local qglobals = eq.get_qglobals(e.other)
        if e.message:findi("hail") then
            if qglobals["bard15"] == "1" then
                e.self:Say("Journey to the necropolis and stop the mercenaries " .. e.other:Race() .. ".  May Veeshan protect you.")
            elseif qglobals["bard15"] == "2" then
                e.self:Say("Journey to the necropolis and lay Hsagra's spirit to rest! You must hurry!")
            elseif qglobals["bard15"] == "3" then
                e.self:Say("Return to the necropolis and stop Vesthon before it is too late " .. e.other:Race() .. "!")
            elseif qglobals["bard15"] ~= nil and qglobals["bard15"] >= "4" then
                e.self:Say("The kin thank you for your efforts in saving the spirit of Hsagra.  May Veeshan guide your path in the destruction of the orb.")
            elseif e.other:HasItem(20542) then
                e.self:Emote("seems surprised as you approach him.  He peers down at you with an inquisitive glint in his eyes. 'I sense a familiar aura around you " .. e.other:Race() .. "  One I have not felt in a long time.  Tell me " .. e.other:Race() .. ", do you have news of a man named Baldric?")			
            else
                -- 1.5 start
                e.self:Emote("glances down at you with an almost palatable indifference. Small wonder, considering his significant stature. 'I have better things to do then deal with you mortal. The [" .. eq.say_link("children of Zek") .. "] hunt this land, and they hunt for me and my kin. I advise you to stay away from both them, and their quarry.'")
            end
        elseif e.message:findi("Baldric Slezaf") then -- you don't say this for prequest, prequest should just set bard15 to 1. This lore is covered by the prequest
            if e.other:HasItem(20542) then
                e.self:Emote("'s eyes glitter with energy as you mention Baldric's Name. 'So I was not mistaken, you do know Baldric.  He was a friend, and as a great a mortal as I have ever known.  You must be an exceptional mortal yourself if Baldric saw fit to bequeath the blade to you.  Yes I know of it.  I could feel it's energy around your body.  Perhaps fate has brought you to me this day.  I am in great need of help " .. e.other:Race() .. ".")
                e.self:Say("One of our scouts recently came upon a band of mercenaries in possession of a letter from King Tormax.  The letter described a mission to recover relics from the necropolis.  This cannot be allowed to happen.  The holy resting place of my kin shall not be defiled!  Journey to the necropolis and stop the mercenaries.  Bring me anything you might find that would provide a clue as to what Tormax has planned.")
                if qglobals["bard15"] == nil then
                    eq.set_global("bard15", "1", 5, "F")
                end
            end
		elseif e.message:findi("children of Zek") then
			e.self:Emote("lets out a deep growl. You can tell that your question has angered him. 'I find it impossible to believe you have come to this land know nothing of the children of Zek. Do not toy with me, I can see deep into your very soul if I so choose. Perhaps you are a [" .. eq.say_link("spy") .. "] sent by Tormax to find a weakness in the kin. If you are then both he and you are fools. No mortal will ever expose any weakness in the ranks of the claws.");
		elseif e.message:findi("spy") then
			e.self:Emote("lowers his massive head slightly and peers down at you. You notice a small spark of light emanating from his eyes and you find yourself completely unable to look away. You feel a benign presence gliding through your thoughts.");
			e.self:Say("Perhaps you speak the truth mortal. But the trust of the kin is not given lightly. You will have to provide some [" .. eq.say_link("proof") .. "] for yourself if you wish to gain my trust.");
		elseif e.message:findi("proof") then
			e.other:Message(15,"The smallest flicker of a grin crosses over Lantaric`Dar's draconic features. 'I was hoping you'd say that. There are three giants that act as heralds for Tormax in this region. Find them, kill them, and bring me their heads to prove your loyalty.'");				
        elseif e.message:findi("continue to aid")  and qglobals["bardPQ"] == "1" then
			e.self:Say("Excellent " .. e.other:Race() .. ". I have a matter that I believe you would be suited for. The children of Zek have been strangely silent over the last few days. While your attacks on the couriers certainly slowed them down, I suspect there is something else going on. If you can uncover what they're up to, I will be most pleased. The area around Kael Drakkel is most likely to yield information.")
		end
    end
end

function event_trade(e)
    local item_lib = require("items")
    local qglobals = eq.get_qglobals(e.other)
    if qglobals["bard15"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 77608}) then -- Cracked Dragon Bone
        eq.set_global("bard15", "2", 5 , "F") -- this lets you spawn Hsagra
        e.self:Emote("'s eyes grow wide as he studies the bone fragment.  'My greatest fears have been proven true " .. e.other:Race() .. ".  The fragment you recovered from the mercenaries is a piece of the skeleton of Hsagra.  The deceased mate of Yelinak and the only dragon of the first brood who has been put to rest.  They are fools if they think they can animate the corpse of Hsagra.  No mortal can hope to manipulate the power of a fallen child of Veeshan.  Never the less you must protect her relics from the mercenaries. Tormax will most certainly send more.  Return to the Necropolis and locate the relics of Hsagra and put them to final rest in the pool of fire.  Hsagra's skull is still held by Tormax, but if you collect three of her rib bones and the shard you brought me they will suffice for the fires of the necropolis.")
        e.self:Say("You must summon the spirit of Hsagra if you hope to put her to final rest.  Go to the fires and call to her spirit and she will surely anwer to one marked with the symbol of the kin.  Give her spirit the relics of her broken body and her final rest will be complete.  Hurry " .. e.other:GetName() .. ", before the Kromzek Mercenaries find the rest of her relics!")
        e.other:QuestReward(e.self, 0, 0, 0, 0, 77608, 1) -- Cracked Dragon Bone
    elseif qglobals["bard15"] == "2" and item_lib.check_turn_in(e.trade, {item1 = 77612}) then -- Blackened Dragon Bone
        eq.set_global("bard15", "3", 5, "F") -- this lets you spawns the lich event
        e.self:Say("So we finally uncover the Kromzek's true goals.  They hope to take control of the spirit of Hsagra and animate her corpse into an undead abomination.  I cannot fathom the strength of will needed to control a will as strong as Hsagra.  The necromancer you encountered must have some sort of focus that helps him control her spirit.  The bones that he has stolen aren't enough on their own to summon and control Hsagra's spirit, but Tormax already has her skull as a trophy in his throne room.  Those pieces combined will certainly have a sufficient connection to her spirit to draw it out.")
        e.self:Say("Vesthon will certainly return to the Necropolis and try to capture the spirit of Hsagra again.  Once more the kin ask for your assistance " .. e.other:GetName() .. ".  We haven't time to gather forces from skyshrine, we must go now.  Gather what ever forces you can muster quickly!  Hurry " .. e.other:Race() .. "! The fate of a first brood spirit rests in your hands.")
        e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 1)
    elseif qglobals["bard15"] == "3" and item_lib.check_turn_in(e.trade, {item1 = 77613}) then -- Dark Orb
        eq.set_global("bard15", "4", 5, "F") -- lets you ask Walthin Fireweaver about dragons
        e.self:Say("It must be an object of considerable power to be able to imbue a mere mortal such as Vesthon with the power to control a dragon kin spirit.  This orb must be destroyed, but I know not how that might be done.  For now I entrust the orb to your care, and charge you with finding a way to destroy it.  You must not fail " .. e.other:GetName() .. ".  An artifact of that much evil potential must not be allowed to exist.")
        e.other:QuestReward(e.self, 0, 0, 0, 0, 77613, 1) -- Dark Orb
	--bard prequest turnins
    elseif item_lib.check_turn_in(e.trade, {item1 = 77600,item2 =77600, item3 = 77600}) then -- Storm Giant Herald Head 3x
        eq.set_global("bardPQ", "1", 5, "F")
        e.self:Emote("peers at the three heads for a moment. You might almost say he looks surprised. 'You have done well " .. e.other:Race() .. ". You have gained a portion of my trust today. I hope you continue to impress me.")
		e.self:Emote("raises his claw to your forehead. The sweat dripping into your eyes does not blur your vision enough to sedate the terror of having a dragon claw mere inches from your face. Lantaric`Dar makes a series of quick, precise motions and then lowers his claw. You feel a mystical energy shiver over your body. 'You have been blessed with my mark. If you [" .. eq.say_link("continue to aid") .. "] me I may see fit to further increase its power.")		
    elseif qglobals["bardPQ"] == "1" and  item_lib.check_turn_in(e.trade, {item1 = 77601}) then -- Kromzek Supply Orders
        eq.set_global("bardPQ", "2", 5, "F")
        e.self:Emote("studies the orders for a few moments. 'Well done " .. e.other:Race() .. ". This explains much of the giants' movements of late. This list shows orders for creating equipment for creatures closer to your stature then a giant. The Kromzek must be recruiting more mercenaries. Find the troop this order was meant to supply " .. e.other:GetName() .. ". There must be a reason for Tormax's new interest in mortal conscripts.")	
		eq.spawn2(119182, 0, 0, 480,-2445,-6,188); --Cristoc_Bonethug
		eq.spawn2(119183, 0, 0, 491,-2461,-6,450); --a_Bonethug_mercenary
		eq.spawn2(119183, 0, 0, 473,-2481,-6,13); --a_Bonethug_mercenary
		eq.spawn2(119183, 0, 0, 451,-2459,-6,91); --a_Bonethug_mercenary
		eq.spawn2(119183, 0, 0, 416,-2469,-6,100); --a_Bonethug_mercenary
		eq.spawn2(119183, 0, 0, 422,-2493,-6,98); --a_Bonethug_mercenary
	elseif qglobals["bardPQ"] == "2" and  item_lib.check_turn_in(e.trade, {item1 = 77602}) then -- Sealed Note
		eq.set_global("bardPQ", "3", 5, "F")
        e.self:Say("Once again you have exceeded my expectations " .. e.other:GetName() .. ". Rarely have I encountered a mortal with your talents, in fact not since Baldric walked these lands. But I digress, and we have more work to do. For now, take this mark as a symbol of my trust.")			
		e.self:Emote("raises his claw once again to your forehead. The sweat rolls a little slower this time, as you have grown more comfortable with his massive scaled form. His claws make a quick methodical series of movements across your forehead again. You feel a slightly familiar energy flow through to every part of your body and then subside.")
		e.self:Say("Travel boldly " .. e.other:GetName() .. ". For you move under my protection. Your latest discovery has left me with even more questions to be answered. The letter you brought seems to indicate that the mercenaries were meant for two purposes. I want you to investigate the less puzzling of the two, which was to escort several emissaries from the Iceclad Ocean to Kael Drakkel. The emissaries are due to arrive soon. I have sent one of the kin to the Iceclad Ocean to keep track of their movements. But I suspect he will need you there to help him. Find Vas Thorel in the Iceclad Ocean and do what he asks. We are getting closer to the bottom of this mystery " .. e.other:Race() .. ".")
	elseif qglobals["bardPQ"] == "4" and item_lib.check_turn_in(e.trade, {item1 = 77604,item2 =77605, item3 = 77606, item4 = 77607}) then
        eq.set_global("bard15", "1", 5, "F")
        e.self:Emote("peers at the heads. 'So the giants have asked for the aid of many of the young races. It is no secret that the giants have had little luck with the dark arts of necromancy. The presence of these necromancers, the sealed note you recovered, and the mercenary orders all point to one place, the Necropolis of my ancestors. I fear they plan to desecrate our sacred burial grounds. This can not be allowed. You must travel to the Necropolis and stop them " .. e.other:GetName() .. ". But first, accept my gratitude, and a strengthening of enchantment that protects you.")
		e.self:Emote("raises his claw to your brow once more. This time, you stand confident with the razored claws mere inches from your eyes. The familiar motions flash across your eyes again, and a feeling of renewed confidence beats in your chest.")		
	end
	
    item_lib.return_items(e.self, e.other, e.trade)
end
