-- The Mastery of Adaptation (Raid) 
-- 
-- MPG Raid Trial General Notes
-- 1  MPG_hate           - The Mastery of Hate (Raid)
-- 2  MPG_endurance      - The Mastery of Endurance (Raid)
-- 4  MPG_foresight      - The Mastery of Foresight (Raid)
-- 8  MPG_specialization - The Mastery of Specialization (Raid)
-- 16 MPG_adaptation     - The Mastery of Adaptation (Raid)
-- 32 MPG_corruption     - The Mastery of Corruption (Raid)  
--
-- Event:
-- The Mastery of Adaptation (Raid) 
-- Master of Adaptation spawns in center of the middle platform, despawns when saying "we are ready to begin"
--
-- Construct of Power
-- -5 diminutive constructs
--
-- Construct of Ice
-- -1 mote of frost
--
-- Construct of Fire
-- -1 lick of flame
--
-- Construct of Brutality
--
-- Construct of Pain 
--
-- Shape shifted every 90-110 seconds. Seems to choose a new form at random. Strips buffs when changing forms <Balance of the Nameless>
--
-- Total HP: 3,900,000 
--
-- 890-4215 min / max quad (throughout all forms) @ 35 shielding sk
--
-- 3 loots, 2 runes, anguish seal popped onto cursor upon completion
--
-- Zone out is skull statue in port up room
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
local ThreadManager = require("thread_manager");

local event_started = false;
local instance_id;
local lockout_name = 'MPG_adaptation';
local lockout_win = 108;
local this_bit = 16;
local player_list;
local list_constructs = {};
local last_mob;
local spells_on_change = {};
local self;
local cast_buffs = {};
local cast_spells = {};

function setup()
  -- ID, Name, Race, Gender, Texture, sub-npcs, special abilities (only sets parm0 at this time), weakness to weapons, buffs to cast
  local strong = -50;
  local weak = 50;
  local normal = 0;
  local resists_brut = {{'mr','600'},{'fr','600'},{'cr','600'},{'pr','600'},{'dr','600'}};
  local resists_fire = {{'mr','600'},{'fr','600'},{'cr','600'},{'pr','600'},{'dr','600'}};
  local resists_ice  = {{'mr','600'},{'fr','600'},{'cr','600'},{'pr','600'},{'dr','600'}};
  local resists_pain = {{'mr','600'},{'fr','600'},{'cr','600'},{'pr','600'},{'dr','600'}};
  local resists_power= {{'mr','600'},{'fr','600'},{'cr','600'},{'pr','600'},{'dr','600'}};
  
  list_constructs = {
    [1] = { '308014',
            'Construct of Brutality', 
            409,  -- Race
            2,    -- Gender
            1,    -- Texture
            {},   -- Sub-npcs
            {{SpecialAbility.rampage,50},{SpecialAbility.area_rampage,50}}, 
            {{36,weak},{0,normal},{1,normal},{2,normal},{3,normal},{7,30},{51,normal},{28,normal}}, 
            resists_brut },
    [2] = { '308013', 
            'Construct of Fire', 
            408, 
            2, 
            1, 
            {308003}, 
            {}, 
            {{36,normal},{0,normal},{1,normal},{2,normal},{3,normal},{7,normal},{51,normal},{28,normal}}, 
            resists_fire, 
            {5706},
            {5705}},
    [3] = { '308008', 
            'Construct of Ice', 
            417, 
            2, 
            1, 
            {308002}, 
            {}, 
            {{36,normal},{0,normal},{1,normal},{2,normal},{3,normal},{7,normal},{51,normal},{28,normal}}, 
            resists_ice, 
            {1248},
            {5704}},
    [4] = { '308000', 
            'Construct of Pain', 
            413, 
            2, 
            1, 
            {}, 
            {{SpecialAbility.flurry,20}}, 
            {{36,normal},{0,normal},{1,normal},{2,normal},{3,normal},{7,normal},{51,normal},{28,normal}}, 
            resists_pain,
            {5692},
            {5699}},
    [5] = { '308009', 
            'Construct of Power', 
            405, 
            2, 
            1, 
            {308001, 308001, 308001, 308001, 308001}, 
            {{SpecialAbility.flurry,50}}, 
            {{36,-85},{0,30},{1,-93},{2,30},{3,-93},{7,-50},{51,-50},{28,-50}}, 
            resists_power } 
  };

  last_mob = {};
