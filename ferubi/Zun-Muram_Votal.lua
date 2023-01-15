function event_spawn(e)
	eq.set_timer('popadds', 5 * 1000);
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000);
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 284079 or npc:GetNPCTypeID() == 284103)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end
	else
		eq.stop_timer("OOBcheck");
		eq.set_timer('popadds', 5 * 60 * 1000);
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
elseif(e.timer=='popadds') then
	eq.stop_timer('popadds');
	eq.unique_spawn(284079,0,0,-794,-1017,35,204); -- Pixtt_Votal (284079)
	eq.unique_spawn(284103,0,0,-685,-1019,35,331); -- Pixtt_Votal_ (284103)
end
end
