function event_death_complete(e)
local num_alive=0;
		local npc_list = eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and npc:GetNPCTypeID() == 20300) then
				num_alive=num_alive+1;
			end
		end
		
		if (num_alive ==0) then
			eq.spawn2(20301,0,0, e.self:GetX()+7,e.self:GetY()+7,e.self:GetZ(),0);
		end
end