--[[
--  #King_Gelaqua (334041)
--  #Prince_Ilsin (334040)
--  #Prince_Cynin (334039)
--  #Prince_Scyllus (334038)
--  #Prince_Britalic (334037)
--  #Prince_Allin (334036)
--  #Prince_Kiranus (334035)
--  a_crystalline_portal (334034)
--  ###a_crystalline_portal (334113)
--  ##a_crystalline_portal (334112)
--  #####a_crystalline_portal (334115)
--  ####a_crystalline_portal (334114)
--  #a_crystalline_portal (334111)
--  a_snarling_feran (334094)
--  an_icy_orb (334095)
--  a_gelidin_crystal (334110)
--
--  First phase:
--      Kill all Princes
--      Each Prince is linked to one portal
--      Every 40-60 seconds a portal with an active Prince has a chance to spawn
--      an add
--      a snarling feran can be mezzed or killed, spawns after 4 min 30 seconds
--      an icy orb can be rooted/snared and will path towards the king, once it
--      reaches the king it will run towrads a player, if it reaches the player
--      it will split into 4 a geldin crystals which AE and despawn after 7 mins
--  Second phase: (killing all princes triggers)
--      King becomes active and aggros the raid
--      Every 40-60 seconds the King will cause a portal to activate
--      An orb will always spawn when the King activates a portal
--
--  There is no resetting the event
--
--  Princes and King leashed to room, adds are not
--]]

local portals		= {}; -- [Prince's NPC Type ID, Portal's mob]
local box			= require("aa_box");
local leash_box 	= box(-130, -680, -460, 360);
local king			= nil;
local orbstate		= {}; -- [Spawn ID, chase state]
local timerstate	= {}; -- [Spawn ID, state of timer for portal adds]
local princecount	= 0;
local add_sequence	= 0;

-- various functions we use
function CheckLeash(e)
	if not leash_box:contains(e.self:GetX(), e.self:GetY()) then
		e.self:GotoBind();
		e.self:SetHP(e.self:GetMaxHP());
		e.self:WipeHateList();
	end
end

function PortalAdds(mob)
	local id = eq.ChooseRandom(334094, 334095);
	if id > 0 then
		eq.spawn2(id, 0, 0, mob:GetX(), mob:GetY(), mob:GetZ(), mob:GetHeading());
	end
end

function DistanceToWaypoint(self)
	return self:CalculateDistance(self:GetWaypointX(), self:GetWaypointY(), self:GetWaypointZ());
end

function ExploadOrb(mob)
	eq.spawn2(334110, 0, 0, mob:GetX(), mob:GetY(), mob:GetZ(), mob:GetHeading()):TryMoveAlong(10.0, 0.0);
	eq.spawn2(334110, 0, 0, mob:GetX(), mob:GetY(), mob:GetZ(), mob:GetHeading()):TryMoveAlong(10.0, 128.0);
	eq.spawn2(334110, 0, 0, mob:GetX(), mob:GetY(), mob:GetZ(), mob:GetHeading()):TryMoveAlong(10.0, 256.0);
	eq.spawn2(334110, 0, 0, mob:GetX(), mob:GetY(), mob:GetZ(), mob:GetHeading()):TryMoveAlong(10.0, 384.0);
	eq.depop()
end

function CheckPortals()
	portals[334040] = eq.unique_spawn(334034, 0, 0, -254.000000, -348.000000, -775.640015, 198.800004);	-- Ilsin
	portals[334039] = eq.unique_spawn(334113, 0, 0, -227.350693, -330.371887, -775.744202, 200.75);		-- Cynin
	portals[334038] = eq.unique_spawn(334112, 0, 0, -201.000000, -315.000000, -771.000000, 208);		-- Scyllus
	portals[334037] = eq.unique_spawn(334115, 0, 0, 100.360001, -310.549988, -775.650024, 293.200012);	-- Britalic
	portals[334036] = eq.unique_spawn(334114, 0, 0, 128.330002, -325.309998, -775.650024, 301.200012);	-- Allin
	portals[334035] = eq.unique_spawn(334111, 0, 0, 153.787323, -343.277649, -775.744202, 311);			-- Kiranus
end

-- king hooks
function KingSpawn(e)
	king			= e.self;
	princecount		= 0;
	add_sequence	= 0;

	eq.set_timer("tether", 6 * 1000);
	eq.set_timer("spawn_delayed", 1000);
	timerstate[e.self:GetID()] = false;
