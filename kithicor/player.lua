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
