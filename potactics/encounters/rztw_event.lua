--Rallos Zek the Warlord Event

local controller_id 		= 214123; -- Previously rallos_trigger
local berik_id				= 214056; --
local grunhork_id			= 214057; --
local rz_vallon_id			= 214110; --
local rz_tallon_id			= 214108; --
local fake_vallon_id		= 214129; --
local fake_rz_id			= 214052; --
local elite_id				= 214130; --
local warlord_id			= 214113; --
local pit_add_1				= 214114; --
local pit_add_2				= 214136; --
local pp_id					= 214105; --
local pp_counter			= 0;
local pit_spawns			= {44462,44639,44640,44641,44642,44646,44654,44655,44656,44657,44664,44665,44666,44667,44674,44675,44676,44677,44678,44679,44681,44682,44687,44688,44702,44703,44705,44708,44709,44710,44711,44712,44713,44715,44716,44719,44720,44721,44722,44723,44724,44727,44728,44729,44737,44738,44742,44743,44744,44745,44746,44747,44748,44749,44758,44759,44760,44761,44762,44763,44764,44765,44775,44776,44780,44781,44782,44680};
local elite_spawn_locs		= {[1] = {318,580,160,384}, [2] = {318,-560,160,384}};
local pit_add_spawn_locs	= {[1] = {564,191,-291,0}, [2] = {815,233,-291,0}, [3] = {881,15,-291,0}, [4] = {683,-129,-291,0}, [5] = {859,-154,-291,0}, [6] = {773,-266,-291,0}, [7] = {625,314,-290,0} };
local event_mob_list		= {214110,214108,214129,214113,214130,214114,214136,214052,214056,214057};
local aggro_limit			= 72;	-- max clients on rztw hatelist before banish

local fake1_vz_entity;
local fake2_vz_entity;
local rztw_entity;

-- Encounter Start
function Trigger_Death(e)
	berik		= eq.get_entity_list():IsMobSpawnedByNpcTypeID(berik_id);
	grunhork	= eq.get_entity_list():IsMobSpawnedByNpcTypeID(grunhork_id);

	if not berik and not grunhork then
		Phase1Start();
	end
end

function Controller_Timers(e)
	eq.stop_timer(e.timer);
	if e.timer == "fail" then
		DepopEvent();
	elseif e.timer == "pit_repop" then
		RepopPit();
	end
end

function Controller_Signal(e)
	if e.signal == 1 then -- Phase 1
		eq.set_timer("fail", 20 * 60 * 1000);
	elseif e.signal == 2 then -- Phase 2
		eq.stop_timer("fail");
		eq.set_timer("fail", 15 * 60 * 1000);
	elseif e.signal == 3 then -- Phase 3
		eq.stop_timer("fail");
		eq.set_timer("fail", 20 * 60 * 1000);
	elseif e.signal == 11 then
		DepopPit();
		eq.set_timer("pit_repop", 40 * 60 * 1000);
	elseif e.signal == 50 then -- stop fail timer
		eq.stop_timer("fail");
	end
end

-- Phase 1
function Phase1Start()
	eq.zone_emote(MT.LightGray,"The air of Drunder grows strangely cold as a rumble shakes through the fortress' walls.  The Warlord stirs.");
	eq.unique_spawn(rz_vallon_id,188,0,555,580,170,384);	-- #Vallon Zek on Grid 188
	eq.unique_spawn(rz_tallon_id,187,0,555,-560,170,384);	-- #Tallon Zek on Grid 187
	eq.signal(controller_id, 1);							-- Start phase 1 fail timer
end

function VallonSpawn(e)
	eq.set_next_hp_event(50);
end

function VallonSplit(e)
	if e.hp_event == 50 then
		fake1_vz_entity = eq.spawn2(fake_vallon_id,0,0,e.self:GetX() + math.random(-10,10), e.self:GetY() + math.random(-10,10), e.self:GetZ(), e.self:GetHeading())
		fake2_vz_entity = eq.spawn2(fake_vallon_id,0,0,e.self:GetX() + math.random(-10,10), e.self:GetY() + math.random(-10,10), e.self:GetZ(), e.self:GetHeading())
		eq.set_next_inc_hp_event(98);
	end

	if e.inc_hp_event == 98 then -- If Vallon heals up reset event.
		if fake1_vz_entity.valid then fake1_vz_entity:Depop() end
		if fake2_vz_entity.valid then fake2_vz_entity:Depop() end
		eq.set_next_hp_event(50);
	end
end

function Phase2Check(e)
	local vallon = eq.get_entity_list():IsMobSpawnedByNpcTypeID(rz_vallon_id);
	local tallon = eq.get_entity_list():IsMobSpawnedByNpcTypeID(rz_tallon_id);
	if not vallon and not tallon then
		eq.signal(fake_rz_id,1);
		eq.zone_emote(MT.LightGray,"A tremor rumbles through the halls of Drunder.  Terror wells up inside you as you struggle to keep your footing.");
		eq.signal(controller_id, 2); -- Start phase 2 fail timer
	end
