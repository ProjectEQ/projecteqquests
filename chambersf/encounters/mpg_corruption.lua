-- 
-- MPG Raid Trial General Notes
-- 1  MPG_hate           - The Mastery of Hate (Raid)
-- 2  MPG_endurance      - The Mastery of Endurance (Raid)
-- 4  MPG_foresight      - The Mastery of Foresight (Raid)
-- 8  MPG_specialization - The Mastery of Specialization (Raid)
-- 16 MPG_adaptation     - The Mastery of Adaptation (Raid)
-- 32 MPG_corruption     - The Mastery of Corruption (Raid)  
--

local event_started = 0;
local instance_id;
local lockout_name = 'MPG_corruption';
local lockout_win = 108;
local this_bit = 32;
local player_list;
local warnings = 0;
local this_wave = 1;
local mobs_slain = 0;
local event_started = false;

local list_warror = {};
local list_cleric = {};
local list_monk = {};
local list_rogue = {};
local list_necromancer = {};
local list_magician = {};
local list_wizard = {};
local list_enchanter = {};

function setup()
  list_warrior = {
    [1] = { '309041', '#Bavabwa_Steeltoe', 1 },
    [2] = { '309040', '#Esprit_Boilingblood', 1 },
    [3] = { '309050', '#Fogge_Armstorm', 1 },
    [4] = { '309008', '#Ghurah', 1 },
    [5] = { '309020', '#Javoldar', 1 },
    [6] = { '309049', '#Peavu_Ix`Tim', 1 },
    [7] = { '309005', '#Reattim_Heftsteel', 1 }
  };
  list_cleric = {
    [1] = { '309024', '#Eira_Varinger', 2 },
    [2] = { '309052', '#Elennis_Soulsaviour', 2 },
    [3] = { '309013', '#Faleniel_the_Pure', 2 },
    [4] = { '309003', '#Griball_Sizliv', 2 },
    [5] = { '309026', '#Hemik_Pyus', 2 },
    [6] = { '309038', '#Nicolai_Yule', 2 },
    [7] = { '309053', '#Pellucid', 2 },
    [8] = { '309025', '#Sheru_Embraciu', 2 },
    [9] = { '309044', '#Tremura_Soulheart', 2 },
    [10] = { '309012', '#Valerian_Kimble', 2 }
  };
  list_monk = {
    [1] = { '309021', '#Pirallan', 7 },
    [2] = { '309042', '#Slly_Stonestance', 7 },
    [3] = { '309004', '#Stoneheel_Osprey', 7 },
    [4] = { '309039', '#Tempko', 7 },
    [5] = { '309009', '#Volen_Flyingkick', 7 }
  };
  list_rogue = {
    [1] = { '309043', '#Gizu_Blackheart', 9 },
    [2] = { '309022', '#Joner_Tumble', 9 },
    [3] = { '309023', '#Mazzie_Melkhor', 9 },
    [4] = { '309051', '#Modus_Apparition', 9 },
    [5] = { '309010', '#Steelshadow', 9 },
    [6] = { '309011', '#Texur_Shadowprey', 9 }
  };
  list_necromancer = {
    [1] = { '309032', '#Cadavrox_Bonebringer', 11 },
    [2] = { '309033', '#Deathwalker', 11 },
    [3] = { '309031', '#Enty_Darkmask', 11 },
    [4] = { '309018', '#Nialle_Luty', 11 },
    [5] = { '309060', '#Rebthik_Soulreaver', 11 },
    [6] = { '309059', '#Sammu_Ionua', 11 },
    [7] = { '309048', '#Truwana_Graveblood', 11 }
  };
  list_wizard = {
    [1] = { '309029', '#Allionae_Ullui', 12 },
    [2] = { '309045', '#Endaar_Flashpoint', 12 },
    [3] = { '309036', '#Fiddap_Clakburner', 12 },
    [4] = { '309001', '#Fimble_Icecaster', 12 },
    [5] = { '309000', '#Kathien', 12 },
    [6] = { '309035', '#Mirendach', 12 },
    [7] = { '309014', '#Uronius_Hight', 12 }
  };
  list_magician = {
    [1] = { '309054', '#Carreenu_Opulaae', 13 },
    [2] = { '309046', '#Gaelin', 13 },
    [3] = { '309028', '#Ipputs_Dagglebrap', 13 },
    [4] = { '309015', '#Melodite_Arinal', 13 },
    [5] = { '309027', '#Nakert_Grimmagus', 13 }
  };
  list_enchanter = {
    [1] = { '309037', '#Allaina_Deepeyes', 14 },
    [2] = { '309058', '#Bibladrap_Mindsnapper', 14 },
    [3] = { '309017', '#Etherrakor_the_Silent', 14 },
    [4] = { '309057', '#Jolarrm_Thoughtreaver', 14 },
    [5] = { '309002', '#Kubaria', 14 },
    [6] = { '309030', '#Nimatrix_Cloud', 14 },
    [7] = { '309047', '#Vavrix_Rentu`Ivi', 14 }
  };
