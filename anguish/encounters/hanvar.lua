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

local min_hp=100;

function Hanvar_Spawn(e)
    min_hp=100;
	eq.enable_spawn2(54535);
	eq.enable_spawn2(54536);
	eq.enable_spawn2(54537);
	eq.enable_spawn2(54538);
	eq.enable_spawn2(54539);	
end

function Hanvar_Combat(e)
  if (e.joined == true) then
	Aggro_Adds(e);
	eq.set_timer("adds", 10 * 1000);	
	eq.set_timer("chains", math.random(10,45) * 1000);
	eq.set_timer("feedback", math.random(10,30) * 1000);
	eq.set_timer("wail", math.random(10,45) * 1000);
	eq.set_timer("check_hp", 1000);
	eq.set_timer("leash", 3000);
	eq.stop_timer("reset");
  else
    eq.set_timer("reset", 60 * 1000);
	eq.stop_timer("adds");
	eq.stop_timer("chains");
	eq.stop_timer("feedback");
	eq.stop_timer("wail");
	eq.stop_timer("check_hp");
  end
end

function Aggro_Adds(e)
	--spawn 5 adds
	--eq.spawn2(eq.ChooseRandom(317015,317016,317017,317018),0,0, 297, 4347, 209.9, 64);
	--eq.spawn2(eq.ChooseRandom(317015,317016,317017,317018),0,0, 297, 4427, 209.9, 64);
	--eq.spawn2(eq.ChooseRandom(317015,317016,317017,317018),0,0, 458, 4490, 209.9, 148);
	--eq.spawn2(eq.ChooseRandom(317015,317016,317017,317018),0,0, 381, 4394, 209.9, 64);
	--eq.spawn2(eq.ChooseRandom(317015,317016,317017,317018),0,0, 456, 4322, 209.9, 246);
	local npc_list =  eq.get_entity_list():GetNPCList();
	for npc in npc_list.entries do
		if (npc.valid and (npc:GetNPCTypeID() == 317015 or npc:GetNPCTypeID() == 317016 or npc:GetNPCTypeID() == 317017 or npc:GetNPCTypeID() == 317018)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
		end
	end		
end

function Guard_Death(e)
  min_hp=min_hp-5;
end

function Guard_Combat(e)
  if (e.joined == true) then
	eq.set_timer("depop_warn",45*1000);
  else
    eq.stop_timer("depop_warn");
  end
end

function Guard_Spawn(e)
end

function Guard_Timer(e)
  if (e.timer == "depop_warn") then
	eq.set_timer("depop",10*1000);
	eq.stop_timer("depop_warn");
	e.self:Emote("prepares to sacrifice its life to Hanvar.");
  elseif(e.timer=="depop") then
	e.self:CastSpell(5681, e.self:GetTarget():GetID()); --Feedback Dispersion
	e.self:Emote("guard sacrifices himself to give the warden an explosive blast of energy.");
  end
end

function Hanvar_Timer(e)
	if (e.timer == "check_hp") then
		if (e.self:GetHPRatio() < min_hp) then
			local new_hp = e.self:GetMaxHP() * min_hp/100;
			--eq.zone_emote(15, e.self:GetNPCTypeID() .. " Boss HP PCT: " .. e.self:GetMaxHP() .. " new_hp: " .. new_hp);
			e.self:SetHP(new_hp);		
		end	
	elseif (e.timer == "chains") then
		e.self:CastSpell(5682, e.self:GetTarget():GetID());
		eq.set_timer("chains",45*1000); 
	elseif (e.timer == "feedback") then
		e.self:CastSpell(5681, e.self:GetTarget():GetID());
		eq.set_timer("feedback",30*1000); 
	elseif (e.timer == "wail") then
		e.self:CastSpell(5678, e.self:GetTarget():GetID());
		eq.set_timer("wail",45*1000); 
	elseif (e.timer == "adds") then		
		Aggro_Adds(e);
	elseif (e.timer == "leash") then
		if (e.self:CalculateDistance(424, 4389, 221.94) >270) then
			reset(e);			
		end
	elseif (e.timer == "reset") then
		reset(e);
    end
end

function reset(e)
	e.self:GotoBind()
	e.self:SetHP(e.self:GetMaxHP())
	e.self:CastSpell(3791, e.self:GetID())
	e.self:WipeHateList()
	min_hp=100;	
end

function Hanvar_Death(e)
	eq.signal(317116, 317002);
	eq.disable_spawn2(54535);
	eq.disable_spawn2(54536);
	eq.disable_spawn2(54537);
	eq.disable_spawn2(54538);
	eq.disable_spawn2(54539);
	--set player lockout
	--chance to spawn 2.0 orb, if so set zone lockout for "top orb"?
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
  eq.register_npc_event('hanvar', Event.spawn, 317015, Guard_Spawn);  
  eq.register_npc_event('hanvar', Event.spawn, 317016, Guard_Spawn);
  eq.register_npc_event('hanvar', Event.spawn, 317017, Guard_Spawn);
  eq.register_npc_event('hanvar', Event.spawn, 317018, Guard_Spawn);  
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