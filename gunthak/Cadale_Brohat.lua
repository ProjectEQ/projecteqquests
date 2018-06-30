--zone: gunthak NPC: Cadale Brohat (29060)

function event_say(e)
    if (e.message:findi("hail")) then
        e.self:Emote("smiles widely at you. 'Welcome. You are brave to venture to Broken Skull Rock. Don't mind the others. Everyone is a bit touchy around here. If you are interested in dyes, feel free to peruse what I have to offer. Playing with them has given me hours of entertainment! Just be careful on this rock, and watch your back. Oh, before I forget, I'm looking for someone to help me with some [tasks] that I need to get done. All my time with the dyes has kept me from some of the more important things I need to take care of.'");
    elseif (e.message:findi("task")) then
        -- Pray for Life
        -- Time for Bed
        -- Ahoy, Ye Bony Mate
        -- Brains Over Brawn
        -- Don't Be Scared
        --Gathering Skin    [
        --Underhanded Exploration
        --Find the Ore
        eq.task_selector({223, 224, 225, 226, 227, 228, 229, 230});
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade);
end

