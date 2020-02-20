--336066


function event_spawn(e)
	e.self:SetPseudoRoot(true);
	eq.set_next_hp_event(45);
end

function event_hp(e)
	if (e.hp_event == 45) then
		e.self:SetPseudoRoot(false);
	end
end

function event_combat(e)
    if (e.joined == true) then
        local entity_list = eq.get_entity_list();
        local npc = entity_list:GetMobByNpcTypeID(336067);
			if (npc.valid and not npc:IsEngaged()) then
				npc:AddToHateList(e.self:GetHateRandom(),1);
			end
				npc = entity_list:GetMobByNpcTypeID(336068);
			if (npc.valid and not npc:IsEngaged()) then
				npc:AddToHateList(e.self:GetHateRandom(),1);
			end
    end
end

function event_death(e)
    local entity_list = eq.get_entity_list();
    if (entity_list:IsMobSpawnedByNpcTypeID(336068) or entity_list:IsMobSpawnedByNpcTypeID(336067)) then
        e.self:ClearItemList();
        e.self:RemoveCash();
    end
end

function event_death_complete(e)
	eq.signal(336256,336066);
end
