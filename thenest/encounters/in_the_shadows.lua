-- Vishimtar

-- Variables
local event_started				= false;
local player_disconnect_adds	= false
local egg_position				= 1;
local hp_locked_value			= 25;
local incorporeal_count			= 0;
local lifedrain_min_hit			= 600;
local lifedrain_max_hit			= 1950;
local total_npc_list			= {343093,343165,343166,343167,343096,343160,343162,343159,343163,343095,343161,343094};
local corrupted_drakes			= {343093,343165,343166,343167};
local egg_locations				= {
	[1] = {-4461.28,617.90,133,423.0},
	[2] = {-4513.24,275.87,133,467.3},
	[3] = {-4510.45,554.25,133,320.8}
};

-- General Functions

function setup_event()
	eq.unique_spawn(343093,0,0,-4667,814,132,497.8):SetAppearance(3); -- NPC: corrupted_drake
	eq.unique_spawn(343165,0,0,-4279,576,132,322.5):SetAppearance(3); -- NPC: corrupted_drake
	eq.unique_spawn(343166,0,0,-4362,165,131,335.0):SetAppearance(3); -- NPC: corrupted_drake
	eq.unique_spawn(343167,0,0,-4662, 67,131,335.0):SetAppearance(3); -- NPC: corrupted_drake
end

function reset_event()
	eq.stop_all_timers();
	event_started		= false;
	egg_location		= 1;
	incorporeal_count	= 0;
	lifedrain_min_hit	= 600;
	lifedrain_max_hit	= 1950;
	hp_locked_value		= 25;
	for i = 1, #total_npc_list do
		eq.depop_all(total_npc_list[i]);
	end
	eq.unique_spawn(343094,65,0,-4550.12,583.67,129.62,245);
	setup_event();
end

function Player_Death(e)
	eq.spawn2(343096,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ() + 20,e.self:GetHeading());
end

function Player_Disconnect(e)
	eq.spawn2(343096,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ() + 20,e.self:GetHeading());
end

function make_attackable(mob, attackable)
    mob:SetSpecialAbility(SpecialAbility.immune_melee, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.immune_magic, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.immune_aggro, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.immune_aggro_on, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.no_harm_from_client, attackable and 0 or 1)
	mob:SetAppearance(0);

	local random_client = eq.get_entity_list():GetRandomClient();
	if random_client.valid and not random_client:GetFeigned() then
		mob:AddToHateList(random_client,1);
	end
end

-- Vish Functions

function Vish_Combat(e)
	if e.joined then
		eq.set_next_hp_event(99); -- Start event at 98 (falling edge of 99)
		event_started = true;
		e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage,8,75);
		eq.stop_timer("reset");
	else
		eq.set_timer("reset", 2 * 60 * 1000);
	end
end

