function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000);
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 284079 or npc:GetNPCTypeID() == 284080)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end	
	else
		eq.stop_timer("OOBcheck");
	end
end


function event_timer(e)
if(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetY() > -400) then
		e.self:GotoBind();
		e.self:WipeHateList();
	else
		eq.set_timer("OOBcheck", 6 * 1000);
	end
end
end
