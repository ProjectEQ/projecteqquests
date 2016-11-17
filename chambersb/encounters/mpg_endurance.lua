-- 
-- MPG Raid Trial General Notes
-- 1  MPG_hate           - The Mastery of Hate (Raid)
-- 2  MPG_endurance      - The Mastery of Endurance (Raid)
-- 4  MPG_foresight      - The Mastery of Foresight (Raid)
-- 8  MPG_specialization - The Mastery of Specialization (Raid)
-- 16 MPG_adaptation     - The Mastery of Adaptation (Raid)
-- 32 MPG_corruption     - The Mastery of Corruption (Raid)  
--
-- Mobs
-- 305007 Ansdaicher_the_Ancient
-- 305008 Zellucheraz_the_Ancient
-- 305009 a_dragorn_antagonist
-- 305010 a_dragorn_champion
-- 305011 a_dragorn_defender
-- 305012 a_frantic_discordling
-- 305013 a_muramite_sentinel

local event_started = false;
local instance_id;
local lockout_name = 'MPG_endurance';
local lockout_win = 108;
local this_bit = 2;
local player_list;
local boss_hp;
local wave;
local minute;

function Boss_Spawn(e)
  event_started = false;
  instance_id = eq.get_zone_instance_id();
  player_list = eq.get_characters_in_instance(instance_id);
  lockout_name = 'MPG_endurance';
  lockout_win = 108;
  this_bit = 2;
  boss_hp = 100;
  wave = 0;
  minute = 0;
end

function start_timers()
  eq.set_timer('win', 20 * 60 * 1000);
  eq.set_timer('hp', 12 * 1000);
  eq.set_timer('minute', 60 * 1000);
end

function Start_Event(e)
  eq.spawn_condition('chamberse', instance_id, 2, 1 );

  eq.get_entity_list():GetNPCByNPCTypeID(305007):SetNPCFactionID(79);
  eq.get_entity_list():GetNPCByNPCTypeID(305008):SetNPCFactionID(79);

  event_started = true;

  start_timers();
end

function Boss_Say(e)
  if ( event_started ~= true ) then
    if ( e.message:findi("hail") ) then
      e.self:Say("This is the Mastery of Endurance trial. You must survive an endless onslaught of enemies for as long as necessary. Are you ready to [ " .. eq.say_link('begin', false, 'begin') .. " ]?");
    elseif ( e.message:findi("begin") ) then
      e.self:Say("Very well!  Let the battle commence!");
      Start_Event(e);
      Spawn_Adds();
    end
  end
end

function Boss_Signal(e)
  if ( e.signal == 1 ) then
    event_started = true;
  end
end

function Spawn_Adds()
  if (wave == nil) then
    wave = 0;
  end
  wave = wave + 1;
  -- Wave Number:
  -- 1: 3 adds 100-65 (1,3,6)
  -- 2: 5 adds 65-30a (4,5)
  -- 3: 6 adds 30-20  (2)
  -- 4: 7 adds 20-0   (center)
  --
  -- 1st LOC: -161, 386, 58, 146
  -- 2nd LOC: -254, 389, 58, 115
  -- 3rd LOC: -317, 319, 58, 82
  -- 4th LOC: -318, 226, 58, 50
  -- 5th LOC: -251, 161, 58, 16
  -- 6th LOC: -157, 158, 58, 239
  -- Center.: -204, 274, 66, 72
  --
  -- 305009 A Dragorn Antagonist (Level 68): needs to be rooted and/or off-tanked;
  -- 305010 A Dragorn Champion (Level 68): needs to be rooted and/or off-tanked;
  -- 305011 A Dragorn Defender (Level 68): needs to be mezzed (they come from the south)... if you can keep them mezzed, you can ignore them for the duration or at least until the other MOB's in the wave are dead;
  -- 305012 A Frantic Discordling (Level 68): needs to be off-tanked;
  -- 305013 A Muramite Sentinel (Level 68): needs to be off-tanked (they come from the center);
  --
  local mobs = {305009,305010,305011,305012,305013};
  local mob;

  if (wave == 1) then
    mob = mobs[math.random(1,table.getn(mobs))];
    eq.spawn2(mob, 0, 0, -161, 386, 58, 146);

    mob = mobs[math.random(1,table.getn(mobs))];
    eq.spawn2(mob, 0, 0, -157, 158, 58, 239);

    mob = mobs[math.random(1,table.getn(mobs))];
    eq.spawn2(mob, 0, 0, -317, 319, 58, 82);
  elseif (wave == 2) then
    mob = mobs[math.random(1,table.getn(mobs))];
    eq.spawn2(mob, 0, 0, -318, 226, 58, 50);

    mob = mobs[math.random(1,table.getn(mobs))];
    eq.spawn2(mob, 0, 0, -251, 161, 58, 16);
  elseif (wave == 3) then
    mob = mobs[math.random(1,table.getn(mobs))];
    eq.spawn2(mob, 0, 0, -254, 389, 58, 115);
  elseif (wave == 4) then
    mob = mobs[math.random(1,table.getn(mobs))];
    eq.spawn2(mob, 0, 0, -204, 274, 66, 72);
  end