end

function Huhn_Say(e)
  if ( event_started ~= true ) then
    if ( e.message:findi("hail") ) then
      e.self:Say("'Hail to you as well, " .. e.other:GetName() .. ", but what exactly are you doing here ? I'm sorry, but as you can see, you've arrived too late. Moments ago we defeated Huhn-Abram the Corrupted and we're currently regrouping and resurrecting our fallen members. Please respect our control of this area and leave at once. I have to admit your presence here is making me a bit nervous. We don't want any trouble.' They stare at you fearfully, 'So, are you going to leave us in peace, or did you come [ " .. eq.say_link('expecting a fight', false, 'expecting a fight') .. "]?' ");

    elseif ( e.message:findi("expecting a fight") ) then
      e.self:Say("'I should have known the trial of corruption wouldn't be so easy. Bring it on!'");

      Spawn_Wave(this_wave);
      event_started = true;
    end
  end
end

function Spawn_Mob(my_table, path, x, y, z, h)
  local my_num = math.random(1,table.getn(my_table));
  local my_mob = my_table[my_num][1];

  eq.spawn2(tonumber(my_mob), 0, 0, x, y, z, h);
end

function Spawn_Wave(wave_number)
  setup();
  -- Wave 1: 1 war 1 clr 1 rog 1 mnk 1 enc 1 wiz
  -- Wave 2: 2 war 2 clr 2 rog 2 mnk 1 enc 1 wiz 1 mag 1 nec
  -- Wave 3: 3 war 3 clr 2 rog 2 mnk 2 enc 2 wiz 2 mag 2 nec
  local x1 = 0; local y1 = 36;
  local z = 0; local h = 0;

  if (wave_number == 1) then 
    -- 1 Warrior
    Spawn_Mob(list_warrior, 0, x1, y1, z, h);
    -- 1 Cleric
    Spawn_Mob(list_cleric, 0, x1+5, y1, z, h);
    -- 1 Rogue
    Spawn_Mob(list_rogue, 0, x1-5, y1, z, h);
    -- 1 Monk
    Spawn_Mob(list_monk, 0, x1+10, y1, z, h);
    -- 1 Enchanter
    Spawn_Mob(list_enchanter, 0, x1-10, y1, z, h);
    -- 1 Wizard
    Spawn_Mob(list_wizard, 0, x1+15, y1, z, h);

  elseif (wave_number == 2) then
    -- 2 Warrior
    Spawn_Mob(list_warrior, 0, x1, y1, z, h);
    Spawn_Mob(list_warrior, 0, x1, y1-10, z, h);
    -- 2 Cleric
    Spawn_Mob(list_cleric, 0, x1+5, y1, z, h);
    Spawn_Mob(list_cleric, 0, x1+5, y1-10, z, h);
    -- 2 Rogue
    Spawn_Mob(list_rogue, 0, x1-5, y1, z, h);
    Spawn_Mob(list_rogue, 0, x1-5, y1-10, z, h);
    -- 2 Monk
    Spawn_Mob(list_monk, 0, x1+10, y1, z, h);
    Spawn_Mob(list_monk, 0, x1+10, y1-10, z, h);
    -- 1 Enchanter
    Spawn_Mob(list_enchanter, 0, x1-10, y1, z, h);
    -- 1 Wizard
    Spawn_Mob(list_wizard, 0, x1+15, y1, z, h);
    -- 1 Magician
    Spawn_Mob(list_magician, 0, x1-10, y1-10, z, h);
    -- 1 Necromancer
    Spawn_Mob(list_necromancer, 0, x1+15, y1-10, z, h);
  elseif (wave_number == 3) then
    -- 3 Warrior
    Spawn_Mob(list_warrior, 0, x1, y1, z, h);
    Spawn_Mob(list_warrior, 0, x1, y1-10, z, h);
    Spawn_Mob(list_warrior, 0, x1, y1-15, z, h);
    -- 3 Cleric
    Spawn_Mob(list_cleric, 0, x1+5, y1, z, h);
    Spawn_Mob(list_cleric, 0, x1+5, y1-10, z, h);
    Spawn_Mob(list_cleric, 0, x1+5, y1-15, z, h);
    -- 2 Rogue
    Spawn_Mob(list_rogue, 0, x1-5, y1, z, h);
    Spawn_Mob(list_rogue, 0, x1-5, y1-10, z, h);
    -- 2 Monk
    Spawn_Mob(list_monk, 0, x1-5, y1-15, z, h);
    Spawn_Mob(list_monk, 0, x1+10, y1, z, h);
    -- 2 Enchanter
    Spawn_Mob(list_enchanter, 0, x1+10, y1-10, z, h);
    Spawn_Mob(list_enchanter, 0, x1+10, y1-15, z, h);
    -- 2 Wizard
    Spawn_Mob(list_wizard, 0, x1-10, y1, z, h);
    Spawn_Mob(list_wizard, 0, x1-10, y1-10, z, h);
    -- 2 Magician
    Spawn_Mob(list_magician, 0, x1-10, y1-15, z, h);
    Spawn_Mob(list_magician, 0, x1+15, y1, z, h);
    -- 2 Necromancer
    Spawn_Mob(list_necromancer, 0, x1+15, y1-10, z, h);
    Spawn_Mob(list_necromancer, 0, x1+15, y1-15, z, h);
  end