end

function ShapeShift(e)
  -- Clean Up Last Mob
  if ( last_mob ~= nil ) then
    -- Depop Sub-NPCs
    if ( last_mob[6] ~= nil ) then
      for _,v in pairs(last_mob[6]) do
        eq.depop_all(tonumber(v));
      end
    end
    -- Unset Special Abilities
    if ( last_mob[7] ~= nil ) then
      for _,v in pairs(last_mob[7]) do
        if ( v[1] ~= nil ) then
          e.self:SetSpecialAbility(v[1], 0);
        end
      end
    end
  end

  local num = math.random(1,table.getn(list_constructs));
  local mob = list_constructs[num];

  -- Lets prevent the mob from shapeshifting to its same form; recursively
  if (mob[1] == last_mob[1]) then
    ShapeShift(e);
    return;
  end

  --mob = list_constructs[4];

  e.self:SendIllusionPacket({race=mob[3],gender=mob[4],texture=mob[5]});
  e.self:TempName(mob[2]);
  e.self:SetNPCFactionID(79);

  -- Cast Balance of the Nameless on self to remove debuffs
  e.self:CastSpell(3230, e.self:GetID());  

  -- Spawn Sub-NPCs 
  if ( mob[6] ~= nil ) then 
    local x = -2;
    for _,v in pairs(mob[6]) do
      eq.spawn2( v, 0, 0, e.self:GetX() + (x*5), e.self:GetY() + (x*5) + 10, e.self:GetZ(), e.self:GetHeading() );
      x = x + 1;
    end
  end

  -- Set Special Abilities
  if ( mob[7] ~= nil ) then
    for _,v in pairs(mob[7]) do
      if ( v[1] ~= nil ) then
        e.self:SetSpecialAbility(v[1], 1);
        if ( v[2] ~= nil ) then
          e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 0, v[2]);
        end
      end
    end
  end

  -- Set the Shapes weakness to weaponry
  if ( mob[8] ~= nil ) then
    for _,v in pairs(mob[8]) do
      if (v ~= nil and v[1] ~= nil and v[2] ~= nil) then
        e.self:ModSkillDmgTaken(v[1], v[2]); 
      end
    end
  end

  -- Set the Shapes resists
  if ( mob[9] ~= nil ) then
    for _,v in pairs(mob[9]) do
      if (v ~= nil and v[1] ~= nil and v[2] ~= nil) then
        e.self:ModifyNPCStat(v[1], tostring(v[2]));
      end
    end
  end

  self = e.self;
  ThreadManager:Clear();

  -- Spells if present to add to the AI
  if ( mob[10] ~= nil ) then
    eq.set_timer('castspells', 1000);
    cast_spells = mob[10];
    ThreadManager:Create("CastSpells", CastSpells);
  end

  -- Spells to cast once (self buffs)
  if ( mob[11] ~= nil ) then
    eq.set_timer('castbuffs', 500);
    cast_buffs = mob[11];
    ThreadManager:Create("CastBuffs", CastBuffs);
  end
  last_mob = mob;
end

function CastBuffs()
  if (cast_buffs ~= nil) then
    for _,v in pairs(cast_buffs) do
      self:CastSpell(v, self:GetID());  
      ThreadManager:Wait(1.0);
    end
    cast_buffs = {};
  end
end

function CastSpells()
  if (cast_spells ~= null) then
   for _,v in pairs(cast_spells) do
     self:CastSpell(v, self:GetTarget():GetID());
     ThreadManager:Wait(2.5);
   end
  end
end

function Boss_Spawn(e)
  event_started = false;
  instance_id = eq.get_zone_instance_id();
  player_list = eq.get_characters_in_instance(instance_id);
  lockout_name = 'MPG_adaptation';
  lockout_win = 108;
  this_bit = 16;
  setup();
