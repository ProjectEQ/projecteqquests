----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Zadyr Moralin (201402)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 17 and e.other:GetLanguageSkill(17) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Elder Teir'Dal, 'Hmm'  He has an eager look upon his troubled face.  'By the Prince, have you come to [free] me from this place?");
        elseif(e.message:findi("free")) then
            e.self:Say("in Elder Teir'Dal, 'I must find a way out of this prison, my trial is approaching, so says the warden.  Time is running out for me.  There is little chance of reprieve, given my [experiments].");
        elseif(e.message:findi("experiments")) then
            e.self:Say("in Elder Teir'Dal, 'My people are fleeing, fleeing underground away from the traitor-elves.  We are taking to the tunnels and to the caverns, where we can rebuild our strength, beneath the surface.  The Prince will protect our people.  My experiments were dire indeed, and yet in times of war one must take every opportunity one can get to defeat one's foe, as I am certain that you would agree.  I experimented upon the souls of my [slaves].");
        elseif(e.message:findi("slaves")) then
            e.self:Say("in Elder Teir'Dal, 'My House always kept dwarves; they are sturdy, hard-working and durable.  It has always been the law of our House never to abuse the slaves, however.  The war with the traitors lasted so long, and I saw an opportunity to end it.  My research into the binding of mortal souls, and to use that harnessed spiritual power for further incantations, had proceeded to the point at which I required actual living subjects upon which to perform my [rituals].");
        elseif(e.message:findi("rituals")) then
            e.self:Say("in Elder Teir'Dal, 'The ritual of binding requires over two whole days of preparation, and the separation and captivation of the subject's soul takes a further two days of rigourous effort.  I succeeded, but the price was high.  Upon three of my slaves did I perform the rituals, and thrice damned am I for it.  I wielded the power of their lifes' energies with decisiveness.  My [victories] were the stuff of legends.");
        elseif(e.message:findi("victories")) then
            e.self:Say("in Elder Teir'Dal, 'Against the traitor-elves, my new-found energies from the life-force of my three slaves' trapped souls provided me with the ability to lay waste to whole legions of our enemies.  Yet in their foolishness, my peers of the Prince's Elves sought to stop me, and bring me to [justice].");
        elseif(e.message:findi("justice")) then
            e.self:Say("in Elder Teir'Dal, 'They took me in my sleep, and for my crimes, I was banished here.  Banished here like a criminal, rather than a savior of our species!  Without my rituals, without my incantations, our people are doomed - they flee to the underworld and hide, like vermin.  Even now, I sit here, accused, and were that not torment enough I am constantly reminded of my deeds by the souls of the three that I damned with me.'");
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
    e.self:Emote("cries out, 'Guards!  Guards!");
end

function event_death_complete(e)
    e.self:Say('Justice comes to all, in time.');
end