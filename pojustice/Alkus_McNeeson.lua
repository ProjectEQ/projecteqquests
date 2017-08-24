----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Alkus McNeeson (201347)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("produces a dagger from the folds of his clothing and scowls at you. 'Who are you? What are you doing here? Did [" .. eq.say_link("they") .. "] send you?");
    elseif(e.message:findi("they")) then
        e.self:Say("Don't play dumb!  I knew that they would send killers, perhaps this means my [" .. eq.say_link("punishment") .. "] has ended.  Perhaps now I can know death?");
    elseif(e.message:findi("punishment")) then
        e.self:Emote("judges you warily. 'Hmm, you don't look much like one of their [" .. eq.say_link("killers") .. "].");
    elseif(e.message:findi("killers")) then
        e.self:Say("I won't say their name.  I was one of them, and I am still honor bound to secrecy.  Just know that on Norrath there are good reasons to fear the [" .. eq.say_link("shadows") .. "].");
    elseif(e.message:findi("shadows")) then
        e.self:Say("I was one of them, born and bred to be an assassin.  It was my life.  In our circle, failure is death, but [" .. eq.say_link("what did you do",false,"what I did") .. "] was worse than failure so I wasn't granted the release of the Eternal Slumber.");
    elseif(e.message:findi("what did you do")) then
        e.self:Say("I betrayed the sect.  I protected, still [" .. eq.say_link("protect") .. "], my love.  She failed an assignment, and in the infinite wisdom of the council they sent me to exact our justice on her. It was to be my final test, failure would mean death, as it does always, success would mean ascension to the council.  I knew that were I simply to fail, it would only be a matter of time before one of my brethren would be successful, then not only would my death be in vain, but I would see my love too soon in the afterworld.");
    elseif(e.message:findi("protect")) then
        e.self:Say("I hid her from the sect.  They were infuriated with my betrayal, and they needed to make an example of me.  Instead of killing me, they sent me to the wracks, there I learned the true meaning of pain, they offered me a swift death for the [" .. eq.say_link("location") .. "] of my love, but I would not break, I could not break.");
    elseif(e.message:findi("location")) then
        e.self:Say("They never found her, she died of natural causes many years later.  The whole time I kept her secret, kept her hidden.  When word of her death reached the council they knew they failed, and they decided death was too kind for me, so they sent me here for an eternity...  Never to die, never to meet my love in the beyond.  I have been here longer than I can remember, and will be here longer than I can perceive.  My only hope is that one day they will see fit to grant me death, to free me from this prison.");
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