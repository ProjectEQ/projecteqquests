function event_timer(e)
	if (e.timer == "aggrolink") then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 57154) or (npc:GetNPCTypeID() == 57155) or (npc:GetNPCTypeID() == 57151)) then
			npc:AddToHateList(e.self:GetHateRandom(),1); -- add Reanimated_Minion /Taskmaster to aggro list if alive
		end
		end
	end
end


function event_combat(e)
  if (e.joined == true) then
    eq.set_timer("aggrolink", 3 * 1000);
  else
    eq.stop_timer("aggrolink");
  end
end
