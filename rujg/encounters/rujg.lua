-- Steelslave Researcher
function Researcher_Death(e)
  local el = eq.get_entity_list();
  if ( el:IsMobSpawnedByNpcTypeID(260061) == false ) then 

    -- Flawed Mutation
    eq.spawn2(260062, 0, 0, 1382, -128, 140, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1406, -119, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1419, -117, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1398, -104, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1354, -17, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1359, -26, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1367, -31, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1363, -27, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1372, -10, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1377, -18, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1375, -31, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1383, -24, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1393, -12, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1403, -7, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1381, -18, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation
    eq.spawn2(260062, 0, 0, 1375, -2, 145, 0):SetAppearance(3); -- NPC: Flawed_Mutation

    -- Flawless Experimental Battlelord
    eq.spawn2(260069, 0, 0, 1512, -65, 146, 376); -- NPC: Flawless_Experimental_Battlelord

    -- Steeslave Researcher
    eq.spawn2(260070, 0, 0, 1525, -105, 144, 430); -- NPC: Steelslave_Researcher_
    eq.spawn2(260070, 0, 0, 1534, -25, 143, 310); -- NPC: Steelslave_Researcher_

    -- Flawless Experimental Brute
    eq.spawn2(260063, 0, 0, 1344, -71, 143, 368); -- NPC: Flawless_Experimental_Brute
    eq.spawn2(260063, 0, 0, 1422, -35, 143, 340); -- NPC: Flawless_Experimental_Brute
    eq.spawn2(260063, 0, 0, 1427, -84, 143, 392); -- NPC: Flawless_Experimental_Brute
  end
end

-- Violent Research Subject
function Subject_Death(e)
  eq.zone_emote(15, "The sounds of crumbling stone, digging miners, and the bellows of slave masters don't mask the cries of tortured slaves and beasts.  The orcs take great pleasure in causing as much pain to these creatures as possible.  Be careful, or you shall become a victim of their sadistic games.");

  local el = eq.get_entity_list();
  if ( el:IsMobSpawnedByNpcTypeID(260021) == false and el:IsMobSpawnedByNpcTypeID(260038) == false and el:IsMobSpawnedByNpcTypeID(260044) == false and el:IsMobSpawnedByNpcTypeID(260060) == false ) then 
    -- Steelslave Researcher
    eq.spawn2(260061, 0, 0, 14, 334, 140, 0); -- NPC: Steelslave_Researcher
    eq.spawn2(260061, 0, 0, -41, 326, 140, 0); -- NPC: Steelslave_Researcher
    eq.spawn2(260061, 0, 0, -20, 340, 140, 0); -- NPC: Steelslave_Researcher
  end
end

-- Flawless Experimental Battlelord
function Battlelord_Combat(e)
  if (e.joined == true) then
    eq.set_timer("swarm", 120 * 1000);
  else
    eq.stop_timer("swarm");
    eq.depop_all(260071);
  end
end

function Battlelord_Timer(e)
  if (e.timer == "swarm") then
    eq.zone_emote(15, "Flawless Experimental Battlelord roars as his muscles bulge to gargantuan proportions!");
    eq.spawn2(260071, 0, 0, 1389, -7, 143, 262); -- NPC: Flawed_Mutation_
    eq.spawn2(260071, 0, 0, 1375, -99, 144, 456); -- NPC: Flawed_Mutation_
  end
end

-- Flawless Experimental Battlelord
function Battlelord_Death(e)
  local instance_requests = require("instance_requests");
  local lockout_name = 'LDON_rujg';
  local instance_id = eq.get_zone_instance_id();
  local raid_list = eq.get_characters_in_instance(instance_id);

  for k,v in pairs(raid_list) do
    eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(108)), "H108", 0, v, 0);
  end

  -- Flawed Mutations
  eq.depop_all(260062);
  eq.depop_all(260071);

  -- Event Loot
  -- #Researcher`s Box of Supplies
  eq.spawn2(260066, 0, 0, 1499, -168, 140, 0); -- NPC: #Researcher`s_Box_of_Supplies
  -- #The Bloody Barrel
  eq.spawn2(260064, 0, 0, 1497, -185, 145, 0); -- NPC: #The_Bloody_Barrel
  -- #The Splintering Barrel
  eq.spawn2(260065, 0, 0, 1496, -179, 145, 0); -- NPC: #The_Splintering_Barrel
end

function event_encounter_load(e)
  eq.register_npc_event('rujg', Event.death_complete, 260061, Researcher_Death);

  eq.register_npc_event('rujg', Event.death_complete, 260038, Subject_Death);
  eq.register_npc_event('rujg', Event.death_complete, 260044, Subject_Death);
  eq.register_npc_event('rujg', Event.death_complete, 260060, Subject_Death);
  eq.register_npc_event('rujg', Event.death_complete, 260021, Subject_Death);

  eq.register_npc_event('rujg', Event.death_complete, 260069, Battlelord_Death);
  eq.register_npc_event('rujg', Event.combat,         260069, Battlelord_Combat);
  eq.register_npc_event('rujg', Event.timer,          260069, Battlelord_Timer);

end
