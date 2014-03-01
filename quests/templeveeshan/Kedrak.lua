-- Kedrak NPCID: 124093
function event_combat(e)
	if (e.joined) then
		-- grab the entity list
		local entity_list = eq.get_entity_list();
		-- also aggro #Lord_Kreizenn (124074) and Carx`Vean (124094) if they are up
		local npc_table = {124074,124094};
		for k,v in pairs(npc_table) do
			local npc = entity_list:GetMobByNpcTypeID(v);
			if (npc.valid) then
				npc:AddToHateList(e.other,1);
			end
		end
	end
end