end

function KingSpawnDelayed(e) 
	eq.unique_spawn(334040, 0, 0, -215.000000, -580.000000, -768.375000, 0.000000);	-- Ilsin
	eq.unique_spawn(334039, 0, 0, -181.529999, -579.500000, -775.599976, 1.6);		-- Cynin
	eq.unique_spawn(334038, 0, 0, -148.000000, -580.000000, -768.375000, 0);		-- Scyllus
	eq.unique_spawn(334037, 0, 0, 59.000000, -580.000000, -768.375000, 0);			-- Britalic
	eq.unique_spawn(334036, 0, 0, 92.400002, -579.369995, -775.599976, 0);			-- Allin
	eq.unique_spawn(334035, 0, 0, 127.000000, -580.000000, -768.375000, 0);			-- Kiranus
	CheckPortals();
end

function KingTimer(e)
	if e.timer == "tether" then
		CheckLeash(e);
	elseif e.timer == "spawn_delayed" then
		KingSpawnDelayed(e);
		eq.stop_timer(e.timer);
	elseif e.timer == "portals" then
		if e.self:IsEngaged() then
			eq.set_timer("portals", math.random(40,60) * 1000); -- 40-60 sec
			local portal = portals[eq.ChooseRandom(334040, 334039, 334038, 334037, 334036, 334035)];
			eq.spawn2(334095, 0, 0, portal:GetX(), portal:GetY(), portal:GetZ(), portal:GetHeading());
		else
			eq.stop_timer("portals");
			timerstate[e.self:GetID()] = false;
		end
	elseif e.timer == "aggro" then
		local get_client=eq.get_entity_list():GetRandomClient(-46,-474,-778,330); --330x330
		--get client within 330 radius			
		if get_client.valid and not get_client:GetFeigned() then
			e.self:AddToHateList(get_client,1);
		end
	end
end

function KingCombat(e)
	if e.joined then
		if not timerstate[e.self:GetID()] then
			eq.set_timer("portals", 5000); -- 5 sec initially
			timerstate[e.self:GetID()] = true;
		end
		eq.stop_timer("aggro");
	else
		eq.set_timer("aggro", 5 * 1000);
	end
end

function KingDeath(e)
	king = nil;
end

function KingSignal(e)
	eq.set_timer("aggro", 5 * 1000);
end

-- prince hooks
function PrinceSpawn(e)
	eq.set_timer("tether", 6 * 1000);
	timerstate[e.self:GetID()] = false;
	princecount = princecount + 1;
end

function PrinceTimer(e)
	if e.timer == "tether" then
		CheckLeash(e);
	elseif e.timer == "portals" then
		if e.self:IsEngaged() then
			eq.set_timer("portals", math.random(40,60) * 1000); -- 40-60 sec
			PortalAdds(portals[e.self:GetNPCTypeID()]);
		else
			eq.stop_timer("portals");
			timerstate[e.self:GetID()] = false;
		end
	elseif e.timer == "aggro" then
		local get_client=eq.get_entity_list():GetRandomClient(-46,-474,-778,330); --330x330
		--get client within 330 radius			
		if get_client.valid and not get_client:GetFeigned() then
			e.self:AddToHateList(get_client,1);
		end
	elseif e.timer == "hatelink" then
		if e.self:GetNPCTypeID() == 334036 or e.self:GetNPCTypeID() == 334037 or e.self:GetNPCTypeID() == 334035 then
			--#Prince_Allin (334036), #Prince_Britalic (334037), #Prince_Kiranus (334035)
			local npc_list =  eq.get_entity_list():GetNPCList();
			for npc in npc_list.entries do
				if npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 334036 or npc:GetNPCTypeID() == 334037 or npc:GetNPCTypeID() == 334035 or npc:GetNPCTypeID() == 334094) then
					npc:AddToHateList(e.self:GetHateRandom(),1);
				end
			end
		elseif e.self:GetNPCTypeID() == 334038 or e.self:GetNPCTypeID() == 334040 or e.self:GetNPCTypeID() == 334039 then
				--#Prince_Scyllus (334038), #Prince_Ilsin (334040),#Prince_Cynin (334039)
			local npc_list =  eq.get_entity_list():GetNPCList();
			for npc in npc_list.entries do
				if npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 334038 or npc:GetNPCTypeID() == 334040 or npc:GetNPCTypeID() == 334039 or npc:GetNPCTypeID() == 334094) then
					npc:AddToHateList(e.self:GetHateRandom(),1);
				end
			end
		end
	end
