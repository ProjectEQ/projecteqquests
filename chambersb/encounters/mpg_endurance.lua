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

function Boss_Spawn(e)
  event_started = false;
  instance_id = eq.get_zone_instance_id();
  player_list = eq.get_characters_in_instance(instance_id);
  lockout_name = 'MPG_endurance';
  lockout_win = 108;
  this_bit = 2;
  boss_hp = 1;
end

function Boss_Say(e)
  if ( event_started ~= true ) then
    if ( e.message:findi("hail") ) then
      e.self:Say("This is the Mastery of Endurance trial. You must survive an endless onslaught of enemies for as long as necessary. Are you ready to [ " .. eq.say_link('begin', false, 'begin') .. " ]?");
    elseif ( e.message:findi("begin") ) then
      e.self:Say("Very well!  Let the battle commence!");

      eq.spawn_condition('chamberse', instance_id, 2, 1 );
      event_started = true;
      eq.set_timer('win', 20 * 60 * 1000);
      eq.set_timer('wave', 5 * 60 * 1000);
      eq.set_timer('hp', 20 * 1000);
    end
  end
end

function Boss_Timer(e)
  if (e.timer == 'win') then

  elseif (e.timer == 'wave') then

  elseif (e.timer == 'hp') then
    -- Lower both Boss mobs hps by 1%
    boss_hp = boss_hp - 0.01;
    -- GetMaxHP() * boss_hp
    local new_hp = e.self:GetMaxHP() * boss_hp;
    eq.zone_emote(15, "Boss HP PCT: " .. boss_hp .. " new_hp: " .. new_hp);
    e.self:SetHP(new_hp);
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
  eq.register_npc_event('mpg_endurance', Event.say,            305007, Boss_Say);
  eq.register_npc_event('mpg_endurance', Event.say,            305008, Boss_Say);
  eq.register_npc_event('mpg_endurance', Event.spawn,          305007, Boss_Spawn);
  eq.register_npc_event('mpg_endurance', Event.spawn,          305008, Boss_Spawn);
  eq.register_npc_event('mpg_endurance', Event.timer,          305007, Boss_Timer);
  eq.register_npc_event('mpg_endurance', Event.timer,          305008, Boss_Timer);

  eq.register_npc_event('mpg_endurance', Event.tick,           304021, Deathtouch_Tick);
end

function event_encounter_unload(e)
end