end

function Boss_Timer(e)
  if (e.timer == 'win') then
    eq.stop_all_timers();
    Event_Win(e);

  elseif (e.timer == 'minute' and e.self:GetNPCTypeID() == 305007) then
    minute = minute + 1;
    -- eq.zone_emote(15, "Min: " .. minute);
  elseif (e.timer == 'hp' and e.self:GetNPCTypeID() == 305007) then
    -- Lower both Boss mobs hps by 1%
    boss_hp = boss_hp - 1;
    local new_hp = e.self:GetMaxHP() * (boss_hp/100);

    -- eq.zone_emote(15, e.self:GetNPCTypeID() .. " Boss HP PCT: " .. boss_hp .. " new_hp: " .. new_hp);

    eq.get_entity_list():GetNPCByNPCTypeID(305007):SetHP(new_hp);
    eq.get_entity_list():GetNPCByNPCTypeID(305008):SetHP(new_hp);
    
    if (tonumber(boss_hp) == 65) then
      Spawn_Adds();
    elseif (tonumber(boss_hp) == 30) then
      Spawn_Adds();
    elseif (tonumber(boss_hp) == 20) then
      Spawn_Adds();
    elseif (tonumber(boss_hp) < 1) then
      eq.stop_all_timers();
      Event_Win(e);
    end
  end
end

function Boss_Combat(e)
  if (event_started == true and e.joined == false) then
    eq.stop_all_timers();
  elseif(event_started == true and e.joined == true) then
    start_timers();
  end
end

function Add_Death(e)
  local el = eq.get_entity_list();
  if (el:IsMobSpawnedByNpcTypeID(305007) or el:IsMobSpawnedByNpcTypeID(305008)) then
    eq.spawn2(e.self:GetNPCTypeID(), 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
  end
end

function Event_Win(e)
  eq.depop_all(305007);
  eq.depop_all(305008);
  eq.depop_all(305009);
  eq.depop_all(305010);
  eq.depop_all(305011);
  eq.depop_all(305012);
  eq.depop_all(305013);

  -- Disable the deathtouch
  eq.spawn_condition('chambersb', instance_id, 2, 0 );

  -- Spawn Greedy Dwarf
  eq.spawn2(304028, 0, 0, -204, 274, 66, 72);

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
  eq.register_npc_event('mpg_endurance', Event.say,            305007, Boss_Say);
  eq.register_npc_event('mpg_endurance', Event.say,            305008, Boss_Say);
  eq.register_npc_event('mpg_endurance', Event.spawn,          305007, Boss_Spawn);
  eq.register_npc_event('mpg_endurance', Event.spawn,          305008, Boss_Spawn);
  eq.register_npc_event('mpg_endurance', Event.timer,          305007, Boss_Timer);
  eq.register_npc_event('mpg_endurance', Event.timer,          305008, Boss_Timer);
  eq.register_npc_event('mpg_endurance', Event.signal,         305007, Boss_Signal);
  eq.register_npc_event('mpg_endurance', Event.signal,         305008, Boss_Signal);
  eq.register_npc_event('mpg_endurance', Event.combat,         305007, Boss_Combat);
  eq.register_npc_event('mpg_endurance', Event.combat,         305008, Boss_Combat);

  eq.register_npc_event('mpg_endurance', Event.death_complete,          305009, Add_Death);
  eq.register_npc_event('mpg_endurance', Event.death,          305010, Add_Death);
  eq.register_npc_event('mpg_endurance', Event.death,          305011, Add_Death);
  eq.register_npc_event('mpg_endurance', Event.death,          305012, Add_Death);
  eq.register_npc_event('mpg_endurance', Event.death,          305013, Add_Death);

  eq.register_npc_event('mpg_endurance', Event.tick,           304021, Deathtouch_Tick);
end

function event_encounter_unload(e)
end
