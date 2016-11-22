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

local event_started = false;
local instance_id;
local lockout_name = 'MPG_adaptation';
local lockout_win = 108;
local this_bit = 16;
local player_list;
local list_constructs = {};
local last_mob;

function setup()
  -- ID, Name, Race, Gender, Texture, sub-npcs, special abilities (only sets parm0 at this time), weakness to weapons, buffs to cast
  local strong = -50;
  local weak = 50;
  local normal = 0;
  local resists_norm = {{'mr','275'},{'fr','275'},{'cr','275'},{'pr','275'},{'dr','275'}};
  local resists_weak = {{'mr','100'},{'fr','100'},{'cr','100'},{'pr','100'},{'dr','100'}};
  local resists_high = {{'mr','600'},{'fr','600'},{'cr','600'},{'pr','600'},{'dr','600'}};
  
  list_constructs = {
    [1] = {'308014', 'Construct of Brutality', 409, 2, 1, {}, {{SpecialAbility.rampage,50},{SpecialAbility.area_rampage,50}}, 
      {{36,weak},{0,normal},{1,normal},{2,normal},{3,normal},{7,30},{51,normal},{28,normal}}, resists_norm },
    [2] = {'308013', 'Construct of Fire', 408, 2, 1, {308003}, {}, 
      {{36,normal},{0,normal},{1,normal},{2,normal},{3,normal},{7,normal},{51,normal},{28,normal}}, resists_weak, {5705} },
    [3] = {'308008', 'Construct of Ice', 417, 2, 1, {308002}, {}, 
      {{36,normal},{0,normal},{1,normal},{2,normal},{3,normal},{7,normal},{51,normal},{28,normal}}, resists_high , {1248}},
    [4] = {'308000', 'Construct of Pain', 413, 2, 1, {}, {{SpecialAbility.flurry,20}}, 
      {{36,normal},{0,normal},{1,normal},{2,normal},{3,normal},{7,normal},{51,normal},{28,normal}}, resists_norm },
    [5] = {'308009', 'Construct of Power', 405, 2, 1, {308001, 308001, 308001, 308001, 308001}, {{SpecialAbility.flurry,50}}, 
      {{36,-85},{0,30},{1,-93},{2,30},{3,-93},{7,-50},{51,-50},{28,-50}}, resists_norm } 
  };

  last_mob = {};
end

function ShapeShift(e)
  -- Cast Balance of the Nameless on self to remove debuffs
  e.self:CastSpell(3230, e.self:GetID());  

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
    if ( last_mob[10] ~= nil ) then
      for _,v in pairs(last_mob[10]) do
        e.self:RemoveAISpell(v);
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

  e.self:SendIllusionPacket({race=mob[3],gender=mob[4],texture=mob[5]});
  e.self:TempName(mob[2]);
  e.self:SetNPCFactionID(79);

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

  -- Spells if present
  if ( mob[10] ~= nil ) then
    for _,v in pairs(mob[10]) do
      e.self:AddAISpell(0, v, 1024, -1, 30, -1);
    end
  end

  last_mob = mob;
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
      eq.spawn_condition('chamberse', instance_id, 2, 1 );
      event_started = true;
      eq.set_timer('shapeshift', 90 * 1000);
      ShapeShift(e);

      e.self:Say("Very well!  Let the battle commence!");
    end
  end
end

function Boss_Timer(e)
  if (e.timer == "shapeshift") then
    ShapeShift(e);
  end
end

function Boss_Death(e)
  eq.stop_all_timers();

  -- Disable the deathtouch
  eq.spawn_condition('chamberse', instance_id, 2, 0 );

  -- Spawn Greedy Dwarf
  eq.spawn2(304028, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());

  -- Update the Lockouts
  local mpg_helper = require("mpg_helper");
  mpg_helper.UpdateRaidTrialLockout(player_list, this_bit, lockout_name);
end

function Deathtouch_Tick(e)
  local my_id = eq.get_zone_instance_id();
  local my_list = eq.get_characters_in_instance(my_id);

  for k,v in pairs(my_list) do
    local client = eq.get_entity_list():GetClientByCharID(v);
    if (client.valid) then 
      if (client:GetX() > -64 or client:GetY() < 122 ) then
        client:Message(13, "A deep voice booms in your head, 'This breach of the rules will not be tolerated. You must face the trials. Return to the arena or be subjected to pain.'");
        if ( warnings >= 10 ) then
          client:Message(13, "A deep voice booms in your head, 'You have been warned.  You did not heed the warnings.  Now you Die!'");
          if (client:Admin() < 80) then 
            client:Kill();
          end
        else 
          warnings = warnings + 1;
        end
      end
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event('mpg_adaptation', Event.say,            308010, Boss_Say);
  eq.register_npc_event('mpg_adaptation', Event.spawn,          308010, Boss_Spawn);
  eq.register_npc_event('mpg_adaptation', Event.timer,          308010, Boss_Timer);
  eq.register_npc_event('mpg_adaptation', Event.death_complete, 308010, Boss_Death);

  eq.register_npc_event('mpg_adaptation', Event.tick,           304021, Deathtouch_Tick);
end

function event_encounter_unload(e)
end
