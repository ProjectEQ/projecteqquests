----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Zakis Var Sl`tad (201340)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("twitches his tail and glares at ".. e.other:GetName() .. " with an eye seemingly full of disdain, though surprisingly, you do not feel as if the emotion is directed solely at you. The look seems to be a constant upon this one's face -- a mask of torment, hate, and regret. In a barely audible hiss, the Iksar prisoner speaks, 'Perhaps you find amusement in the suffering of others? Very well, listen to the tale. It has been long since I have had the pleasure of seeing fear -- borne of my own acts -- blaze in the eyes of another.");
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