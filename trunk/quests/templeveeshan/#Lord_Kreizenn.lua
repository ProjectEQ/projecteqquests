-- #Lord_Kreizenn NPCID: 124074
function event_combat(e)
	if (e.joined) then
		-- grab the entity list
		local entity_list = eq.get_entity_list();
		-- also aggro Kedrak (124093) and Carx`Vean (124094) if they are up
		local npc_table = {124093,124094};
		for k,v in pairs(npc_table) do
			local npc = entity_list:GetMobByNpcTypeID(v);
			if (npc.valid) then
				npc:AddToHateList(e.other,1);
			end
		end
	end
end