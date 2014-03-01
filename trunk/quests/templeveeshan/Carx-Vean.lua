-- Carx`Vean (124094) NPCID: 124094
function event_combat(e)
	if (e.joined) then
		-- grab the entity list
		local entity_list = eq.get_entity_list();
		-- also aggro #Lord_Kreizenn (124074) and Kedrak (124093) if they are up
		local npc_table = {124074,124093};
		for k,v in pairs(npc_table) do
			local npc = entity_list:GetMobByNpcTypeID(v);
			if (npc.valid) then
				npc:AddToHateList(e.other,1);
			end
		end
	end
end