end

function PrinceCombat(e)
	if e.joined then
		if not timerstate[e.self:GetID()] then
			eq.set_timer("portals", 5000); -- 5 sec initially
			timerstate[e.self:GetID()] = true;
			--PortalAdds(portals[e.self:GetNPCTypeID()]) adds should spawn after 5 sec of initial aggro
		end
		eq.stop_timer("aggro");
		eq.set_timer("hatelink", 4 * 1000);
	else
		if add_sequence == 1 then
			eq.set_timer("aggro", 5 * 1000);
		end
		eq.stop_timer("hatelink");
	end
end

function PrinceSignal(e)
	add_sequence = 1;
	eq.set_timer("aggro", 5 * 1000);
end

function PrinceDeath(e)
	princecount = princecount - 1;
	if princecount == 0 then
		king:SetSpecialAbility(SpecialAbility.immune_melee, 0);
		king:SetSpecialAbility(SpecialAbility.immune_magic, 0);
		king:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		king:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
		eq.signal(334041,1); --#King_Gelaqua (334041)
	end
	
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(334036) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(334037) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(334035) then
		--#Prince_Allin (334036), #Prince_Britalic (334037), #Prince_Kiranus (334035)
		eq.signal(334039,1);
		eq.signal(334038,1);
		eq.signal(334040,1);
		
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if npc.valid and (npc:GetNPCTypeID() == 334039 or npc:GetNPCTypeID() == 334040 or npc:GetNPCTypeID() == 334038) then
				--#Prince_Scyllus (334038), #Prince_Ilsin (334040),#Prince_Cynin (334039)
				--npc:AddToHateList(e.self:GetHateTop(),1);
				npc:ModifyNPCStat("aggro", "200");
				npc:ModifyNPCStat("assist", "200");
			end
		end
	elseif not eq.get_entity_list():IsMobSpawnedByNpcTypeID(334038) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(334040) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(334039) then
		--#Prince_Scyllus (334038), #Prince_Ilsin (334040),#Prince_Cynin (334039)
		eq.signal(334037,1);
		eq.signal(334036,1);
		eq.signal(334045,1);
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if npc.valid and (npc:GetNPCTypeID() == 334037 or npc:GetNPCTypeID() == 334036 or npc:GetNPCTypeID() == 334035) then
				--#Prince_Allin (334036), #Prince_Britalic (334037), #Prince_Kiranus (334035)
				--npc:AddToHateList(e.self:GetHateTop(),1);
				npc:ModifyNPCStat("aggro", "200");
				npc:ModifyNPCStat("assist", "200");
			end
		end
	end
end

-- other hooks
function FeranSpawn(e)
	eq.set_timer("depop", 270000); -- 4 min 30 sec
end

