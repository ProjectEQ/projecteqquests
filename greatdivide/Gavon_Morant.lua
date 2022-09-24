-- Cleric 1.5 Pre_Quest
-- items involved:
-- Talisman of the Plasmatic Priests (identifies as "The world shall burn") (56010)
--
-- NPCs triggered:
-- High Priest Maltan (118211)
-- A_Plasmatic_Priest x2 (27129)
-- A_Plasmatic_Priestess x3 (27130)
-- items: 56010

function event_trade(e)
    local item_lib = require("items");

    if (item_lib.check_turn_in(e.trade, {item1 = 56010})) then --Check for "Talisman of the Plasmatic Priests"
        e.other:SummonItem(56010); --return "Talisman of the Plasmatic Priests"
        -- Spawn High Priest Maltan
        eq.spawn2(118211, 0, 0, -489, -6115, -557, 0); -- NPC: High_Priest_Maltan
        -- Spawn 2 A Plasmatic Priest
        eq.spawn2(27129, 0, 0, -510, -6104, -557, 124); -- NPC: A_Plasmatic_Priest
        eq.spawn2(27129, 0, 0, -501, -6085, -555, 204); -- NPC: A_Plasmatic_Priest
        -- Spawn 3 A Plasmatic Priestess
        eq.spawn2(27130, 0, 0, -476, -6084, -555, 296); -- NPC: A_Plasmatic_Priestess
        eq.spawn2(27130, 0, 0, -469, -6104, -557, 376); -- NPC: A_Plasmatic_Priestess
        eq.depop_with_timer();
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

