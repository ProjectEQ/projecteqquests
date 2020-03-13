function event_combat(e)
if (e.joined == true) then
eq.set_timer("powerup", 3 * 1000);
eq.set_timer("checkadds", 1 * 1000);
else
eq.stop_timer("powerup");
eq.stop_timer("checkadds");
end
end
end

function event_timer(e)
if (e.timer == "powerup") then
eq.signal(214040,1); --a_Fledgling_War_Boar to start evolving
elseif (e.timer == "checkadds") then
eq.stop_timer("checkadds");
local num_alive=0;
		local npc_list = eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 214040 or npc:GetNPCTypeID() == 214133 or npc:GetNPCTypeID() == 214132 or npc:GetNPCTypeID() == 214131 or npc:GetNPCTypeID() == 214134)) then
				num_alive=num_alive+1;
			end
		end
		
		if (num_alive ==0) then
			eq.spawn2(214040,0,0,1386,-926,-296,70);
			eq.spawn2(214040,0,0,1386,-926,-296,70);
			eq.spawn2(214040,0,0,1386,-926,-296,70);
			eq.spawn2(214040,0,0,1386,-926,-296,70);
			eq.spawn2(214040,0,0,1386,-926,-296,70);
		end
		if (num_alive ==1) then
			eq.spawn2(214040,0,0,1386,-926,-296,70);
			eq.spawn2(214040,0,0,1386,-926,-296,70);
			eq.spawn2(214040,0,0,1386,-926,-296,70);
			eq.spawn2(214040,0,0,1386,-926,-296,70);
		end
		if (num_alive ==2) then
			eq.spawn2(214040,0,0,1386,-926,-296,70);
			eq.spawn2(214040,0,0,1386,-926,-296,70);
			eq.spawn2(214040,0,0,1386,-926,-296,70);
		end
		if (num_alive ==3) then
			eq.spawn2(214040,0,0,1386,-926,-296,70);
			eq.spawn2(214040,0,0,1386,-926,-296,70);
		end
		if (num_alive ==4) then
			eq.spawn2(214040,0,0,1386,-926,-296,70);
		end
     end
end
