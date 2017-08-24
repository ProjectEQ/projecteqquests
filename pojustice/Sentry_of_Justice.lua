----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Sentry of Justice (201003)
----------------------------------------------------------------------

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
    e.self:Say("Justice is swift and sure, foolish mortal.");
end

function event_death_complete(e)
    e.self:Say('The justice of the Tribunal will fall upon you!');
end