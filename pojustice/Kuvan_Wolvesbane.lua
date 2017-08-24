----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Kuvan Wolvesbane (201400)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("growls and glares at you with cold, grey eyes.  'What be ye after, " .. e.other:Race() .. "?  There is nothing to see here, so stop thy gawking.  Maybe ye want to end up like one of my [" .. eq.say_link("trophies") .. "], aye?");
    elseif(e.message:findi("trophies")) then
        e.self:Emote("laughs, with no mirth whatsoever.  'Aye, trophies!  I'll take thy head from thy shoulders and make a pretty piece of out it for my mantle!  Just like all the others.  Maybe I'll let the [" .. eq.say_link("Brothers") .. "] have ye - becoming my trophy is probably more than the likes of ye deserve!");
    elseif(e.message:findi("Brothers")) then
        e.self:Emote("spreads his arms wide.  'The Brothers!  My companions, my fine pair o' friends!  How much blood did we let flow, how much wonderful blood!  Kalliz and Talliz, if ye can hear me, your old friend salutes you!  Give 'em Torment and send 'em there with broken bones!");
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