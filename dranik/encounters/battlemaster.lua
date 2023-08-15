--battlemaster_controller (336127)


function Controller_Spawn(e)
	eq.set_timer("spawnevent", 6*1000);
	reset = 0;
end

function Controller_Signal(e)
	local reset = 0;
	if(e.signal == 1) then
		eq.debug("signal received to reset");
		if (reset == 0) then
			
			reset = 1;
			eq.debug("reset status " .. reset);
			eq.depop_all(336119);
			eq.depop_all(336118);
			eq.depop_all(336117);
			eq.depop_all(336120);
			eq.set_timer("reset", 5400*1000); -- 90 minute reset
			
			
		end
	end
end

function Controller_Timer(e)
	if (e.timer == "reset") then
		eq.stop_timer("reset");
		eq.spawn2(336119, 0, 0, 1882.69, 2280.94, -24.97, 1); -- NPC: #Ixt_Imnes_the_Ironhoof
		eq.spawn2(336118, 0, 0, 1462.19, 2280.65, -24.97, 1); -- NPC: #Ikaav_Salisa_Mexmielk
		eq.spawn2(336117, 0, 0, 1589, 2822, -24.97, 253); -- NPC: Frenetic_Groundpounder
		eq.spawn2(336117, 0, 0, 1677, 2822, -24.97, 253); -- NPC: Frenetic_Groundpounder
		eq.spawn2(336117, 0, 0, 1765, 2822, -24.97, 253); -- NPC: Frenetic_Groundpounder
		eq.unique_spawn(336120, 0, 0, 1678, 2778, -25, 261); -- NPC: #Battlemaster_Rhorious (336120)
		reset = 0;
	elseif (e.timer == "spawnevent") then
		eq.stop_timer("spawnevent");
		eq.spawn2(336119, 0, 0, 1882.69, 2280.94, -24.97, 1); -- NPC: #Ixt_Imnes_the_Ironhoof
		eq.spawn2(336118, 0, 0, 1462.19, 2280.65, -24.97, 1); -- NPC: #Ikaav_Salisa_Mexmielk
		eq.spawn2(336117, 0, 0, 1589, 2822, -24.97, 253); -- NPC: Frenetic_Groundpounder
		eq.spawn2(336117, 0, 0, 1677, 2822, -24.97, 253); -- NPC: Frenetic_Groundpounder
		eq.spawn2(336117, 0, 0, 1765, 2822, -24.97, 253); -- NPC: Frenetic_Groundpounder
		eq.unique_spawn(336120, 0, 0, 1678, 2778, -25, 261); -- NPC: #Battlemaster_Rhorious (336120)
		reset = 0;
	end
end

function Battlemaster_Spawn(e)
	eq.set_next_hp_event(75);
	--eq.spawn2(336119, 0, 0, 1882.69, 2280.94, -24.97, 1); -- NPC: #Ixt_Imnes_the_Ironhoof
	--eq.spawn2(336118, 0, 0, 1462.19, 2280.65, -24.97, 1); -- NPC: #Ikaav_Salisa_Mexmielk
	--eq.spawn2(336117, 0, 0, 1589, 2822, -24.97, 253); -- NPC: Frenetic_Groundpounder
	--eq.spawn2(336117, 0, 0, 1677, 2822, -24.97, 253); -- NPC: Frenetic_Groundpounder
	--eq.spawn2(336117, 0, 0, 1765, 2822, -24.97, 253); -- NPC: Frenetic_Groundpounder
	--eq.set_next_hp_event(75);
end

function Battlemaster_HP(e)
	if (e.hp_event == 75) then
		eq.signal(336119,1); --become active
		eq.signal(336118,1); --become active
		--eq.depop_all(336119);
		--eq.depop_all(336118);
		--eq.spawn2(336237, 0, 0, 1882.69, 2280.94, -24.97, 1); -- NPC: Ixt_Imnes_the_Ironhoof
		--eq.spawn2(336238, 0, 0, 1462.19, 2280.65, -24.97, 1); -- NPC: Ikaav_Salisa_Mexmielk
		eq.set_next_hp_event(50);

	elseif (e.hp_event == 50) then
		eq.signal(336117,1); --become active
		--eq.depop_all(336117);
		--eq.spawn2(336239, 0, 0, 1589, 2822, -24.97, 253); -- NPC: #Frenetic_Groundpounder
		--eq.spawn2(336239, 0, 0, 1677, 2822, -24.97, 253); -- NPC: #Frenetic_Groundpounder
		--eq.spawn2(336239, 0, 0, 1765, 2822, -24.97, 253); -- NPC: #Frenetic_Groundpounder
				
	end
end