end

function Huhn_Spawn(e)
  setup();
  this_wave = 1;
  mobs_slain = 0;
  event_started = false;
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

function Mob_Death(e)
  e.self:Shout("I have died!");
  eq.signal(309006, 1);
end

function Huhn_Signal(e)
  e.self:Shout("I have gotten a signal! wave: " .. this_wave);
  mobs_slain = mobs_slain + 1;
  
  if (this_wave == 1 and mobs_slain == 6) then
    this_wave = this_wave + 1;
    mobs_slain = 0;
    Spawn_Wave(this_wave);
  elseif (this_wave == 2 and mobs_slain == 12) then
    this_wave = this_wave + 1;
    mobs_slain = 0;
    Spawn_Wave(this_wave);
  end
end

function event_encounter_load(e)
  eq.register_npc_event('mpg_corruption', Event.say,            309006, Huhn_Say);
  eq.register_npc_event('mpg_corruption', Event.spawn,          309006, Huhn_Spawn);
  eq.register_npc_event('mpg_corruption', Event.signal,         309006, Huhn_Signal);

  eq.register_npc_event('mpg_corruption', Event.tick,           304021, Deathtouch_Tick);

	eq.register_npc_event('mpg_corruption', Event.death_complete, 309041, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309040, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309050, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309008, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309020, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309049, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309005, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309024, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309052, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309013, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309003, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309026, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309038, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309053, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309025, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309044, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309012, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309021, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309042, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309004, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309039, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309009, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309043, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309022, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309023, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309051, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309010, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309011, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309032, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309033, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309031, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309018, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309060, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309059, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309048, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309029, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309045, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309036, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309001, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309000, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309035, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309014, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309054, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309046, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309028, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309015, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309027, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309037, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309058, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309017, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309057, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309002, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309030, Mob_Death);
	eq.register_npc_event('mpg_corruption', Event.death_complete, 309047, Mob_Death);

end

function event_encounter_unload(e)
end
