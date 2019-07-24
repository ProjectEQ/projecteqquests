function event_spawn(e)
local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 347044)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
			end
end

function event_death_complete(e)
eq.set_timer("repop", 45 * 1000);
end

function event_timer(e)
if(e.timer=="repop") then
eq.stop_timer("repop");
eq.spawn2(eq.ChooseRandom(347033,347009), 0, 0, 929, -826, 163, 193);
end
end
