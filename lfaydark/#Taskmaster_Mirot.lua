function event_spawn(e)
  eq.set_timer("depop",1800000); --Despawn after 30 minutes
end

function event_combat(e)
  if (e.joined == true) then
    eq.set_timer("aggrolink", 3 * 1000);
	eq.set_timer("distance", 5 * 1000);
  else
    eq.stop_timer("aggrolink");
	eq.stop_timer("distance");
  end
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop_all(57153);
		eq.depop();
		eq.signal(57150,2); -- NPC: Taskmaster_Mirot
	elseif (e.timer == "aggrolink") then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 57154) or (npc:GetNPCTypeID() == 57155)) then
			npc:AddToHateList(e.self:GetHateRandom(),1); -- add Reanimated_Minion to aggro list if alive
		end
		end

	elseif e.timer == "distance" then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if npc.valid and (npc:GetNPCTypeID() == 57154 or npc:GetNPCTypeID() == 57155) and (npc:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) > 200) then
				npc:GMMove(e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
				e.self:Emote("calls the minion back to himself as it starts to get too far.");
			end
		end
	end
end

function event_death_complete(e)
    e.self:Emote("As Mirot falls to the ground you see a letter in the pocket of his shirt.");
	eq.stop_timer("depop");
	eq.signal(57150,2); -- NPC: Taskmaster_Mirot
end
