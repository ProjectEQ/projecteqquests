--[[
Warden_Hanvar (317002)

Chains of Anguish: 5682 45s
Feedback Dispersion: 5681 30s
Wail of Anguish: 5678 45s

a_seasoned_guard  (317017)
a_veteran_guard   (317015)	
a_weathered_guard (317016)
an_elite_guard    (317018)
--]]

local min_hp			= 100;
local add_spawn_count	= 0;
local adds_killed		= 0;

function Hanvar_Spawn(e)
	min_hp=100;
	eq.enable_spawn2(54535);
	eq.enable_spawn2(54536);
	eq.enable_spawn2(54537);
	eq.enable_spawn2(54538);
	eq.enable_spawn2(54539);
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
		eq.enable_spawn2(54535);
		eq.enable_spawn2(54536);
		eq.enable_spawn2(54537);
		eq.enable_spawn2(54538);
		eq.enable_spawn2(54539);
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
		eq.disable_spawn2(54535);
		eq.disable_spawn2(54536);
		eq.disable_spawn2(54537);
		eq.disable_spawn2(54538);
		eq.disable_spawn2(54539);
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
	eq.enable_spawn2(54535);
	eq.enable_spawn2(54536);
	eq.enable_spawn2(54537);
	eq.enable_spawn2(54538);
	eq.enable_spawn2(54539);
end

function Hanvar_Death(e)
	eq.signal(317116, 317002); -- NPC: zone_status
	eq.disable_spawn2(54535);
	eq.disable_spawn2(54536);
	eq.disable_spawn2(54537);
	eq.disable_spawn2(54538);
	eq.disable_spawn2(54539);
end

function event_encounter_load(e)
	eq.register_npc_event('hanvar', Event.spawn,          317002, Hanvar_Spawn);
	eq.register_npc_event('hanvar', Event.combat,         317002, Hanvar_Combat);
	eq.register_npc_event('hanvar', Event.timer,          317002, Hanvar_Timer);
	eq.register_npc_event('hanvar', Event.death_complete, 317002, Hanvar_Death);
	eq.register_npc_event('hanvar', Event.death_complete, 317015, Guard_Death);
	eq.register_npc_event('hanvar', Event.death_complete, 317016, Guard_Death);
	eq.register_npc_event('hanvar', Event.death_complete, 317017, Guard_Death);
	eq.register_npc_event('hanvar', Event.death_complete, 317018, Guard_Death);
	eq.register_npc_event('hanvar', Event.combat, 317015, Guard_Combat);
	eq.register_npc_event('hanvar', Event.combat, 317016, Guard_Combat);
	eq.register_npc_event('hanvar', Event.combat, 317017, Guard_Combat);
	eq.register_npc_event('hanvar', Event.combat, 317018, Guard_Combat);
	eq.register_npc_event('hanvar', Event.timer, 317015, Guard_Timer);
	eq.register_npc_event('hanvar', Event.timer, 317016, Guard_Timer);
	eq.register_npc_event('hanvar', Event.timer, 317017, Guard_Timer);
	eq.register_npc_event('hanvar', Event.timer, 317018, Guard_Timer);
end

function event_encounter_unload(e)
end