end

function Boss_Say(e)
  if ( event_started ~= true ) then
    if ( e.message:findi("hail") ) then
      e.self:Say("This is the Mastery of Adaptation trial. You must demonstrate your ability to adapt to an unpredictable and ever-changing opponent. Are you ready to [ " .. eq.say_link('begin', false, 'begin') .. " ]?");
    elseif ( e.message:findi("begin") ) then
      --eq.spawn_condition('chamberse', instance_id, 2, 1 );
      eq.spawn2(308012,0,0,0,0,0,0);
      event_started = true;
      eq.set_timer('shapeshift', 90 * 1000);
      eq.set_next_hp_event(90);
      ShapeShift(e);

      e.self:Say("Very well!  Let the battle commence!");
    end
  end
end

function Boss_Timer(e)
  if (e.timer == "shapeshift") then
    ShapeShift(e);
  elseif (e.timer == "leftcombat") then
    ResetEvent(e);
  elseif (e.timer == "castbuffs") then
    ThreadManager:Resume("CastBuffs");
  elseif (e.timer == "castspells") then
    ThreadManager:Resume("CastSpells");
  end
end

function Boss_Death(e)
  ThreadManager:Clear();
  eq.stop_all_timers();

  -- Disable the deathtouch
  --eq.spawn_condition('chamberse', instance_id, 2, 0 );
  eq.depop_all(308012);

  -- Spawn Greedy Dwarf
  eq.spawn2(304028, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());

  -- Update the Lockouts
  local mpg_helper = require("mpg_helper");
  mpg_helper.UpdateRaidTrialLockout(player_list, this_bit, lockout_name);
end

function Boss_Hp(e)
  local new_time;
  if (e.hp_event == 90) then
    -- 85 to 135 seconds
    new_time = math.random(85, 135);
    eq.set_next_hp_event(80);
  elseif (e.hp_event == 80) then
    -- 80 to 120
    new_time = math.random(80, 120);
    eq.set_next_hp_event(70);
  elseif (e.hp_event == 70) then
    -- 75 to 105
    new_time = math.random(75, 105);
    eq.set_next_hp_event(60);
  elseif (e.hp_event == 60) then
    -- 70 to 90
    new_time = math.random(70, 90);
    eq.set_next_hp_event(50);
  elseif (e.hp_event == 50) then
    -- 65 to 75
    new_time = math.random(65, 75);
    eq.set_next_hp_event(40);
  elseif (e.hp_event == 40) then
    -- 55 to 65
    new_time = math.random(55, 65);
    eq.set_next_hp_event(30);
  elseif (e.hp_event == 30) then
    -- 45 to 55
    new_time = math.random(45, 55);
    eq.set_next_hp_event(20);
  elseif (e.hp_event == 20) then
    -- 35 to 45
    new_time = math.random(35, 45);
    eq.set_next_hp_event(10);
  elseif (e.hp_event == 10) then
    -- 25 to 35
    new_time = math.random(25, 35);
  end
  eq.stop_timer('shapeshift');
  eq.set_timer('shapeshift', new_time * 1000);
end

function Boss_Combat(e)
  if (e.joined == false) then
    eq.set_timer('leftcombat', 30 * 1000);
  else
    eq.stop_timer('leftcombat');
  end
end

function ResetEvent(e)
  ThreadManager:Clear();
  eq.stop_all_timers();
  eq.repop_zone();
end

function event_encounter_load(e)
  eq.register_npc_event('mpg_adaptation', Event.say,            308010, Boss_Say);
  eq.register_npc_event('mpg_adaptation', Event.hp,             308010, Boss_Hp);
  eq.register_npc_event('mpg_adaptation', Event.combat,         308010, Boss_Combat);
  eq.register_npc_event('mpg_adaptation', Event.spawn,          308010, Boss_Spawn);
  eq.register_npc_event('mpg_adaptation', Event.timer,          308010, Boss_Timer);
  eq.register_npc_event('mpg_adaptation', Event.death_complete, 308010, Boss_Death);
end

function event_encounter_unload(e)
end
