----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Ra`Silyas (201330)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("gives a cold, callous glare to ".. e.other:GetName() .. ", 'What business do you believe befits you in this place, ".. e.other:GetName() .. "? Your presence is not welcome among us. You are a creature who is free and you walk willingly among the eternal prisoners of justice. How quaint, indeed. Move along for in the north where your kin reside. Perhaps they may be more informative and receptive to your presence than we.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end