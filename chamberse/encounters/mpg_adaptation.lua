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

local event_started = false;
local instance_id;
local lockout_name = 'MPG_adaptation';
local lockout_win = 108;
local this_bit = 16;
local player_list;
local list_constructs = {};
local last_mob;

function setup()
  -- ID
  -- Name
  -- Race
  -- Gender
  -- Texture
  -- sub-npcs
  -- special abilities
  list_constructs = {
    [1] = {'308014', 'Construct of Brutality', 409, 2, 1, {}, {} },
    [2] = {'308013', 'Construct of Fire', 408, 2, 1, {308003}, {} },
    [3] = {'308008', 'Construct of Ice', 417, 2, 1, {308002}, {} },
    [4] = {'308000', 'Construct of Pain', 413, 2, 1, {}, {SpecialAbility.area_rampage} },
    [5] = {'308009', 'Construct of Power', 405, 2, 1, {308001}, {} }
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
      for k,v in pairs(last_mob[6]) do
        eq.depop_all(tonumber(v));
      end
    end
    -- Unset Special Abilities
    if ( last_mob[7] ~= nil ) then
      for k,v in pairs(last_mob[7]) do
        e.self:SetSpecialAbility(v, 0);
      eq.zone_emote(15, "SetSpecialAbility: " .. v .. " 0" );
      end
    end
  end

  local num = math.random(1,table.getn(list_constructs));
  local mob = list_constructs[num];

  e.self:SendIllusionPacket({race=mob[3],gender=mob[4],texture=mob[5]});
  e.self:TempName(mob[2]);
  e.self:SetNPCFactionID(79);

  -- Spawn Sub-NPCs 
  if ( mob[6] ~= nil ) then 
    for k,v in pairs(mob[6]) do
      eq.spawn2( v, 0, 0, e.self:GetX() + 15, e.self:GetY() + 15, e.self:GetZ(), e.self:GetHeading() );
    end
  end

  -- Set Special Abilities
  if ( mob[7] ~= nil ) then
    for k,v in pairs(mob[7]) do
      eq.zone_emote(15, "SetSpecialAbility: " .. v .. " 1" );
      e.self:SetSpecialAbility(v, 1);
    end
  end
  last_mob = mob;
end

function Boss_Spawn(e)
  event_started = false;
  setup();

end

function Boss_Say(e)
  if ( event_started ~= true ) then
    if ( e.message:findi("hail") ) then
      e.self:Say("This is the Mastery of Adaptation trial. You must demonstrate your ability to adapt to an unpredictable and ever-changing opponent. Are you ready to [ " .. eq.say_link('begin', false, 'begin') .. " ]?");
    elseif ( e.message:findi("begin") ) then
      e.self:Say("Very well!  Let the battle commence!");

      event_started = true;
      eq.set_timer('shapeshift', 10 * 1000);
      ShapeShift(e);
    end
  end
end

function Boss_Timer(e)
  if (e.timer == "shapeshift") then
    ShapeShift(e);
  end
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

  eq.register_npc_event('mpg_adaptation', Event.tick,           304021, Deathtouch_Tick);
end

function event_encounter_unload(e)
end