function Vish_Timer(e)
	eq.stop_timer(e.timer);

	if e.timer == "reset" then
		reset_event();
	elseif e.timer == "withering_corruption" then
		if not e.self:GetHateTop():CastToClient():FindBuff(6641) then
			e.self:CastedSpellFinished(6641, e.self:GetHateTop());
		end
		eq.set_timer("withering_corruption", 45 * 1000);
	elseif e.timer == "eggs" then
		eq.zone_emote(MT.Yellow,"Vishimtar shouts, 'Your presence has caused the children to awaken. They will be... hungry.'");
		eq.set_timer("hatch",60 * 1000);
		eq.set_timer("eggs",math.random(75,120) * 1000);
		egg_position = math.random(3);
		eq.spawn2(343095,0,0,unpack(egg_locations[egg_position]));
	elseif e.timer == "hatch" then
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(343095) then
			eq.depop_all(343095);

			for i = 1, 6 do
				eq.spawn2(343161,0,0,unpack(egg_locations[egg_position])):AddToHateList(e.self:GetHateRandom(),1);
			end
		end
	elseif e.timer == "incorporeal" then
		eq.set_timer("incorporeal",60 * 1000);
		if incorporeal_count < 4 then
			eq.spawn2(343159,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			incorporeal_count = incorporeal_count + 1;
		end
	elseif e.timer == "doom" then
		local cl	= eq.get_entity_list():GetShuffledClientList();
		local count	= 0;
		for client in cl.entries do
			if client.valid then
				e.self:CastedSpellFinished(6646, client); -- Spell: Creeping Doom
				count = count + 1;
			end

			if count == 4 then
				break;
			end
		end
		eq.set_timer("doom",45 * 1000);
	elseif e.timer == "mournful_repop" then
		eq.depop_all(343163);									-- Despawn all current Mournful
		eq.spawn2(343163,67,0,-4588.09,799.42,133.03,245.0);	-- Respawn them on grids.
		eq.spawn2(343163,68,0,-4446.01,720.14,133.24,236.0);	-- NPC: #mournful_spirit
		eq.spawn2(343163,69,0,-4578.29,161.82,133.23,35.3);		-- NPC: #mournful_spirit
		eq.spawn2(343163,70,0,-4457.00,139.62,133.22,461.8);	-- NPC: #mournful_spirit

		eq.set_timer("mournful_repop",30 * 1000);
	elseif e.timer == "hp_lock" then
		if e.self:GetHPRatio() < hp_locked_value then
			local new_hp = e.self:GetMaxHP() * hp_locked_value / 100;
			e.self:SetHP(new_hp);
		end

		eq.set_timer("hp_lock",1000); -- Lock my HP.
	end
end

function Vish_HP(e)
	if e.hp_event == 99 then
		eq.set_timer("eggs", math.random(180,360) * 1000);		-- 3-6 Minutes
		eq.set_timer("withering_corruption", 45 * 1000);
		eq.set_next_hp_event(76);
	elseif e.hp_event == 76 then
		eq.spawn2(343162,66,0,-4573.35,137.25,132.04,36.3); 	-- NPC: Cloud of Concentrated Chaos
		eq.set_timer("incorporeal",1 * 1000);
		eq.set_next_hp_event(51);
	elseif e.hp_event == 51 then
		eq.spawn2(343162,66,0,-4573.35,137.25,132.04,36.3); 	-- NPC: Cloud of Concentrated Chaos
		eq.signal(343093,1);									-- NPC: corrupted_drake
		eq.signal(343165,1);									-- NPC: corrupted_drake
		eq.signal(343166,1);									-- NPC: corrupted_drake
		eq.signal(343167,1);									-- NPC: corrupted_drake
		eq.set_next_hp_event(26);
	elseif e.hp_event == 26 then
		eq.set_timer("doom",1 * 1000);							-- Creeping doom aoe timer
		eq.spawn2(343162,66,0,-4573.35,137.25,132.04,36.3);		-- Spawn Cloud of Concentrated Chaos
		eq.spawn2(343163,67,0,-4588.09,799.42,133.03,245.0);	-- NPC: #mournful_spirit
		eq.spawn2(343163,68,0,-4446.01,720.14,133.24,236.0);	-- NPC: #mournful_spirit
		eq.spawn2(343163,69,0,-4578.29,161.82,133.23,35.3);		-- NPC: #mournful_spirit
		eq.spawn2(343163,70,0,-4457.00,139.62,133.22,461.8);	-- NPC: #mournful_spirit

		eq.set_timer("mournful_repop",30 * 1000);				-- Respawn spirits in 30 seconds.
		eq.set_timer("hp_lock",1000);							-- Lock my HP.
	end
end

function Vish_Death(e)
	eq.spawn2(343164,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Spawn a chest at my location upon my death.
	eq.stop_all_timers();

	for i = 1, #total_npc_list do
		eq.depop_all(total_npc_list[i]);
	end
end

-- Corrupted Drake Functions
function Corrupted_Spawn(e)
	if event_started then
		make_attackable(e.self, true);
	end
end

function Corrupted_Signal(e)
	make_attackable(e.self, true);
end

function Corrupted_Death(e)
	local corrupted_id = e.self:GetNPCTypeID();
	if corrupted_id == 343093 then
		eq.spawn2(343093,0,0,-4667,814,132,497.8);
	elseif corrupted_id == 343165 then
		eq.spawn2(343165,0,0,-4279,576,132,322.5);
	elseif corrupted_id == 343166 then
		eq.spawn2(343166,0,0,-4362,165,131,335.0);
	elseif corrupted_id == 343167 then
		eq.spawn2(343167,0,0,-4662, 67,131,335.0);
	end
end

-- Egg Functions
function Egg_Spawn(e) -- Modify the damage I take.
	e.self:ModSkillDmgTaken(0, 300);	-- 1h blunt
	e.self:ModSkillDmgTaken(1, -99);	-- 1h slashing
	e.self:ModSkillDmgTaken(2, 300);	-- 2h blunt
	e.self:ModSkillDmgTaken(3, -99);	-- 2h slashing
	e.self:ModSkillDmgTaken(7, -99);	-- archery
	e.self:ModSkillDmgTaken(8, -99);	-- backstab
	e.self:ModSkillDmgTaken(10, -99);	-- bash
	e.self:ModSkillDmgTaken(21, -99);	-- dragon punch
	e.self:ModSkillDmgTaken(23, -99);	-- eagle strike
	e.self:ModSkillDmgTaken(26, -99);	-- flying kick
	e.self:ModSkillDmgTaken(28, -99);	-- hand to hand
	e.self:ModSkillDmgTaken(30, -99);	-- kick
	e.self:ModSkillDmgTaken(36, -99);	-- piercing
	e.self:ModSkillDmgTaken(38, -99);	-- round kick
	e.self:ModSkillDmgTaken(52, -99);	-- tiger claw
	e.self:ModSkillDmgTaken(74, -99);	-- frenzy
end

-- Shadow Functions

function Incorporeal_Death(e)
	if incorporeal_count > 0 then
		incorporeal_count = incorporeal_count - 1;
	else
		incorporeal_count = 0;
	end

	lifedrain_min_hit = lifedrain_min_hit + 50;												-- add 50 to min hit of lifedrain shadow
	lifedrain_max_hit = lifedrain_max_hit + 50;												-- add 50 to max hit of lifedrain shadow
	eq.spawn2(343160,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	-- Spawn a lifedrain shadow.
end

function Lifedrain_Spawn(e)
	e.self:ModifyNPCStat("min_hit", tostring(lifedrain_min_hit)); -- Set my min_hit.
	e.self:ModifyNPCStat("max_hit", tostring(lifedrain_max_hit)); -- Set my max hit.
end

-- Cloud Functions

function Cloud_Death(e)
	e.self:SpellFinished(6495, e.other); -- Cast Spiritual Wake
end

-- Mournful Functions

function Mourning_Say(e)
	if e.message:findi("shoulder my burden") then
		if e.other:FindBuff(6646) then
			e.other:BuffFadeBySpellID(6646);
			e.other:Message(MT.Yellow,"The mournful spirit draws corruption from your body and absorbs it, destroying itself in the process.");
			if hp_locked_value > 0 then
				hp_locked_value = hp_locked_value - 1;
			end

			if hp_locked_value <= 0 then
				hp_locked_value = 0;
				eq.stop_timer("doom");
				eq.stop_timer("hp_lock");
				eq.stop_timer("mournful_spirit");
			end

			eq.depop();
		else
			eq.depop();
		end
	end
end

function event_encounter_load(e)
	if player_disconnect_adds then
		eq.register_player_event(Event.disconnect, Player_Disconnect);
	end

	eq.register_npc_event(Event.combat,			343094, Vish_Combat);
	eq.register_npc_event(Event.timer,			343094,	Vish_Timer);
	eq.register_npc_event(Event.hp,				343094,	Vish_HP);
	eq.register_npc_event(Event.death_complete,	343094,	Vish_Death);

	for npc_id = 1, #corrupted_drakes do
		eq.register_npc_event(Event.spawn,			corrupted_drakes[npc_id], Corrupted_Spawn);
		eq.register_npc_event(Event.signal,			corrupted_drakes[npc_id], Corrupted_Signal);
		eq.register_npc_event(Event.death_complete,	corrupted_drakes[npc_id], Corrupted_Death);
	end

	eq.register_npc_event(Event.spawn,			343095, Egg_Spawn);
	eq.register_npc_event(Event.death_complete,	343159, Incorporeal_Death);
	eq.register_npc_event(Event.spawn,			343160, Lifedrain_Spawn);
	eq.register_npc_event(Event.death,			343162, Cloud_Death);
	eq.register_npc_event(Event.say,			343163,	Mourning_Say);

	-- Player Deaths
	eq.register_player_event(Event.death, Player_Death);

	setup_event();
end
