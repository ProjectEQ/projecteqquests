function event_combat(e)
if (e.joined == true) then
eq.zone_emote(0,"Glykus Helmir blows a carved boar horn. 'My pets! I enfuse you with the power of Zek. Grow and battle with Glykus!");
eq.set_timer("powerup", 3 * 1000);
eq.set_timer("checkadds", 1 * 1000);
else
eq.stop_timer("powerup");
eq.stop_timer("checkadds");
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
			eq.spawn2(214040,0,0,1386,-926,-296,70); -- NPC: a_Fledgling_War_Boar
			eq.spawn2(214040,0,0,1420,-968,-280,33); -- NPC: a_Fledgling_War_Boar
			eq.spawn2(214040,0,0,1483,-925,-296,0); -- NPC: a_Fledgling_War_Boar
			eq.spawn2(214040,0,0,1466,-949,-296,511); -- NPC: a_Fledgling_War_Boar
			eq.spawn2(214040,0,0,1510,-921,-296,458); -- NPC: a_Fledgling_War_Boar
		end
		if (num_alive ==1) then
			eq.spawn2(214040,0,0,1386,-926,-296,70); -- NPC: a_Fledgling_War_Boar
			eq.spawn2(214040,0,0,1420,-968,-280,33); -- NPC: a_Fledgling_War_Boar
			eq.spawn2(214040,0,0,1483,-925,-296,0); -- NPC: a_Fledgling_War_Boar
			eq.spawn2(214040,0,0,1466,-949,-296,511); -- NPC: a_Fledgling_War_Boar
		end
		if (num_alive ==2) then
			eq.spawn2(214040,0,0,1386,-926,-296,70); -- NPC: a_Fledgling_War_Boar
			eq.spawn2(214040,0,0,1483,-925,-296,0); -- NPC: a_Fledgling_War_Boar
			eq.spawn2(214040,0,0,1466,-949,-296,511); -- NPC: a_Fledgling_War_Boar
		end
		if (num_alive ==3) then
			eq.spawn2(214040,0,0,1386,-926,-296,70); -- NPC: a_Fledgling_War_Boar
			eq.spawn2(214040,0,0,1466,-949,-296,511); -- NPC: a_Fledgling_War_Boar
		end
		if (num_alive ==4) then
			eq.spawn2(214040,0,0,1386,-926,-296,70); -- NPC: a_Fledgling_War_Boar
		end
     end
end

function event_death_complete(e)
eq.zone_emote(0,"Glykus Helmir's corpse shouts, 'My pretties!");
eq.depop_all(214134);
eq.depop_all(214133);
eq.depop_all(214132);
eq.depop_all(214131);
end