function FeranCombat(e)
	if (e.joined == true) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
		e.self:SaveGuardSpot(e.self:GetX(),e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	end
end

function FeranTimer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function OrbSpawn(e)
	if king ~= nil then
		e.self:MoveTo(king:GetX(), king:GetY(), king:GetZ(), 0, true);
	end
	eq.set_timer("check_dist", 2000);
	orbstate[e.self:GetID()] = 0;
end


function CrystalSpawn(e)
	-- need to enable butterfly effect?
	eq.set_timer("depop", 420000);	-- 7 min
	e.self:CastSpell(5760, 0);		-- Gelaqua's Embrace
	eq.set_timer("ae", 4000);		-- 4 sec
end

-- All adds use this function, but they don't all have these timers :P
function AddTimer(e)
	if e.timer == "depop" then
		eq.depop();
	elseif e.timer == "ae" then
		e.self:CastSpell(5760, 0); -- Gelaqua's Embrace
	elseif e.timer == "check_dist" then
		-- still walking to king
		if orbstate[e.self:GetID()] == 0 and king ~= nil then
			-- if he is active, he might of moved, maybe better way to do this
			e.self:MoveTo(king:GetX(), king:GetY(), king:GetZ(), 0, true);
			if DistanceToWaypoint(e.self) <= 10 then
				local client = eq.get_entity_list():GetRandomClient(-41, -431, -780, 250000); -- TODO: fix range
				if client.valid then
					orbstate[e.self:GetID()] = client:GetID();
					e.self:SetRunning(true);
					e.self:MoveTo(client:GetX(), client:GetY(), client:GetZ(), 0, true);
				else
					ExploadOrb(e.self) -- ahh I guess so? something went wrong so lets just die :P
				end
			end
		else
			local target = eq.get_entity_list():GetMob(orbstate[e.self:GetID()]);
			if target.valid then
				e.self:MoveTo(target:GetX(), target:GetY(), target:GetZ(), 0, true);
				if DistanceToWaypoint(e.self) <= 3 then
					ExploadOrb(e.self);
				end
			else
				ExploadOrb(e.self);
			end
		end
	end
end

function event_encounter_load(e)
	eq.register_npc_event("king", Event.spawn, 334041, KingSpawn);
	eq.register_npc_event("king", Event.timer, 334041, KingTimer);
	eq.register_npc_event("king", Event.combat, 334041, KingCombat);
	eq.register_npc_event("king", Event.signal, 334041, KingSignal);
	eq.register_npc_event("king", Event.death_complete, 334041, KingDeath);

	eq.register_npc_event("king", Event.spawn, 334040, PrinceSpawn);
	eq.register_npc_event("king", Event.spawn, 334039, PrinceSpawn);
	eq.register_npc_event("king", Event.spawn, 334038, PrinceSpawn);
	eq.register_npc_event("king", Event.spawn, 334037, PrinceSpawn);
	eq.register_npc_event("king", Event.spawn, 334036, PrinceSpawn);
	eq.register_npc_event("king", Event.spawn, 334035, PrinceSpawn);
	eq.register_npc_event("king", Event.timer, 334040, PrinceTimer);
	eq.register_npc_event("king", Event.timer, 334039, PrinceTimer);
	eq.register_npc_event("king", Event.timer, 334038, PrinceTimer);
	eq.register_npc_event("king", Event.timer, 334037, PrinceTimer);
	eq.register_npc_event("king", Event.timer, 334036, PrinceTimer);
	eq.register_npc_event("king", Event.timer, 334035, PrinceTimer);
	eq.register_npc_event("king", Event.combat, 334040, PrinceCombat);
	eq.register_npc_event("king", Event.combat, 334039, PrinceCombat);
	eq.register_npc_event("king", Event.combat, 334038, PrinceCombat);
	eq.register_npc_event("king", Event.combat, 334037, PrinceCombat);
	eq.register_npc_event("king", Event.combat, 334036, PrinceCombat);
	eq.register_npc_event("king", Event.combat, 334035, PrinceCombat);
	
	eq.register_npc_event("king", Event.signal, 334040, PrinceSignal);
	eq.register_npc_event("king", Event.signal, 334039, PrinceSignal);
	eq.register_npc_event("king", Event.signal, 334038, PrinceSignal);
	eq.register_npc_event("king", Event.signal, 334037, PrinceSignal);
	eq.register_npc_event("king", Event.signal, 334036, PrinceSignal);
	eq.register_npc_event("king", Event.signal, 334035, PrinceSignal);
	
	eq.register_npc_event("king", Event.death_complete, 334040, PrinceDeath);
	eq.register_npc_event("king", Event.death_complete, 334039, PrinceDeath);
	eq.register_npc_event("king", Event.death_complete, 334038, PrinceDeath);
	eq.register_npc_event("king", Event.death_complete, 334037, PrinceDeath);
	eq.register_npc_event("king", Event.death_complete, 334036, PrinceDeath);
	eq.register_npc_event("king", Event.death_complete, 334035, PrinceDeath);

	eq.register_npc_event("king", Event.spawn, 334094, FeranSpawn);
	eq.register_npc_event("king", Event.combat, 334094, FeranCombat);
	eq.register_npc_event("king", Event.timer, 334094, FeranTimer);


	eq.register_npc_event("king", Event.spawn, 334095, OrbSpawn);
	eq.register_npc_event("king", Event.timer, 334095, AddTimer);
	--eq.register_npc_event("king", Event.waypoint_arrive, 334095, OrbWaypoint)

	eq.register_npc_event("king", Event.spawn, 334110, CrystalSpawn);
	eq.register_npc_event("king", Event.timer, 334110, AddTimer);

	-- spawn portals
	local temp = eq.get_entity_list():GetMobByNpcTypeID(334041); -- incase he's up already for some reason
	if temp.valid then
		king = temp:CastToNPC();
	else
		king = nil;
	end
end

function event_encounter_unload(e)
end
