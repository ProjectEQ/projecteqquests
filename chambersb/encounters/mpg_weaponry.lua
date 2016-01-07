-- MPG Trial General Notes
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
-- Group Trial Version 1 of zone
-- Raid Trial Version 2 of zone
local instance_id;
local this_bit = 4;
local lockout_win = 72;
local lockout_loss = 2;
local lockout_name = 'MPG_weaponry';
local warnings;
local minutes_remaining;
local player_list;
local instance_requests;

function Weaponry_Spawn(e)
  instance_requests = require("instance_requests");
  instance_id = eq.get_zone_instance_id();
  player_list = eq.get_characters_in_instance(instance_id);
  minutes_remaining = 15;
  warnings = 0;

  eq.spawn_condition('chambersb', instance_id, 1, 0);
end

function Weaponry_Say(e)
  if (e.message:findi("hail")) then
    e.self:Say("This is the Mastery of Weaponry trial. You must demonstrate your ability to think on your feet, to defeat an unbeatable opponent. Are you ready to [" .. eq.say_link("begin", false, "begin") .. "]?");

  elseif (e.message:findi("begin")) then
    eq.spawn_condition('chambersb', instance_id, 1, 1);

    e.self:Say("Very well!  Let the battle commence!");

    eq.set_timer("minutes", 1 * 60 * 1000);
    eq.zone_emote(15, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
  end
end

function Weaponry_Timer(e)
  if (e.timer == "minutes") then 
    minutes_remaining = minutes_remaining - 1;

    -- If the minutes reach 0; then the trial mobs are not died; 
    -- otherwise we would have stopped the timer.
    if (minutes_remaining == 0) then
      eq.stop_all_timers();
      eq.spawn_condition('chambersb', instance_id, 1, 0);

      eq.zone_emote(13, "You have been found unworthy.");
      eq.depop();

      for k,v in pairs(player_list) do
        eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(2)), "H2", 0, v, 0);
      end
    else 
      eq.zone_emote(15, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
    end
  end
end

function Weaponry_Signal(e)
  if (e.signal == 1) then 
    eq.spawn_condition('chambersb', instance_id, 1, 0);
    eq.stop_all_timers();
    eq.spawn2(305005, 0, 0, -212, 273, 71, 20);
    eq.depop();

    local mpg_helper = require("mpg_helper");
    mpg_helper.UpdateGroupTrialLockout(player_list, this_bit, lockout_name);
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

-- The Bazu, Hulking Bazu, is weak to slashing. 
function Bazu_Spawn(e)
	e.self:ModSkillDmgTaken(1, 200); -- 1h slashing
	e.self:ModSkillDmgTaken(3, 200); -- 2h slashing
  e.self:ModSkillDmgTaken(36,-15); -- piercing
  e.self:ModSkillDmgTaken(0, -85); -- 1h blunt
  e.self:ModSkillDmgTaken(2, -85); -- 2h blunt
  e.self:ModSkillDmgTaken(28, 15); -- h2h
end

-- The Dragorn, Hemkai the Ascendant, is weak to piercing. 
function Ascendant_Spawn(e)
	e.self:ModSkillDmgTaken(36, 200); -- piercing
	e.self:ModSkillDmgTaken(1, -85); -- 1h slashing
	e.self:ModSkillDmgTaken(3, -85); -- 2h slashing
  e.self:ModSkillDmgTaken(0, -15); -- 1h blunt
  e.self:ModSkillDmgTaken(2, -15); -- 2h blunt
  e.self:ModSkillDmgTaken(28, 15); -- h2h
end

-- The Golem, Granite Stoneguardian, is weak to blunt weapons. 
function Stoneguardian_Spawn(e)
	e.self:ModSkillDmgTaken(0, 200); -- 1h blunt
	e.self:ModSkillDmgTaken(2, 200); -- 2h blunt
	e.self:ModSkillDmgTaken(28, 200); -- h2h
	e.self:ModSkillDmgTaken(36, -85); -- piercing
	e.self:ModSkillDmgTaken(1, -15); -- 1h slashing
	e.self:ModSkillDmgTaken(3, -15); -- 2h slashing
end

-- The Lightning mob, Steelshock, is weak to nukes. 
function Steelshock_Spawn(e)
	e.self:ModSkillDmgTaken(0, -85); -- 1h blunt
	e.self:ModSkillDmgTaken(2, -85); -- 2h blunt
	e.self:ModSkillDmgTaken(28,-15); -- h2h
	e.self:ModSkillDmgTaken(36,-85); -- piercing
	e.self:ModSkillDmgTaken(1, -85); -- 1h slashing
	e.self:ModSkillDmgTaken(3, -85); -- 2h slashing
end

function Mini_Death(e)
  local el = eq.get_entity_list();
  if (el:IsMobSpawnedByNpcTypeID(305001) == false and
      el:IsMobSpawnedByNpcTypeID(305002) == false and
      el:IsMobSpawnedByNpcTypeID(305003) == false and
      el:IsMobSpawnedByNpcTypeID(305000) == false ) then
    
      eq.signal(305004, 1);
  end
end

function event_encounter_load(e)
  eq.register_npc_event('mpg_weaponry', Event.spawn,          305004, Weaponry_Spawn);
  eq.register_npc_event('mpg_weaponry', Event.say,            305004, Weaponry_Say);
  eq.register_npc_event('mpg_weaponry', Event.death_complete, 305004, Weaponry_Death);
  eq.register_npc_event('mpg_weaponry', Event.timer,          305004, Weaponry_Timer);
  eq.register_npc_event('mpg_weaponry', Event.signal,         305004, Weaponry_Signal);

  eq.register_npc_event('mpg_weaponry', Event.spawn,          305001, Ascendant_Spawn);
  eq.register_npc_event('mpg_weaponry', Event.spawn,          305002, Stoneguardian_Spawn);
  eq.register_npc_event('mpg_weaponry', Event.spawn,          305003, Bazu_Spawn);
  eq.register_npc_event('mpg_weaponry', Event.spawn,          305000, Steelshock_Spawn);

  eq.register_npc_event('mpg_weaponry', Event.death_complete, 305001, Mini_Death);
  eq.register_npc_event('mpg_weaponry', Event.death_complete, 305002, Mini_Death);
  eq.register_npc_event('mpg_weaponry', Event.death_complete, 305003, Mini_Death);
  eq.register_npc_event('mpg_weaponry', Event.death_complete, 305000, Mini_Death);

  eq.register_npc_event('mpg_weaponry', Event.tick,           305006, Deathtouch_Tick);
end

function event_encounter_unload(e)
end
