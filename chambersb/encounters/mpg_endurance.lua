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

local event_started = 0;
local instance_id;
local lockout_name = 'MPG_endurance';
local lockout_win = 108;
local this_bit = 2;
local player_list;

function Boss_Spawn(e)
  event_started = 0;
end

function Boss_Say(e)
end

function Boss_Timer(e)
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
  eq.register_npc_event('mpg_endurance', Event.spawn,          305008, Boss_Say);
  eq.register_npc_event('mpg_endurance', Event.timer,          305008, Boss_Say);

  eq.register_npc_event('mpg_endurance', Event.tick,           304021, Deathtouch_Tick);
end

function event_encounter_unload(e)
end