end

-- Phase 2
function Fake_RZ_Activate(e)
	e.self:SetBodyType(19,true);
	e.self:SetSpecialAbility(24, 0);
	e.self:SetSpecialAbility(35, 0);
	eq.set_next_hp_event(75);
end

function Fake_RZ_hp(e)
	if e.hp_event == 75 then
		eq.zone_emote(MT.LightGray,"A great cry echoes across the field of blood and through the halls of Drunder.  The creatures in the arena flee to avoid the impending doom.");
		eq.signal(controller_id,11, 1 * 1000); -- Depop Pit
		SpawnElites();
		eq.set_next_hp_event(65);
		eq.set_next_inc_hp_event(98);
	elseif e.hp_event == 65 then
		SpawnElites();
		eq.set_next_hp_event(55);
	elseif e.hp_event == 55 then
		e.self:Emote("laughs in an ominous tone of death.  'Flee whelps! Flee before the might of the Warlord!'");
		rztw_entity = eq.unique_spawn(warlord_id,0,0,689,0,-292,130);	-- NPC: #Rallos_Zek_the_Warlord
		eq.signal(controller_id, 3); -- Start phase 3 fail timer
		eq.depop_with_timer();
	end

	if e.inc_hp_event == 98 then
		eq.set_next_hp_event(75);
		eq.depop_all(elite_id);	--Decorin_Elite depop on fail/reset
	end
end

function SpawnElites()
	for n = 1,#elite_spawn_locs do
		eq.spawn2(elite_id,0,0,unpack(elite_spawn_locs[n]));
	end
end

function EliteAggro(e)
	local fake_rallos_entity = eq.get_entity_list():GetMobByNpcTypeID(fake_rz_id);
	e.self:SetRunning(true);
	e.self:CastToNPC():MoveTo(261 + math.random(-10,10),-4 + math.random(-10,10),175,510,true);
	e.self:AddToHateList(fake_rallos_entity:GetHateRandom(),1);
end

function RepopPit()
	for _,spawns in pairs(pit_spawns) do
		local spawnpoint = eq.get_entity_list():GetSpawnByID(spawns);
		spawnpoint:Enable();
		spawnpoint:Repop(1);
	end
end

function DepopPit()
	for _,spawns in pairs(pit_spawns) do
		local spawnpoint = eq.get_entity_list():GetSpawnByID(spawns);
		spawnpoint:Disable();
		spawnpoint:ForceDespawn();
	end
end

-- Phase 3
function RZTW_Combat(e)
	if e.joined then
		eq.set_timer("twitch", 55 * 1000);		--start add timer
		eq.set_timer("scan", 1 * 1000);			--start checking hatelist
	else
		eq.stop_timer("adds");
		eq.stop_timer("scan");
		eq.set_timer("reset", 5 * 60 * 1000);	-- 5 Minte Reset in event of wipe
	end
end

function RZTW_Timers(e)
	if e.timer == "twitch" and e.self:IsEngaged() then
		eq.stop_timer(e.timer);
		eq.zone_emote(MT.LightGray, "The corpses across the grounds of the arena begin to twitch and spasm as the will of the Warlord brings them to life.");
		eq.set_timer("adds", 10 * 1000);
	elseif e.timer == "adds" and e.self:IsEngaged() then
		eq.stop_timer(e.timer);
		eq.set_timer("adds", 55 * 1000);
		Spawn_Pit_Adds();
	elseif e.timer == "reset" then
		if not e.self:IsEngaged() and e.self:GetHPRatio() == 100 then
			eq.stop_timer(e.timer);
			eq.depop_all(pit_add_1);
			eq.depop_all(pit_add_2);
		end
	elseif e.timer == "scan" then
		local player_count = 0;
		local hate_list = e.self:GetHateList();

		if hate_list ~= nil then
			for mob in hate_list.entries do
				if mob.ent:IsClient() then 	-- only want clients in this
					player_count = player_count + 1;
					if player_count > aggro_limit then
						mob.ent:Message(MT.Yellow,"You have been banished by Rallos Zek! His voice echoes in your mind, 'Do not attempt your foolish tricks against the warlord!'");
						mob.ent:CastToClient():MovePC(202,-280,-150,-152,384);	--banish to PoK
					end
				end
			end
		end
	end
end

-- Pit Add Handling
function Spawn_Pit_Adds()
	eq.zone_emote(MT.LightGray,"The corpses across the grounds of the arena begin to twitch and spasm as the will of the Warlord brings them to life.");
	for n = 1,7 do
		eq.spawn2(eq.ChooseRandom(pit_add_1,pit_add_2),0,0,pit_add_spawn_locs[n][1] + math.random(-15,15), pit_add_spawn_locs[n][2] + math.random(-15,15), pit_add_spawn_locs[n][3] + 5, pit_add_spawn_locs[n][4]);
	end
