----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Shaldyn_Thunderhoof (201349)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("looks up at you with a curious gleam in his eyes. 'Ahh, a visitor.  Is there something you need or are you here for a [" .. eq.say_link("I want to hear a story",false,"story") .. "]?'");
    elseif(e.message:findi("story")) then
        e.self:Say("Well I'll tell you my story then.  I was once a master fletcher, my arrows flew straighter and farther than any made before and any that have come since.  I was a master of my craft; a bowman with a quiver of my arrows and one of my bows could drop a griffon at 20 paces with a single shot.  One day a [" .. eq.say_link("ranger") .. "] came with a special order, one that I couldn't let pass.");
    elseif(e.message:findi("ranger")) then
        e.self:Say("His name was Rhionn Leafsblade, I believe he resides here with me as well.  He wanted a magical arrow, a single arrow able to pierce even the strongest mithril breastplate.  I had done work with Rhionn before, and believed him an honorable man, and the [" .. eq.say_link("challenge") .. "] was not one that I could pass up.");
    elseif(e.message:findi("challenge")) then
        e.self:Emote("smiles.  'The arrow of course.  Mundane materials would not have been sufficient to hold the enchantments necessary to get this bow to perform as he requested.  I had Rhionn gather the materials I needed, the claw of a black drake, feathers from the Spiroc Lord, and a dracolich bone for the shaft.  I had no idea what he would use it for");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
    e.self:Emote("cries out, 'Guards!  Guards!");
end