function event_loot(e)
    if (e.item:GetID() == 56014 and e.corpse:GetNPCTypeID() == 96368) then
        local qglobals = eq.get_qglobals(e.self);
        if (qglobals["cleric20"] ~= nil and qglobals["cleric20"] >= "3") then
            if (qglobals["cleric20_td_chest"] == nil) then
                eq.spawn2(893, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- a chest (epic 2.0)
                eq.set_global("cleric20_td_chest", "1", 5, "F");
            end
            return 0;
        else
            return 1;
        end
    end
end

