-- Bard 2.0

function event_say(e)
    local qglobals = eq.get_qglobals(e.other)

    if e.message:findi("hail") then
        if qglobals["bard20"] == "1" then
            e.self:Emote(" eye's grow wide when he sees you.  'You've come back! Oshiruk now walks this world once more.  We must try to save our world from his devouring maw.  I may be able to lure him back here, but I do not have the power to destroy him.  If you think you are ready to face him tell me and I will [" .. eq.say_link("summon") .. "] him.")
        elseif qglobals["bard15"] == "6" then
            e.self:Emote(" looks at you with barely contained terror. 'You! You have brought the orb back to this land!  You will destroy us all!  The terror of Oshiruk cannot be destroyed!  Give up your foolish quest while you still can!'  He grabs for the orb as you back away slightly.  His claw trails across your sword as it draws fresh blood.")
            e.self:Say("The blade in your hand begins to glow slightly.  Alkron gazes down at the blade with eyes wide.  His eyes snap frantically back and forth between your face and the blade, finally coming to rest eye to eye with you.  His other claw subconsciously moves to cover the wound from your blade as he continues to stare directly into your eyes.  'You walk a foolish path " .. e.other:GetRace() .. ".  No mortal has the power to destroy the chaos that is the spirit of [" .. eq.say_link("Oshiruk") .. "].  The devourer has power beyond our comprehension.  You are a fool if you think that blade will save you.  The spirit of the crystalline wyrm has long since left this existence.  You are alone in your quest for death.")
        else
            e.self:Emote(" hisses as he looks down at you.  'Speak " .. e.other:GetRace() .. ", if you dare.  I have better things to do then sit here and listen to you and your pathetic kind.  You think yourselves powerful for opposing Mata`Muram, but you are like all the rest, you will fall before him and your homes will be destroyed just as ours were.")
        end
    end

    if qglobals["bard15"] == "6" then
        if e.message:findi("Oshiruk") then
            e.self:Emote(" cackles darkly.  'You carry his spirit with you and know not who he is?  Our worlds are ill fated indeed.  But fate is not mine to control, and for my part I will [" .. eq.say_link("tell") .. "] you of Oshiruk.  No warrior should fall before an unknown enemy.  It is the legacy of my people, but I fear it will end here with all our deaths.")
        elseif e.message:findi("tell") then
            e.self:Say("Very well, " .. e.other:GetName() .. ".  Millennia ago at the height of the Dragorn empire, a dark portal opened to the north.  Not far from the halls of Anguish.  We soon found ourselves under siege from a dark army.  While we were surprised by their initial appearance, we Dragorn are not weak and were able to fight them back to the portal itself after years of war.  Ten years to the day after the opening of the portal, mere days before we would have been able to destroy the portal, Oshiruk first set foot on our world.  Oshiruk was rumored to be a dark deity from a reality overcome with discord long ago and that he had come to power by consuming the other deities of his pantheon.  He brought a wave of destruction across our world, killing any and all dragorn kin that were sent against his [" .. eq.say_link("armies") .. "].")
        elseif e.message:findi("armies") then
            e.self:Say("Eventually the armies of Oshiruk stood at the gates of Dranik.  The hordes of demonic creatures clawed at the gates as we prepared our final defenses, fully expecting to meet our final demise.  But the Dragorn were not destined to fall that day.  The priests of Vesagran stood stalwart at the gates of our city and that day our god answered us.  A great cry was heard and great crystalline wings flapped across the city blowing up an enormous cloud of dust.  The titans clashed and ultimately Oshiruk fell that day before the fury of the crystalline dragon.  As he struck the ground, Oshiruk's body was consumed in [" .. eq.say_link("darkness") .. "].")
        elseif e.message:findi("darkness") then
            e.self:Say("Dark tentacles lashed out around the corpse and struck the dragon, sending ripples of dark energy across her crystal scales.  When the tentacles finally died away, all that was left of the mighty Oshiruk was his infamous dark armor.  The chestplate held a black orb that crackled with dark lightning.  The dragon reached forward and tore the orb from the chestplate, causing a cataclysmic backlash of evil energy.  She collapsed to the ground, overcome by the dark energy.   The priests of Vesagran were able to protect her from the remnants of Oshiruk's army, but were not able to keep them from taking the black armor back through the portal to discord.  But Vesagran held the orb, and with it the spirit of Oshiruk.  The orb and Vesagran have never been seen again until today.  How it might be destroyed I don't know, but should the armor ever be reunited with the [" .. eq.say_link("orb") .. "] Oshiruk would surely return and destroy us all.")
        elseif e.message:findi("orb") then
            e.self:Say("The orb that sits in your very pack holds the soul of Oshiruk you fool!  The orb is the source of all his power.  But he requires a body in order to resurrect himself into this existence.  He certainly wants to reform his former self and to that end will try to find the breastplate, gauntlets and boots of his previous armor.  There may be a way to destroy his former body at least.  The power of Mata`Muram is vast, perhaps we can use these two evils to destroy each other.  Bring me the armor and a globe of discordant energy from the lair of Mata`Muram and I will attempt to destroy the armor and prevent Oshiruk's return.")
        end
    end

    if e.message:findi("summon") and qglobals["bard20"] == "1" then
        e.self:Emote(" nods at you and begins to scrawl runes on the ground.  His voice starts quietly and grows to a dull roar as he recites an incantation of some sort.  You feel the ground begin to rumble around you as dark energy pervades your soul. Alkron screams out, 'The devourer is here! Fight for your world Norrathian!")
        -- spawn aggro clearing version
    end
end

function event_trade(e)
    local item_lib = require("items")
    local qglobals = eq.get_qglobals(e.other)

    if qglobals["bard15"] == "6" then
        if item_lib.check_turn_in(e.trade, {item1 = 77641, item2 = 77642, item3 = 77643, item4 = 47100}) then -- black chaos and globe
            e.self:Emote(" nods slowly and places the armor on the ground at his feet with the discordant orb in the center.  'Now we shall see if our efforts are for our salvation or destruction.  He begins to mark the ground with Dragorn runes and recite an ancient Dragorn rite.  The armor begins to hum as the orb dissolves into a black pool on the ground.  Alkron draws back in terror. 'No! I was a fool to think I could destroy him! I have brought about the end of us all!'  The armor spins and crackles with energy as it flies from your hands and rises into the air.  The armor begins to grow as bolts of energy begin to snap between them.  A maniacal cackle fills the air as the armor forms into a vaguely humanoid shape.")
            e.other:Message(15, "The blade in your hand begins to glow as the dark orb begins to burn your flesh.  You struggle to keep the orb from flying away.") -- unsure on color or if it should be close
            eq.set_global("bard20", "1", 5, "F") -- lets you resummon on fail or whenever because why not!
            -- spawn named
        end
    end

    item_lib.return_items(e.self, e.other, e.trade)
end
