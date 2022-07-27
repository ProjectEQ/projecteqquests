function event_combat(e)
	if (e.joined == true) then

		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 343664)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end
	end
end
