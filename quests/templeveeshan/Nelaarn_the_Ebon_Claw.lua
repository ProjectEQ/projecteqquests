-- Nelaarn_the_Ebon_Claw NPCID: 124089
function event_combat(e)
	if (e.joined) then
		-- grab the entity list
		local entity_list = eq.get_entity_list();
		-- also aggro Belijor_the_Emerald_Eye (124057) and #Eashen_of_the_Sky (124004)
		-- and Ajorek_the_Crimson_Fang (124088) and Yendilor_the_Cerulean_Wing (124056) if they are up
		local npc_table = {124004,124056,124057,124088};
		for k,v in pairs(npc_table) do
			local npc = entity_list:GetMobByNpcTypeID(v);
			if (npc.valid) then
				npc:AddToHateList(e.other,1);
			end
		end
	end
end