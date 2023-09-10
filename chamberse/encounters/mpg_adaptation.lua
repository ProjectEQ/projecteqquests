-- The Mastery of Adaptation (Raid) 
-- 
-- Group Trial Version 1 of zone
-- Raid  Trial Version 2 of zone
--
-- MPG Group Trial Bits:
-- 1  MPG_fear
-- 2  MPG_ingenuity
-- 4  MPG_weaponry
-- 8  MPG_subversion
-- 16 MPG_efficiency
-- 32 MPG_destruciton
--
-- Lockout on Win: 72 hours
-- Lockout on Loss: 2 hours
--
-- MPG Raid Trial General Notes
-- 1  MPG_hate           - The Mastery of Hate (Raid)
-- 2  MPG_endurance      - The Mastery of Endurance (Raid)
-- 4  MPG_foresight      - The Mastery of Foresight (Raid)
-- 8  MPG_specialization - The Mastery of Specialization (Raid)
-- 16 MPG_adaptation     - The Mastery of Adaptation (Raid)
-- 32 MPG_corruption     - The Mastery of Corruption (Raid)  
--
-- Lockout on Win: 5 days
-- Lockout on Loss: 3 hours
--
-- Flag Global
-- mpg_group_trials
-- mpg_raid_trials
--
-- Mobs
-- 308010 Master_of_Adaptation
-- 308014 Construct_of_Brutality
-- 308013 Construct_of_Fire
-- 308008 Construct_of_Ice
-- 308000 Construct_of_Pain
-- 308009 Construct_of_Power
--
-- piercing (36)
-- 1h blunt (0)
-- 1h slashing (1)
-- 2h blunt (2)
-- 2h slashing (3)
-- archery (7)
-- throwing (51)
-- hand to hand (28)
-- 2hp (77)
--
-- RESIST_NONE = 0,
-- RESIST_MAGIC = 1,
-- RESIST_FIRE = 2,
-- RESIST_COLD = 3,
-- RESIST_POISON = 4,
-- RESIST_DISEASE = 5,
-- RESIST_CHROMATIC = 6,
-- RESIST_PRISMATIC = 7,
-- RESIST_PHYSICAL = 8,  // see Muscle Shock, Back Swing
-- RESIST_CORRUPTION = 9

local event_started		= false;
local instance_id;
local lockout_win   	= "5d";
local lockout_loss  	= "3h";
local this_zone			= 'chamberse';
local this_bit			= 16;
local player_list;
local list_constructs	= {};
local last_mob;
local spells_on_change	= {};
local self;
local cast_buffs		= {};
local cast_spells		= {};

