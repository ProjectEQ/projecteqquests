----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: High Shaman Dannal (201338)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("narrows his eyes in a hardened stare. You see something in his face that you had formerly believed to be vanquished from this place -- life and spirit. His eyes are bright and vibrant in their emotion of disdain and his face is hard and steely. As he speaks, you find yourself somewhat taken back with surprise at his strength and undefeated spirit, 'This is the realm of my deity; the realm that I served. Look at me, ".. e.other:GetName() .. "! I am a priest of the Tribunal! For you to think upon me as a criminal is to think justly, for I would not be here had my convictions been of another accord. My pride in this place -- my life, despite the eternity I have already endured, is preserved for I know that even in the end, my faith was pure and my actions show that I am indeed the strongest spirit to ever serve The Tribunal. I committed a crime, and I condemned myself to this place with my own hand, through the powers granted to me by my faith did I sacrifice my own self to this fate. Now move along.");
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