function Battlemaster_Combat(e)
	if e.joined then
		if(not eq.is_paused_timer("wipecheck")) then
			eq.pause_timer("wipecheck");
		end
	else
		eq.resume_timer("wipecheck");
	end
end

function Battlemaster_Timer(e)
	if (e.timer == "wipecheck") then
		eq.stop_timer("wipecheck");
		eq.signal(336127,1); --battlemaster_controller (336127) initiate respawn sequence
	end
end 

function GoatIxt_Signal(e)
	if(e.signal == 1) then
		e.self:SetSpecialAbility(24, 0); --turn off anti aggro
		e.self:SetSpecialAbility(35, 0); --turn off immunity
		eq.set_timer("path", 5 * 1000);
		e.self:SetRunning(true);
		eq.set_timer("wipecheck", 1200*1000); -- 20 minute reset
		
	end
end

function GoatIxt_Timer(e)
	if (e.timer == "path") then
		local battlemaster = eq.get_entity_list():GetMobByNpcTypeID(336120); -- #Battlemaster_Rhorious (336120)
		if ( battlemaster.valid ) then
			e.self:MoveTo(battlemaster:GetX(), battlemaster:GetY(), battlemaster:GetZ(), -1, true);
		end
	elseif (e.timer == "wipecheck") then
		eq.stop_timer("wipecheck");
		eq.signal(336127,1); --battlemaster_controller (336127) initiate respawn sequence
	end
end

function GoatIxt_Combat(e)
	if e.joined then
		if(not eq.is_paused_timer("wipecheck")) then
			eq.pause_timer("wipecheck");
		end
	else
		eq.resume_timer("wipecheck");
	end
end
		

function All_Death(e)
	local add_alive=0;
	local npc_list = eq.get_entity_list():GetNPCList();
	for npc in npc_list.entries do
		if (npc.valid and (npc:GetNPCTypeID() == 336120 or  npc:GetNPCTypeID() == 336237 or npc:GetNPCTypeID() == 336238 or npc:GetNPCTypeID() == 336239 or npc:GetNPCTypeID()==336117 or npc:GetNPCTypeID()==336118 or npc:GetNPCTypeID()==336119)) then				
			add_alive=add_alive+1;
			--eq.zone_emote(MT.Yellow, "adds alive" .. add_alive);
		end
	end	
	if (add_alive==0) then
		--eq.zone_emote(MT.Yellow, "no adds alive" .. add_alive);
		eq.spawn2(336134, 0, 0, 1678,2778,-24.97,261); -- spawn ironbound chest
		eq.depop_with_timer(336127); --send controller into respawn
	end
end



function event_encounter_load(e)
	--eq.zone_emote(MT.Yellow, "encounter load");
	eq.register_npc_event('battlemaster', Event.spawn,			336127, Controller_Spawn);
	eq.register_npc_event('battlemaster', Event.signal,			336127, Controller_Signal);
	eq.register_npc_event('battlemaster', Event.timer,			336127, Controller_Timer);
		
	eq.register_npc_event('battlemaster', Event.spawn,			336120, Battlemaster_Spawn);
	eq.register_npc_event('battlemaster', Event.combat,			336120, Battlemaster_Combat);
	eq.register_npc_event('battlemaster', Event.timer,          336120, Battlemaster_Timer);
	eq.register_npc_event('battlemaster', Event.hp,				336120, Battlemaster_HP);
		
	eq.register_npc_event('battlemaster', Event.signal,         336119, GoatIxt_Signal);
	eq.register_npc_event('battlemaster', Event.signal,         336118, GoatIxt_Signal);
	eq.register_npc_event('battlemaster', Event.signal,         336117, GoatIxt_Signal);
	eq.register_npc_event('battlemaster', Event.timer,         336119, GoatIxt_Timer);
	eq.register_npc_event('battlemaster', Event.timer,         336118, GoatIxt_Timer);
	eq.register_npc_event('battlemaster', Event.timer,         336117, GoatIxt_Timer);
	eq.register_npc_event('battlemaster', Event.combat,         336119, GoatIxt_Combat);
	eq.register_npc_event('battlemaster', Event.combat,         336118, GoatIxt_Combat);
	eq.register_npc_event('battlemaster', Event.combat,         336117, GoatIxt_Combat);
		
	eq.register_npc_event('battlemaster', Event.death_complete, 336120, All_Death);
	eq.register_npc_event('battlemaster', Event.death_complete, 336119, All_Death);
	eq.register_npc_event('battlemaster', Event.death_complete, 336118, All_Death);
	eq.register_npc_event('battlemaster', Event.death_complete, 336117, All_Death);

end

function event_encounter_unload(e)
	--eq.zone_emote(MT.Yellow, "encounter unload");
end
