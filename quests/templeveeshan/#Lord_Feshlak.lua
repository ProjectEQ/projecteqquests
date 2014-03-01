-- #Lord_Feshlak NPCID: 124008
function event_combat(e)
	if (e.joined) then
		-- grab the entity list
		local entity_list = eq.get_entity_list();
		-- also aggro Bryrym (124005) and Vukuz (124015) if they are up
		local npc_table = {124005,124015};
		for k,v in pairs(npc_table) do
			local npc = entity_list:GetMobByNpcTypeID(v);
			if (npc.valid) then
				npc:AddToHateList(e.other,1);
			end
		end
	end
end