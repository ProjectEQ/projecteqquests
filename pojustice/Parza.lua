----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Parza (201303)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("winks at you.  'Hello, ".. e.other:GetName() .. ".  A fine " .. e.other:Race() .. " ye are, too!  Ye don't appear to be carrying the weight on thy shoulders that everyone else has about these parts.  I wonder what your part is.'  Her large, green eyes look deep into your own.  'Ah, me.  What would a merchant know about such things.  And a [" .. eq.say_link("tricksy") .. "] merchant at that.'");
    elseif(e.message:findi("tricksy")) then
        e.self:Emote("nods.  'I'm a buyer and seller of horses.  The finest in the entire city of Ronadim, mark ye.  The finest!  So what if my prices are a little high?  Surely a merchant has to make ends meet!  My days of running all over the land had long passed, 'twas time to settle down in my ancestral home.  Make a nice living.  I had a [" .. eq.say_link("reputation") .. "].'");
    elseif(e.message:findi("reputation")) then
        e.self:Say("During my younger days, I was a healer.  Carrying the word of Brell and all.  When I came to selling horses, 'twas only natural that I use a bit of my craft to...  revitalise the livestock.  Maybe I went a bit [" .. eq.say_link("too far") .. "].");
    elseif(e.message:findi("too far")) then
        e.self:Say("Well, it all means little now that I'm here, so let's chatter.  I'm not ashamed of it, if ye'd heard of half the things that the merchants did and not get caught for, ye'd be surprised.  I was just the unlucky one that got [" .. eq.say_link("caught") .. "].");
    elseif(e.message:findi("caught")) then
        e.self:Emote("turns away momentarily.  'I brought a few of the older, more...  dead livestock back to the living.  Then sold them on.  I made a handsome profit, too!  A dead horse doesn't cost a penny, but a fine, live one, filled with Brell's strength - now that's worth a lot!  'Tis a shame I got caught, aye 'tis true.  What can ye do?  Everybody dies eventually, and it's all we can do to make a bit o' hard cash before we go, ye'll agree.'");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end