function setup()
	-- ID, Name, Race, Gender, Texture, sub-npcs, special abilities (only sets parm0 at this time), weakness to weapons, buffs to cast
	local strong		= -50;
	local weak			= 50;
	local normal		= 0;
	local resists_brut	= {{'mr','350'},{'fr','275'},{'cr','275'},{'pr','125'},{'dr','125'}};
	local resists_fire	= {{'mr','35'},{'fr','350'},{'cr','60'},{'pr','250'},{'dr','250'}};
	local resists_ice	= {{'mr','35'},{'fr','60'},{'cr','350'},{'pr','250'},{'dr','250'}};
	local resists_pain	= {{'mr','35'},{'fr','275'},{'cr','275'},{'pr','250'},{'dr','250'}};
	local resists_power	= {{'mr','175'},{'fr','275'},{'cr','275'},{'pr','250'},{'dr','250'}};
	
	list_constructs = {
		[1] = {
			'308014',					-- (1) Mob ID
			'Construct of Brutality',	-- (2) Name
			409,						-- (3) Race
			2,							-- (4) Gender
			1,							-- (5) Texture
			{},							-- (6) Sub-npcs
			{							-- (7) Special Abilities
				{SpecialAbility.rampage,50},
				{SpecialAbility.area_rampage,50}
			},
			{							-- (8) Weakness
				{36,-3},
				{0,normal},
				{1,30},
				{2,normal},
				{3,30},
				{7,normal},
				{51,normal},
				{28,normal},
				{77,-3}
			},
			resists_brut,				-- (9) Resists
			7500						-- (10) Regen
		},
		[2] = {
			'308013',					-- (1) Mob ID
			'Construct of Fire',		-- (2) Name
			408, 						-- (3) Race
			2, 							-- (4) Gender
			1, 							-- (5) Texture
			{308003},					-- (6) Sub-npcs
			{}, 						-- (7) Special Abilities
			{							-- (8) Weakness
				{36,normal},
				{0,normal},
				{1,normal},
				{2,normal},
				{3,normal},
				{7,normal},
				{51,normal},
				{28,normal},
				{77,normal}
			}, 
			resists_fire,				-- (9) Resists
			3000,						-- (10) Regen
			{5706},						-- (11) Spells to add to AI
			{5705}						-- (12) Spells to cast once [Self Buffs]
		},
		[3] = {
			'308008',					-- (1) Mob ID
			'Construct of Ice',			-- (2) Name
			417,						-- (3) Race
			2,							-- (4) Gender
			1,							-- (5) Texture
			{308002},					-- (6) Sub-npcs
			{},							-- (7) Special Abilities
			{							-- (8) Weakness
				{36,normal},
				{0,normal},
				{1,normal},
				{2,normal},
				{3,normal},
				{7,normal},
				{51,normal},
				{28,normal},
				{77,normal}
			}, 
			resists_ice,				-- (9) Resists
			3000,						-- (10) Regen
			{5707},						-- (11) Spells to add to AI
			{5704}						-- (12) Spells to cast once [Self Buffs]
		},
		[4] = {
			'308000',					-- (1) Mob ID
			'Construct of Pain',		-- (2) Name
			413,						-- (3) Race
			2,							-- (4) Gender
			1,							-- (5) Texture
			{},							-- (6) Sub-npcs
			{							-- (7) Special Abilities
				{SpecialAbility.flurry,20}
			}, 
			{							-- (8) Weakness
				{36,26},
				{0,-85},
				{1,-85},
				{2,-85},
				{3,-85},
				{7,normal},
				{51,normal},
				{28,normal},
				{77,26}
			}, 
			resists_pain,				-- (9) Resists
			7500,						-- (10) Regen
			{5692},						-- (11) Spells to add to AI
			{5699}						-- (12) Spells to cast once [Self Buffs]
		},
		[5] = {
			'308009',					-- (1) Mob ID
			'Construct of Power',		-- (2) Name
			405,						-- (3) Race
			2,							-- (4) Gender
			1,							-- (5) Texture
			{							-- (6) Sub-npcs
				308001, 
				308001, 
				308001, 
				308001, 
				308001
			}, 
			{							-- (7) Special Abilities
				{SpecialAbility.flurry,50}
			}, 
			{							-- (8) Weakness
				{36,-85},
				{0,30},
				{1,-85},
				{2,30},
				{3,-85},
				{7,normal},
				{51,normal},
				{28,normal},
				{77,-85}
			}, 
			resists_power,				-- (9) Resists
			3000						-- (10) Regen
		} 
	};

	last_mob = {};
end

function ShapeShift(e)
	-- Clean Up Last Mob
	if last_mob ~= nil then
		-- Depop Sub-NPCs
		if last_mob[6] ~= nil then
			for _,v in pairs(last_mob[6]) do
				eq.depop_all(tonumber(v));
			end
		end
		-- Unset Special Abilities
		if last_mob[7] ~= nil then
			for _,v in pairs(last_mob[7]) do
				if v[1] ~= nil then
					e.self:SetSpecialAbility(v[1], 0);
				end
			end
		end
	end

	local num = math.random(1,#list_constructs);
	local mob = list_constructs[num];

	-- Lets prevent the mob from shapeshifting to its same form; recursively
	if mob[1] == last_mob[1] then
		ShapeShift(e);
		return;
	end

	e.self:SendIllusionPacket({race=mob[3],gender=mob[4],texture=mob[5]});
	e.self:TempName(mob[2]);
	e.self:SetNPCFactionID(79); -- Faction: Gargoyle

	-- Cast Balance of the Nameless on self to remove debuffs
	e.self:CastSpell(3230, e.self:GetID()); -- Spell: Balance of the Nameless
	e.self:BuffFadeAll();

	-- Spawn Sub-NPCs 
	if mob[6] ~= nil then 
		local x = -2;
		for _,v in pairs(mob[6]) do
			eq.spawn2( v, 0, 0, e.self:GetX() + (x*5), e.self:GetY() + (x*5) + 10, e.self:GetZ(), e.self:GetHeading() );
			x = x + 1;
		end
	end

	-- Set Special Abilities
	if mob[7] ~= nil then
		for _,v in pairs(mob[7]) do
			if v[1] ~= nil then
				e.self:SetSpecialAbility(v[1], 1);
				if v[2] ~= nil then
					e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, v[2]);
					e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 2, 25);
					e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 0, v[2]);
					e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 2, 25);
				end
			end
		end
	end

	-- Set the Shapes weakness to weaponry
	if mob[8] ~= nil then
		for _,v in pairs(mob[8]) do
			if v ~= nil and v[1] ~= nil and v[2] ~= nil then
				e.self:ModSkillDmgTaken(v[1], v[2]);
			end
		end
	end

	-- Set the Shapes resists
	if mob[9] ~= nil then
		for _,v in pairs(mob[9]) do
			if v ~= nil and v[1] ~= nil and v[2] ~= nil then
				e.self:ModifyNPCStat(v[1], tostring(v[2]));
			end
		end
	end

	-- Set Regen
	e.self:ModifyNPCStat("combat_hp_regen", tostring(mob[10]));

	self = e.self;

	-- Wipe Spell AI
	cast_spells		= {};
	cast_buffs		= {};

	-- Spells if present to add to the AI
	if mob[11] ~= nil then
		cast_spells = mob[11];
		CastSpells();
	end

	-- Spells to cast once (self buffs)
	if mob[12] ~= nil then
		cast_buffs = mob[12];
		CastBuffs();
	end
	last_mob = mob;
