----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Summoner Teikk (201222)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("crosses his arms and regards you down the length of his nose.  '" .. e.other:Race() .. ", it is well.  We of the upright caste have been having increasing difficulty in managing relations with the menagerie of aberrations to the [" .. eq.say_link("south") .. "].");
    elseif(e.message:findi("south")) then
        e.self:Emote("raises one thick eyebrow in an expression that you take to be one of inquiry.  'Surely you must have seen them, or at least heard their endless noises; such a gaggle is quiet not a for a moment.  They are, on the whole, extremely hostile to we uprights.  I warn you, should you get too close, you might find this out for yourself the hard way.");
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