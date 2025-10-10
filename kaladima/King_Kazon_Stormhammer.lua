function event_combat(e)
        eq.unique_spawn(60004,0,0,-360,-200,11.5,10); -- NPC: a_Bloodforge_Captain
        eq.unique_spawn(60005,0,0,-360,-200,11.5,10); -- NPC: Bloodforge_Brigade
        eq.set_timer("Bloodforge",1000);
end

function event_timer(e)
    if(e.timer == "Bloodforge") then
        eq.stop_timer("Bloodforge");
        eq.get_entity_list():GetMobByNpcTypeID(60004):CastToNPC():SetRunning(true);
        eq.get_entity_list():GetMobByNpcTypeID(60005):CastToNPC():SetRunning(true);
        eq.get_entity_list():GetMobByNpcTypeID(60004):CastToNPC():MoveTo(e.self:GetX(),e.self:GetY(),e.self:GetZ(),0,true);
        eq.get_entity_list():GetMobByNpcTypeID(60005):CastToNPC():MoveTo(e.self:GetX(),e.self:GetY(),e.self:GetZ(),0,true);
        eq.get_entity_list():GetMobByNpcTypeID(60004):Say("I am coming, my liege!");
        eq.get_entity_list():GetMobByNpcTypeID(60005):Say("I am coming, my liege!");
    end
end