function event_task_stage_complete(e)
    if e.task_id == 212 then
        e.self:SummonItem(87319, 5)
        e.self:AddLevelBasedExp(10, 0)
        eq.set_global("halloween_zombie", "1", 0, "H3")
        e.self:Message(15, "The zombie presence seems somewhat lessened, and perhaps they have been quelled . . . for the time being.")
    end
end

function event_signal(e)
    if e.signal == 667 then
        eq.update_task_activity(213, 0, 1)
    end
end

function event_enter_zone(e)
    if e.self:GetClass() == 8 then
        local qglobals = eq.get_qglobals(e.self)
        if qglobals["bard15"] == "5" then
            local entity_list = eq.get_entity_list()
            if entity_list:IsMobSpawnedByNpcTypeID(20290) == false and entity_list:IsMobSpawnedByNpcTypeID(20291) == false and entity_list:IsMobSpawnedByNpcTypeID(20292) == false then
                eq.spawn2(20290, 140, 0, 1157, 537, 131, 245)
            end
        end
    end
end

