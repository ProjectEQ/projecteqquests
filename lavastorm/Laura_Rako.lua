-- Cleric 1.5 Pre_Quest
-- items involved:
-- Talisman of the Plasmatic Priests (identifies as "The world shall burn") (56010)
--
-- NPCs triggered:
-- High_Priestess_Shima (27128)
-- A_Plasmatic_Priest x2 (27129)
-- A_Plasmatic_Priestess x3 (27130)
-- items: 56010

function event_trade(e)
    local item_lib = require("items");

    if (item_lib.check_turn_in(e.trade, {item1 = 56010})) then --Check for "Talisman of the Plasmatic Priests"
        e.other:SummonItem(56010); --return "Talisman of the Plasmatic Priests"
        -- Spawn High Priestess Shima
        eq.spawn2(27128, 0, 0, 113, 1672, 56, 462); -- NPC: High_Priestess_Shima
        -- Spawn 2 A Plasmatic Priest
        eq.spawn2(27129, 0, 0, 132, 1669, 55, 0); -- NPC: A_Plasmatic_Priest
        eq.spawn2(27129, 0, 0, 89, 1672, 55, 40); -- NPC: A_Plasmatic_Priest
        -- Spawn 3 A Plasmatic Priestess
        eq.spawn2(27130, 0, 0, 113, 1650, 56, 502); -- NPC: A_Plasmatic_Priestess
        eq.spawn2(27130, 0, 0, 95, 1706, 54, 206); -- NPC: A_Plasmatic_Priestess
        eq.spawn2(27130, 0, 0, 125, 1709, 55, 274); -- NPC: A_Plasmatic_Priestess
        eq.depop_with_timer();
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

