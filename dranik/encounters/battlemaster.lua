

function Battlemaster_Spawn(e)
	eq.spawn2(336119, 0, 0, 1882.69, 2280.94, -24.97, .5);
	eq.spawn2(336118, 0, 0, 1462.19, 2280.65, -24.97, .5);
	eq.spawn2(336117, 0, 0, 1589, 2822, -24.97, 126.5);
	eq.spawn2(336117, 0, 0, 1677, 2822, -24.97, 126.5);
	eq.spawn2(336117, 0, 0, 1765, 2822, -24.97, 126.5);
	eq.set_next_hp_event(75);
end

function Battlemaster_HP(e)
	if (e.hp_event == 75) then
		eq.depop_all(336119);
		eq.depop_all(336118);
		eq.spawn2(336237, 0, 0, 1882.69, 2280.94, -24.97, .5);
		eq.spawn2(336238, 0, 0, 1462.19, 2280.65, -24.97, .5);
		eq.set_next_hp_event(50);
		local npc_list = eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 336237 or npc:GetNPCTypeID() == 336238)) then
				npc:AddToHateList(e.self:GetHateTop(),1);
			end
		end	
	elseif (e.hp_event == 50) then
		eq.depop_all(336117);
		eq.spawn2(336239, 0, 0, 1589, 2822, -24.97, 126.5);
		eq.spawn2(336239, 0, 0, 1677, 2822, -24.97, 126.5);
		eq.spawn2(336239, 0, 0, 1765, 2822, -24.97, 126.5);
		local npc_list = eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 336239)) then
				npc:AddToHateList(e.self:GetHateTop(),1);
			end
		end		
	end
end

function Battlemaster_Combat(e)
	if (e.joined == true) then
		eq.stop_timer("wipecheck");
	else
		eq.set_timer("wipecheck", 60*1000); -- 10m (600s) wipe timer XXXXXXXXXXXXXXXXXXXX
	end
end

function Battlemaster_Timer(e)
	if (e.timer == "wipecheck") then
		--eq.update_spawn_timer(336120, 15*1000); -- Reset event, spawn 2 (7200s) hours after failure XXXXXXXXXXXXXXXXXXXX
		eq.depop_all(336117);
		eq.depop_all(336118);
		eq.depop_all(336119);
		eq.depop_all(336237);
		eq.depop_all(336238);
		eq.depop_all(336239);
		eq.spawn2(336119, 0, 0, 1882.69, 2280.94, -24.97, .5);
		eq.spawn2(336118, 0, 0, 1462.19, 2280.65, -24.97, .5);
		eq.spawn2(336117, 0, 0, 1589, 2822, -24.97, 126.5);
		eq.spawn2(336117, 0, 0, 1677, 2822, -24.97, 126.5);
		eq.spawn2(336117, 0, 0, 1765, 2822, -24.97, 126.5);
        e.self:GotoBind()
        e.self:SetHP(e.self:GetMaxHP())
        e.self:CastSpell(3791, e.self:GetID())		
		eq.set_next_hp_event(75);	
		eq.stop_timer("wipecheck");		
	end
end 


function All_Death(e)
	local add_alive=0;
	local npc_list = eq.get_entity_list():GetNPCList();
	for npc in npc_list.entries do
		if (npc.valid and (npc:GetNPCTypeID() == 336120 or  npc:GetNPCTypeID() == 336237 or npc:GetNPCTypeID() == 336238 or npc:GetNPCTypeID() == 336239 or npc:GetNPCTypeID()==336117 or npc:GetNPCTypeID()==336118 or npc:GetNPCTypeID()==336119)) then				
			add_alive=add_alive+1;
			--eq.zone_emote(15, "adds alive" .. add_alive);
		end
	end	
	if (add_alive==0) then
		--eq.zone_emote(15, "no adds alive" .. add_alive);
		eq.spawn2(336134, 0, 0, 1678,2778,-24.97,130.5); -- spawn ironbound chest
	end
end



function event_encounter_load(e)
	--eq.zone_emote(15, "encounter load");
	eq.register_npc_event('battlemaster', Event.spawn,			336120, Battlemaster_Spawn);
	eq.register_npc_event('battlemaster', Event.combat,			336120, Battlemaster_Combat);	
	eq.register_npc_event('battlemaster', Event.timer,          336120, Battlemaster_Timer);
	eq.register_npc_event('battlemaster', Event.signal,         336120, Battlemaster_Signal);
	eq.register_npc_event('battlemaster', Event.hp,				336120, Battlemaster_HP);  
	eq.register_npc_event('battlemaster', Event.death_complete, 336120, All_Death);
	eq.register_npc_event('battlemaster', Event.death_complete,	336120, All_Death);
	eq.register_npc_event('battlemaster', Event.death_complete,	336237, All_Death);
	eq.register_npc_event('battlemaster', Event.death_complete,	336238, All_Death);
	eq.register_npc_event('battlemaster', Event.death_complete,	336239, All_Death);

end

function event_encounter_unload(e)
	--eq.zone_emote(15, "encounter unload");
end
