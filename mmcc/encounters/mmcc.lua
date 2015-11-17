-- Event: LDoN Raid: Mistmoore Catacombs: Struggles within the Progeny
-- http://www.peqtgc.com/phpBB3/viewtopic.php?f=4&t=15491
-- http://everquest.allakhazam.com/db/quest.html?quest=4177
--
-- 243672 Valdoon Kel`Novar (real)
-- 243677 Valdoon Kel`Novar (fake)
-- 243636 Guardian of Kel`Novar
local valdoon_hp_5 = 30000;
local extra_loot = false;
local guardians = 0;
local instance_id;
local raid_list;
local instance_requests = require("instance_requests"); 

function Guardian_Death(e)
  eq.zone_emote(15, "The massive stone beast shudders violently as it transforms into a lifeless statue. The power of its master wanes slightly by the loss of its soul-bound guardian.");
  local valdoon = eq.get_entity_list():GetMobByNpcTypeID(243672);
  local valdoon_hp = valdoon:GetHP() - valdoon_hp_5;
  valdoon:SetOOCRegen(0);
  valdoon:SetHP(valdoon_hp);
  guardians = guardians + 1;
  if ( guardians == 3 ) then
    eq.zone_emote(14, "Your victory has weakened a shroud of magic cloaking the dungeon's treasure.");
  end

end

function Fake_Spawn(e)
  extra_loot = false;
end

function Fake_Death(e)
  eq.zone_emote(15, "A mighty laugh echoes out into the night from the gargoyle aviary. The sound of Valdoon Kel'Novar's voice is clear, 'Did you fools really believe I would be so careless? You'll not live to regret the mistake of crossing the Trueborn!' ");
  eq.spawn2(243636, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
  extra_loot = true;
end

function Real_Spawn(e)
  instance_id = eq.get_zone_instance_id();
  raid_list = eq.get_characters_in_instance(instance_id);
end

function Real_Death(e)
  eq.stop_timer('valdoon');
  eq.spawn2(243680, 0, 0, 1129, 560, 10.13, 186);
  eq.spawn2(243681, 0, 0, 1129, 477, 10.13, 186);
  if (extra_loot == true) then
    eq.spawn2(243679, 0, 0, 1241, 510, -3.90, 190);
  end

  local lockout_name = 'LDON_mmcc';
  for k,v in pairs(raid_list) do                                                                             
    eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(108)), "H108", 0,v, 0);
  end                                                                                                          
end

function Real_Combat(e)
  if (e.joined) then
    eq.set_timer('valdoon', 30 * 1000);
  else 
    eq.stop_timer('valdoon');
    eq.depop_all(243678);
  end
end

function Real_Timer(e)
  if (e.timer == 'valdoon') then
    eq.spawn2(243678, 0, 0, 1060, 480, 11.73, 253);
    eq.spawn2(243678, 0, 0, 1030, 480, 11.73, 253);
    eq.spawn2(243678, 0, 0, 1060, 564, 11.73, 121);
    eq.spawn2(243678, 0, 0, 1030, 564, 11.73, 121);
  end
end

function event_encounter_load(e)
  eq.register_npc_event('mmcc', Event.death_complete, 243636, Guardian_Death);
  eq.register_npc_event('mmcc', Event.death_complete, 243677, Fake_Death);
  eq.register_npc_event('mmcc', Event.spawn,          243677, Fake_Spawn);

  eq.register_npc_event('mmcc', Event.death_complete, 243672, Real_Death);
  eq.register_npc_event('mmcc', Event.spawn,          243672, Real_Spawn);
  eq.register_npc_event('mmcc', Event.timer,          243672, Real_Timer);
  eq.register_npc_event('mmcc', Event.combat,         243672, Real_Combat);
end
