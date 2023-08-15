-- 336068

function event_spawn(e)
	e.self:SetPseudoRoot(true);
	eq.set_next_hp_event(45);
end


function event_hp(e)
	if (e.hp_event == 45) then
		e.self:SetPseudoRoot(false);
		e.self:Say("You think because I'm blind you can defeat me? My senses are boundless. I will hunt you down!");
	end
end

function event_combat(e)
    if e.joined then
        local entity_list = eq.get_entity_list();
        local npc = entity_list:GetMobByNpcTypeID(336066);
			if (npc.valid and not npc:IsEngaged()) then
				npc:AddToHateList(e.self:GetHateRandom(),1);
			end
				npc = entity_list:GetMobByNpcTypeID(336067);
			if (npc.valid and not npc:IsEngaged()) then
				npc:AddToHateList(e.self:GetHateRandom(),1);
			end
    end
end


function event_death(e)
    local entity_list = eq.get_entity_list();
    if (entity_list:IsMobSpawnedByNpcTypeID(336067) or entity_list:IsMobSpawnedByNpcTypeID(336066)) then
        e.self:ClearItemList();
        e.self:RemoveCash();
    end
end

function event_death_complete(e)
	eq.signal(336256,336068); -- NPC: kyv_controller
end