end

function CastBuffs()
	if cast_buffs ~= nil then
		for _,v in pairs(cast_buffs) do
			self:CastedSpellFinished(v, self);
		end
		cast_buffs = {};
	end
end

function CastSpells()
	if cast_spells ~= nil then
		for _,v in pairs(cast_spells) do
			self:CastedSpellFinished(v, self:GetTarget());
		end
	end
end

function Boss_Spawn(e)
	event_started	= false;
	instance_id		= eq.get_zone_instance_id();
	player_list		= eq.get_characters_in_instance(instance_id);
	setup();
end

function Lick_Spawn(e)
	e.self:CastSpell(5705, e.self:GetID())
end

function Mote_Spawn(e)
	e.self:CastSpell(5704, e.self:GetID())
end

function Boss_Say(e)
	if e.message:findi("hail") and not event_started then
		e.self:Say("This is the Mastery of Adaptation trial. You must demonstrate your ability to adapt to an unpredictable and ever-changing opponent. Are you ready to [begin]?");
	elseif e.message:findi("begin") and not event_started then
		local dz = eq.get_expedition()
		if dz.valid then
			dz:SetLocked(true, ExpeditionLockMessage.Begin,14) -- live uses "Event Messages" type 365 (not in emu clients)
			dz:AddReplayLockout(eq.seconds(lockout_loss));
		end

		e.self:SetSpecialAbility(SpecialAbility.immune_melee,0)
		e.self:SetSpecialAbility(SpecialAbility.immune_magic,0)
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro,0)
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client,0)
		eq.spawn2(308012,0,0,0,0,0,0); -- NPC: #death_touch
		event_started = true;
		eq.set_timer('shapeshift', math.random(90, 120) * 1000);
		eq.set_timer('castspells', 35 * 1000);
		ShapeShift(e);
		e.self:Say("Very well!  Let the battle commence!");
	end
end

function Boss_Timer(e)
	if e.timer == "shapeshift" then
		e.self:Emote("shifts, their form twisting into a new monstrosity.");
		eq.stop_timer('shapeshift');
		ShapeShift(e);
		if e.self:GetHPRatio() >= 80 then
			eq.set_timer('shapeshift', math.random(90, 120) * 1000);
		elseif e.self:GetHPRatio() >= 50 and e.self:GetHPRatio() < 80 then
			eq.set_timer('shapeshift', math.random(60, 90) * 1000);
		elseif e.self:GetHPRatio() >= 30 and e.self:GetHPRatio() < 50 then
			eq.set_timer('shapeshift', math.random(30, 60) * 1000);
		elseif e.self:GetHPRatio() < 30 then
			eq.set_timer('shapeshift', math.random(15, 30) * 1000);
		end
	elseif e.timer == "castspells" then
		CastSpells();
	end
end

function Boss_Death(e)
	eq.stop_all_timers();

	-- Disable the deathtouch
	eq.depop_all(308012);

	-- Spawn Shell of the Master
	eq.spawn2(308015, 0, 0, -212, 270, 66, e.self:GetHeading()); -- NPC: Shell_of_the_Master_

	-- Update the Lockouts
	local dz = eq.get_expedition()
	if dz.valid then
		dz:AddReplayLockoutDuration(eq.seconds(lockout_win)) -- 5 days + current timer (max 123 hours)
	end

	local mpg_helper = require("mpg_helper");
	mpg_helper.UpdateRaidTrialFlag(player_list, this_bit);
end

function event_encounter_load(e)
	eq.register_npc_event('mpg_adaptation', Event.say,            308010, Boss_Say);
	eq.register_npc_event('mpg_adaptation', Event.spawn,          308010, Boss_Spawn);
	eq.register_npc_event('mpg_adaptation', Event.spawn,          308003, Lick_Spawn);
	eq.register_npc_event('mpg_adaptation', Event.spawn,          308002, Mote_Spawn);
	eq.register_npc_event('mpg_adaptation', Event.timer,          308010, Boss_Timer);
	eq.register_npc_event('mpg_adaptation', Event.death_complete, 308010, Boss_Death);
end

function event_encounter_unload(e)
end
