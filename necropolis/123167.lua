-- bard 1.5 first Vesthon fight
-- #Vesthon`s_Draconic_Abomination (123171)

function event_spawn(e)
    eq.set_timer("despawn", 180000) -- 3 minutes
    eq.set_timer("emote1", 9000) -- 9 seconds
    eq.set_timer("emote2", 20000) -- 20 seconds
    eq.set_next_next_hp_event(20)
end

function event_hp(e)
    e.self:Emote(" cries out in agony as his body staggers to the ground.  In a final act of desperation Vesthon raises his hands and motions to one of the black bones still drifting in the air.")
    eq.zone_emote(15, "The black tendrils retreat back from Hsagra's shade and fade into a benign black fog.  Hsagra's shade fades quietly into the shadows.")
    eq.spawn2(123171, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
    eq.depop()
end

function event_timer(e)
    if e.timer == "despawn" then
        eq.depop()
    elseif e.timer == "emote1" then
        e.self:Emote("holds his left hand out in front of him maintaining an impossibly complex mystic sign with his fingers.  The bones, still dripping with ethereal ooze twist and jerk in the air before him.  His eyes lock with yours for a moment and a cold smirk slithers across his face as he opens his mouth to speak.")
        e.self:Say("I believe thanks are in order.  I could never have hoped to actually have a chance to control the spirit of Hsagra first hand.  I am in your debt.  Of course that won't keep me from siphoning the life from your tired soul as well.")
    elseif e.timer == "emote2" then
        eq.zone_emote(15, "Hsagra's spirit snarls and bears down on Vesthon.  Vesthon right hand comes up quickly and makes several quick motions while echoing some dark incantation.  A black vapor appears around him and quickly sepates into a set of ethereal tendrils.")
        eq.zone_emote(15, "The black tendrils reach out and begins snapping at Hsagra's shade.  Several of the tendrils grab hold as her spirit cries out in horror.  You turn back towards Vesthon and notice that several rather angry mercenaries have just entered the room behind him and are charging towards you.")
    end
end
