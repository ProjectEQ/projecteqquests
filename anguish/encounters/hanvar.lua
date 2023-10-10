--[[
Warden_Hanvar (317002)
Chains of Anguish: 5682 45s
Feedback Dispersion: 5681 30s
Wail of Anguish: 5678 45s

- 5 adds spawn at 100, 75, 50, 25 and you cannot dps him down until the adds are dead.
-adds re-spawn 2 minutes after they die

a_seasoned_guard  (317017)
a_veteran_guard   (317015)	
a_weathered_guard (317016)
an_elite_guard    (317018)
--]]

local min_hp			= 100;
local add_spawn_count	= 0;
local adds_killed		= 0;
local add_timer			= 2 * 60 * 1000; -- 2 Minutes
local mobs				= {317015,317016,317017,317018};
local spawn_loc = {
	[1] = {0,0,297,4427,209.8,125.25},
	[2] = {0,0,297,4347,209.8,131.75},
	[3] = {0,0,381,4394,209.8,128.75},
	[4] = {0,0,456,4322,209.8,492.75},
	[5] = {0,0,458,4449,209.8,295.50}
};

function Hanvar_Spawn(e)
	min_hp=100;
	for v in pairs(mobs) do
		eq.depop_all(v)
	end
	eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[1]));
	eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[2]));
	eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[3]));
	eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[4]));
	eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[5]));
end

function Hanvar_Combat(e)
	if e.joined then
		Aggro_Adds(e);
		eq.set_timer("adds", 5 * 1000);	
		eq.set_timer("chains", math.random(10,45) * 1000);
		eq.set_timer("wail", math.random(15,90) * 1000);
		eq.set_timer("check_hp", 1000);
		eq.set_timer("leash", 3000);
		eq.stop_timer("reset");
	else
		eq.stop_all_timers()
		eq.set_timer("reset", 60 * 1000);
	end
end

function Aggro_Adds(e)
	local npc_list =  eq.get_entity_list():GetNPCList();
	for npc in npc_list.entries do
		if npc.valid and (npc:GetNPCTypeID() == 317015 or npc:GetNPCTypeID() == 317016 or npc:GetNPCTypeID() == 317017 or npc:GetNPCTypeID() == 317018) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
		end
	end
end

function Guard_Death(e)
	adds_killed = adds_killed + 1;
	min_hp=min_hp-5;
	if adds_killed == 20 then
		eq.signal(317002,99); -- NPC: Hanvar -- Stop Spawning Adds
	else
		eq.signal(317002,1); -- NPC: Hanvar -- Set Add respawn timer
	end
end

function Guard_Combat(e)
	if e.joined then
		if add_spawn_count <=4 then
			add_spawn_count = add_spawn_count + 1;
			eq.set_timer("depop_warn", 110 * 1000);
		else
			eq.set_timer("depop_warn", 45 * 1000);
		end
	else
		eq.stop_timer("depop_warn");
	end
end

function Guard_Timer(e)
	if e.timer == "depop_warn" then
		eq.set_timer("depop",10 * 1000);
		eq.stop_timer("depop_warn");
		e.self:Emote("prepares to sacrifice its life to Hanvar.");
	elseif e.timer == "depop" then
		e.self:CastSpell(5681, e.self:GetTarget():GetID()); -- Spell: Feedback Dispersion
		e.self:Emote("guard sacrifices himself to give the warden an explosive blast of energy.");
		eq.depop_with_timer();
	end
end

function Hanvar_Timer(e)
	if e.timer == "check_hp" then
		if e.self:GetHPRatio() < min_hp then
			local new_hp = e.self:GetMaxHP() * min_hp / 100;
			e.self:SetHP(new_hp);
		end	
	elseif e.timer == "chains" then
		e.self:CastSpell(5682, e.self:GetTarget():GetID()); -- Spell: Chains of Anguish
		eq.set_timer("chains", 45 * 1000);
	elseif e.timer == "wail" then
		e.self:CastSpell(5678, e.self:GetTarget():GetID()); -- Spell: Wail of Anguish
		eq.set_timer("wail", 90 * 1000);
	elseif e.timer == "adds" then
		if min_hp ~= 0 then
			Aggro_Adds(e);
		else
			eq.stop_timer("adds"); -- can we stop this in Guard_Death? w/e
		end
	elseif e.timer == "leash" then
		if e.self:CalculateDistance(424, 4389, 221.94) >280 then
			reset(e);
		end
	elseif e.timer == "reset" then
		reset(e);
	elseif e.timer == "add1" then
		eq.stop_timer(e.timer);
		eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[1]));
	elseif e.timer == "add2" then
		eq.stop_timer(e.timer);
		eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[2]));
	elseif e.timer == "add3" then
		eq.stop_timer(e.timer);
		eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[3]));
	elseif e.timer == "add4" then
		eq.stop_timer(e.timer);
		eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[4]));
	elseif e.timer == "add5" then
		eq.stop_timer(e.timer);
		eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[5]));
	end
end

function reset(e)
	e.self:GotoBind()
	e.self:SetHP(e.self:GetMaxHP())
	e.self:CastSpell(3791, e.self:GetID())
	e.self:WipeHateList()
	min_hp = 100;
	add_spawn_count	= 0;
	adds_killed		= 0;
	for v in pairs(mobs) do
		eq.depop_all(mobs[v])
	end
	eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[1]));
	eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[2]));
	eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[3]));
	eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[4]));
	eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[5]));
end

function Hanvar_Death(e)
	eq.signal(317116, 317002); -- NPC: zone_status
end

function Hanvar_Signal(e)
	if e.signal == 1 then
		if not eq.has_timer("add1") then
			eq.set_timer("add1", add_timer); -- Respawn
		elseif not eq.has_timer("add2") then
			eq.set_timer("add2", add_timer); -- Respawn
		elseif not eq.has_timer("add3") then
			eq.set_timer("add3", add_timer); -- Respawn
		elseif not eq.has_timer("add4") then
			eq.set_timer("add4", add_timer); -- Respawn
		elseif not eq.has_timer("add5") then
			eq.set_timer("add5", add_timer); -- Respawn
		end
	elseif e.signal == 99 then
		eq.stop_timer("add1");
		eq.stop_timer("add2");
		eq.stop_timer("add3");
		eq.stop_timer("add4");
		eq.stop_timer("add5");
		for v in pairs(mobs) do
			eq.depop_all(mobs[v])
		end
	end
end


function event_encounter_load(e)
	eq.register_npc_event('hanvar', Event.spawn,          317002, Hanvar_Spawn);
	eq.register_npc_event('hanvar', Event.combat,         317002, Hanvar_Combat);
	eq.register_npc_event('hanvar', Event.timer,          317002, Hanvar_Timer);
	eq.register_npc_event('hanvar', Event.death_complete, 317002, Hanvar_Death);
	eq.register_npc_event('hanvar', Event.signal,			317002, Hanvar_Signal);

	for v in pairs(mobs) do
		eq.register_npc_event('hanvar', Event.death_complete,	mobs[v], Guard_Death);
		eq.register_npc_event('hanvar', Event.combat,			mobs[v], Guard_Combat);
		eq.register_npc_event('hanvar', Event.timer,			mobs[v], Guard_Timer);
	end
end

function event_encounter_unload(e)
end