end

function Pit_Add_Spawn(e)
	e.self:SetRunning(true);
	e.self:MoveTo(rztw_entity:GetX(),rztw_entity:GetY(),rztw_entity:GetZ() - 25,rztw_entity:GetHeading(),true);
	eq.set_timer("depop", 15 * 60 * 1000);
end

function Pit_Add_Signal(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function Pit_Add_Combat(e)
	if e.joined then
		eq.stop_timer("depop")
	else
		eq.set_timer("depop", 15 * 60 * 1000);	--15 min depop
		e.self:SaveGuardSpot(true);
	end
end

-- Lose
function DepopEvent()
	for _,mob in pairs(event_mob_list) do
		eq.depop_all(mob);
	end
end

-- Win
function EventWin(e)
	eq.stop_all_timers();
	eq.spawn2(pp_id,0,0,689,0,-292,130);	-- NPC: A_Planar_Projection
end

function PP_Spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000) -- 10 min depop
	pp_counter = 0;
end

function PP_Timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function PP_Say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if e.message:findi("hail") and  qglobals.pop_tactics_ralloz == nil and pp_counter < 72 then
		if tonumber(qglobals.pop_poi_behometh_flag) == 1 and tonumber(qglobals.pop_tactics_vallon) == 1 and tonumber(qglobals.pop_tactics_tallon) == 1 then
			e.other:Message(MT.LightGray,"Maelin Starpyre's thoughts enter into your own. 'The singed parchment of Rallos lies in his dead hand. Bring it back to me I will translate them using the Cipher of Druzzil.'");
			e.other:Message(MT.Yellow,"You've received a character flag!");
		else
			e.other:Message(MT.LightGray,"The Planar Projection seems to flicker in and out of existence.  It seems to be impressed by the defeat of Rallos Zek.");
			e.other:Message(MT.LightBlue,"You've received a character flag!");
		end
		eq.set_global("pop_tactics_ralloz", "1", 5, "F");
		pp_counter = pp_counter + 1;
	end
end

function event_encounter_load(e)
	-- Controller
	eq.register_npc_event("rztw_event", Event.timer,			controller_id,	Controller_Timers);
	eq.register_npc_event("rztw_event", Event.signal,			controller_id,	Controller_Signal);

	-- Phase 0 events (Spawn Mobs)
	eq.register_npc_event("rztw_event", Event.death_complete,	berik_id,		Trigger_Death);
	eq.register_npc_event("rztw_event", Event.death_complete,	grunhork_id,	Trigger_Death);

	--Phase 1 events
	eq.register_npc_event("rztw_event", Event.spawn,			rz_vallon_id,	VallonSpawn);
	eq.register_npc_event("rztw_event", Event.hp,				rz_vallon_id,	VallonSplit);
	eq.register_npc_event("rztw_event", Event.death_complete,	rz_vallon_id,	Phase2Check);
	eq.register_npc_event("rztw_event", Event.death_complete,	rz_tallon_id,	Phase2Check);

	--Phase 2 events
	eq.register_npc_event("rztw_event", Event.signal,			fake_rz_id,		Fake_RZ_Activate);
	eq.register_npc_event("rztw_event", Event.hp,				fake_rz_id,		Fake_RZ_hp);
	eq.register_npc_event("rztw_event", Event.spawn,			elite_id,		EliteAggro);

	--Phase 3 events
	eq.register_npc_event("rztw_event", Event.combat,			warlord_id,		RZTW_Combat);
	eq.register_npc_event("rztw_event", Event.timer,			warlord_id,		RZTW_Timers);
	eq.register_npc_event("rztw_event", Event.death_complete,	warlord_id,		EventWin);

	eq.register_npc_event("rztw_event", Event.spawn,			pit_add_1,		Pit_Add_Spawn);
	eq.register_npc_event("rztw_event", Event.signal,			pit_add_1,		Pit_Add_Signal);
	eq.register_npc_event("rztw_event", Event.combat,			pit_add_1,		Pit_Add_Combat);
	eq.register_npc_event("rztw_event", Event.spawn,			pit_add_2,		Pit_Add_Spawn);
	eq.register_npc_event("rztw_event", Event.signal,			pit_add_2,		Pit_Add_Signal);
	eq.register_npc_event("rztw_event", Event.combat,			pit_add_2,		Pit_Add_Combat);

	-- A_Planar_Projection
	eq.register_npc_event("rztw_event", Event.spawn,			pp_id,			PP_Spawn);
	eq.register_npc_event("rztw_event", Event.timer,			pp_id,			PP_Timer);
	eq.register_npc_event("rztw_event", Event.say,				pp_id,			PP_Say);
end
