-- MPG Trial General Notes
--
-- MPG Group Trial Bits:
-- 1  MPG_fear
-- 2  MPG_ingenuity
-- 4  MPG_weaponry
-- 8  MPG_foresight
-- 16 MPG_efficiency
-- 32 MPG_destruciton
--
-- Lockout on Win: 72 hours
-- Lockout on Loss: 2 hours
--
-- Group Trial Version 1 of zone
-- Raid Trial Version 2 of zone
local event_started = false;
local instance_id;
local lockout_name = 'MPG_foresight';
local lockout_win = 108;
local this_bit = 8;
local player_list;
local warnings = 0;
local emotes = {};
local hazards = {};
local hazard_timer = 30;
local kyvs = {};
local kyv_client;
local kyv_targets = {};
local kyv_timer = 10;
local equipment = {};
local equipment_client;
local equipment_timer = 15;
local dragorns = {};
local dragorn_timer = 35;

local last_emote = '';
local emote_grace = 8;
local client_list;

function setup()
  hazards = {
    [1] = { "The room begins to heat up dramatically. The north side looks safe.", north_safe },
    [2] = { "The room begins to heat up dramatically. The south side looks safe.", south_safe },
    [3] = { "The room begins to heat up dramatically. The east side looks safe.", east_safe },
    [4] = { "The room begins to heat up dramatically. The west side looks safe.", west_safe },
  };
  other_emotes = {
    [2]  = { "The room begins to heat up dramatically. The center looks safe.", center_safe },
    [10] = { "You notice that the Dragorn before you is preparing to cast a devastating spell. Doing enough damage to him might interrupt the process." },
  }

  kyvs = {
    [1]  = { "From the corner of your eye, you notice a Kyv taking aim at your position. You should move.", kyv_move, 5696 },
    [2]  = { "From the corner of your eye, you notice a Kyv taking aim near your position. He appears to be leading the target, anticipating your next movement. You should stand still.", kyv_stop, 5696 },
    [3]  = { "From the corner of your eye, you notice a Kyv taking aim at your head. You should duck.", kyv_duck, 5694 },
  };

  equipment = {
    [1] = { "Your rings constrict and bite into your fingers.  You should remove them.", check_rings },
    [2] = { "The Weapon in your right hand begins to heat up dramatically. You should remove it.", check_weapon }
  };
    
  dragorns = {
    [1] = { "You notice that the Dragorn before you is preparing to cast a devastating close-range spell.", 5693, cast_5693 },
    [2] = { "The Dragorn before you is developing an anti-magic aura.", 5699, self_cast },
    [3] = { "The Dragorn before you is sprouting sharp spikes.", 5698, self_cast },
  }

end

function Start_Event(e)
  last_emote = '';
  event_started = true;
  eq.spawn2(306020, 0, 0, 0, 0, 0, 0);
  
  eq.spawn2(306013, 0, 0, -161, 385, 60, 142); -- Dragorn Acolyte
  eq.spawn2(306014, 0, 0, -256, 384, 60, 110); -- Dragorn Adept
  eq.spawn2(306015, 0, 0, -315, 317, 60, 80);  -- Dragorn Annihilator
  eq.spawn2(306016, 0, 0, -316, 223, 60, 48);  -- Dragorn Flamecaster
  eq.spawn2(306017, 0, 0, -249, 164, 60, 15);  -- Dragorn Incinerator
  eq.spawn2(306018, 0, 0, -158, 160, 60, 241); -- Dragorn Spellscribe

  eq.spawn2(306012, 0, 0, -194, 286, 66, 48);  -- a kyv sureshot
  eq.spawn2(306021, 0, 0, -227, 290, 66, 214); -- a kyv sureshot
  eq.spawn2(306022, 0, 0, -223, 260, 66, 138); -- a kyv sureshot
  eq.spawn2(306023, 0, 0, -188, 257, 66, 83);  -- a kyv sureshot

  eq.spawn2(306011, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);

  eq.set_timer("emotes", 5 * 1000);
  eq.set_timer("equipment", equipment_timer * 1000);

  client_list = eq.get_characters_in_instance(instance_id);
end

function Boss_Spawn(e)
  event_started = false;
  instance_id = eq.get_zone_instance_id();
  player_list = eq.get_characters_in_instance(instance_id);
  lockout_name = 'MPG_foresight';
  lockout_win = 108;
  this_bit = 8;
  emote_grace = 8;
end

function Boss_Say(e)
  if ( event_started ~= true ) then
    if (ValidatePlayersAreInZone(e.other)) then
      if ( e.message:findi("hail") ) then
        e.self:Say("This is the Mastery of Foresight Trial. You must react quickly to deadly and unforgiving hazards. Are you ready to [ " .. eq.say_link('begin', false, 'begin') .. " ]?");
      elseif ( e.message:findi("begin") ) then
        e.self:Say("Very well!  Let the battle commence!");
        Start_Event(e);
      end
    else
      e.self:Say("It appears all members of your adventure are not present, please have them join you before you begin.");
    end
  end
end

function ValidatePlayersAreInZone(requestor)
  local el = eq.get_entity_list();
  for k,v in pairs(player_list) do
    member = el:GetClientByCharID(v)
    if (member.valid == false) then
      requestor:Message(13, "All members of the group/raid need to be in " .. eq.get_zone_long_name() .. ". " );
      return false;
    end
  end
  return true;
end

function Do_Hazard()
  local num = math.random(1,table.getn(hazards));
  if ( last_hazard == num ) then
    Do_Hazard();
  else
    last_hazard = num;
    eq.zone_emote(14, hazards[num][1]);
    hazards[num][2]();
  end
end

function Boss_Timer(e)
  local client;
  local num;
  eq.debug( "name: " .. e.self:GetName() .. " timer: " .. e.timer);
  eq.stop_timer(e.timer);
  if (e.timer == "equipment") then
    client = eq.get_entity_list():GetRandomClient(-204,270,65,150000);
    num = math.random(1,table.getn(equipment));
    equipment_client = {client, num};
    client:Message(14, equipment[num][1]);
    eq.set_timer("equipment_action", 3 * 1000);
  elseif (e.timer == "equipment_action") then
    client = equipment_client[1];
    num = equipment_client[2];
    equipment[num][2](e.self,client);
    eq.set_timer("equipment", equipment_timer * 1000);
  end
end

function Boss_Signal(e)
  if (e.signal == 1) then
    -- Check to see if any of the Dragorn are still alive.
    local el = eq.get_entity_list();
    if ( el:IsMobSpawnedByNpcTypeID(306013) == false and
         el:IsMobSpawnedByNpcTypeID(306014) == false and
         el:IsMobSpawnedByNpcTypeID(306015) == false and
         el:IsMobSpawnedByNpcTypeID(306016) == false and
         el:IsMobSpawnedByNpcTypeID(306017) == false and
         el:IsMobSpawnedByNpcTypeID(306018) == false ) then
      Event_Win(e);
    end
         
  elseif (e.signal == 9) then
    -- received a signal that someone has zoned out
    -- recheck the current client count v/s the count
    -- when the event started
    local now_clients = eq.get_entity_list():GetClientList();

    -- TODO: Need to add a check here to ensure no one
    -- dies or camps or zones out (instant failure).
    Event_Loss(e);
  end
end

function Kyv_Spawn(e)
  eq.set_timer('kyv', kyv_timer * 1000);
end

function Kyv_Timer(e)
  local msg = '';
  local client;
  local num;
  local loc;
  local i;
  if (e.timer == 'kyv') then
    eq.stop_timer(e.timer);

    i = e.self:GetNPCTypeID();
    client = eq.get_entity_list():GetRandomClient(-204, 270, 65, 150000);
    num = math.random(1,table.getn(kyvs));
    kyv_targets[i] = { client, num, {client:GetX(), client:GetY() }};
    client:Message(14, kyvs[num][1]);
    
    eq.debug("name: " .. e.self:GetCleanName() .. i .. " timer: " .. e.timer .. " client picked: " .. client:GetName() );
    eq.set_timer('kyv_action', 3000);
  elseif (e.timer == 'kyv_action') then
    eq.stop_timer(e.timer);
    i = e.self:GetNPCTypeID();
    client = kyv_targets[i][1];
    loc = kyv_targets[i][3];
    if ( kyvs[kyv_targets[i][2]][2](e, client, loc) == false ) then
      e.self:CastSpell(kyvs[kyv_targets[i][2]][3], client:GetID(), 0, 4500);
      eq.debug("name: " .. e.self:GetCleanName() .. i .. " timer: " .. e.timer .. " client picked: " .. client:GetName() );
    else
      msg = 'An arrow narrowly misses you.';
    end
    client:Message(14, msg);
    eq.set_timer('kyv', kyv_timer * 1000 + 4500);
  end
end

-- Return true if client moved
-- Return false if they did not
function kyv_move(e, client, loc)
  eq.debug("name: " .. e.self:GetCleanName() .. " timer: " .. e.timer .. " client: " .. client:GetName() .. " kyv_move old_x: " .. loc[1] .. " old_y:" .. loc[2]);

  if (loc[1] == client:GetX() and loc[2] == client:GetY()) then
    return false;
  end
  return true;
end

-- Return true if client has stopped or engaged in battle
-- Return false if they are moving or engaged in battle
function kyv_stop(e, client, loc)
  eq.debug( "name: " .. e.self:GetCleanName() .. " timer: " .. e.timer .. " client: " .. client:GetName() .. " kyv_stop");
  if ( client:IsMoving() or client:IsEngaged() ) then
    return false;
  end
  return true;
end

-- Return true if client has ducked
-- return false if client has not ducked
function kyv_duck(e, client, loc)
  eq.debug( "name: " .. e.self:GetCleanName() .. " timer: " .. e.timer .. " client: " .. client:GetName() .. " kyv_duck");
  if ( client:GetAppearance() == Appearance.Crouching ) then
    return true;
  end
  return false;
end

function Hazard_Spawn(e)
  eq.set_timer('hazard', hazard_timer * 1000);
end

function Hazard_Timer(e)
  eq.debug( "name: " .. e.self:GetName() .. " timer: " .. e.timer);
  eq.stop_timer(e.timer);
  if (e.timer == "north") then
    ae_check(e, -327, -89, 270, 398);
  elseif (e.timer == "south") then
    ae_check(e, -327, -89, 150, 270);
  elseif (e.timer == "east") then
    ae_check(e, -327, -206, 150, 398);
  elseif (e.timer == "west") then
    ae_check(e, -206, -89, 150, 398);
  elseif (e.timer == "hazard") then
    Do_Hazard();
  end
end

function check_rings(mob, client)
  if ( client:GetItemIDAt(15) ~= -1 ) then
    mob:CastSpell(5695, client:GetID());
  end
  if ( client:GetItemIDAt(16) ~= -1 ) then
    mob:CastSpell(5695, client:GetID());
  end
end

function check_weapon(mob, client)
  if ( client:GetItemIDAt(14) ~= -1 ) then
    mob:CastSpell(2315, client:GetID());
  else
    client:Message(14, "Your weaponry cools down.");
  end
end

function ae_check(e, xmin, xmax, ymin, ymax)
  local cl = eq.get_entity_list():GetClientList();
  local x,y;
  for v in cl.entries do
    x = v:GetX();
    y = v:GetY();
    eq.debug( "client: " .. v:GetName() .. "X: " .. v:GetX() .. " Y: " .. v:GetY() );
    eq.debug( "xmin: " .. xmin .. " xmax: " .. xmax .. " ymin: " .. ymin .. " ymax: " .. ymax);
    if (x < xmin or x > xmax or y < ymin or y > ymax) then
      e.self:CastSpell(5693, v:GetID());
      v:Message(14,'The room explodes with chaotic energy.');
    else
      v:Message(14,'You escape the blast unscathed.');
    end
  end
  eq.set_timer('hazard', hazard_timer * 1000);
end

function north_safe()
  eq.set_timer('north', emote_grace * 1000);
end

function center_safe()
  eq.zone_emote(15, "Center Safe");
end

function south_safe()
  eq.set_timer("south", emote_grace * 1000);
end

function east_safe()
  eq.set_timer("east", emote_grace * 1000);
end

function west_safe()
  eq.set_timer("west", emote_grace * 1000);
end

function Dragorn_Spawn(e)
  eq.set_timer('dragorn', dragorn_timer * 1000);
end

function Dragorn_Death(e)
  eq.signal(306019, 1);
end

function Dragorn_Timer(e)
  local num;
  if (e.timer == 'dragorn') then
    num = math.random(1,table.getn(dragorns));
    dragorns[num][3](e.self, dragorns[num][2]);
  end
end

function cast_5693(mob, spell)
  local dist = 30;
  local mob_x = mob:GetX();
  local mob_y = mob:GetY();
  local x,y,z;
  local cl = eq.get_entity_list():GetClientList();
  for v in cl.entries do
    x = v:GetX(); y = v:GetY(); z = v:GetZ();
    if (mob:CalculateDistance( x, y, z ) < dist ) then
      mob:CastSpell(spell, v:GetID());
    end
  end
end

function self_cast(mob,spell)
  mob:CastSpell(spell, mob:GetID());
end

function Event_Loss(e)
  eq.depop_with_timer();
  eq.repop_zone();
end

function Event_Win(e)
  -- Depop the hazards
  eq.depop_all(306011);

  -- Depop the sureshots
  eq.depop_all(306012);
  eq.depop_all(306021);
  eq.depop_all(306022);
  eq.depop_all(306023);

  -- Disable the deathtouch
  eq.depop_all(306020);

  -- Spawn Shell of the Master
  eq.spawn2(306024, 0, 0, -204, 274, 66, 72);

  -- Update the Lockouts
  local mpg_helper = require("mpg_helper");
  mpg_helper.UpdateRaidTrialLockout(player_list, this_bit, lockout_name);

  eq.depop_with_timer();
end

function event_encounter_load(e)
  setup();

  eq.register_npc_event('mpg_foresight', Event.spawn,          306019, Boss_Spawn);
  eq.register_npc_event('mpg_foresight', Event.say,            306019, Boss_Say);
  eq.register_npc_event('mpg_foresight', Event.death_complete, 306019, Boss_Death);
  eq.register_npc_event('mpg_foresight', Event.timer,          306019, Boss_Timer);
  eq.register_npc_event('mpg_foresight', Event.signal,         306019, Boss_Signal);

  eq.register_npc_event('mpg_foresight', Event.spawn,          306011, Hazard_Spawn);
  eq.register_npc_event('mpg_foresight', Event.timer,          306011, Hazard_Timer);

  eq.register_npc_event('mpg_foresight', Event.spawn,          306012, Kyv_Spawn);
  eq.register_npc_event('mpg_foresight', Event.timer,          306012, Kyv_Timer);
  eq.register_npc_event('mpg_foresight', Event.spawn,          306021, Kyv_Spawn);
  eq.register_npc_event('mpg_foresight', Event.timer,          306021, Kyv_Timer);
  eq.register_npc_event('mpg_foresight', Event.spawn,          306022, Kyv_Spawn);
  eq.register_npc_event('mpg_foresight', Event.timer,          306022, Kyv_Timer);
  eq.register_npc_event('mpg_foresight', Event.spawn,          306023, Kyv_Spawn);
  eq.register_npc_event('mpg_foresight', Event.timer,          306023, Kyv_Timer);

  eq.register_npc_event('mpg_foresight', Event.spawn,          306013, Dragorn_Spawn);
  eq.register_npc_event('mpg_foresight', Event.spawn,          306014, Dragorn_Spawn);
  eq.register_npc_event('mpg_foresight', Event.spawn,          306015, Dragorn_Spawn);
  eq.register_npc_event('mpg_foresight', Event.spawn,          306016, Dragorn_Spawn);
  eq.register_npc_event('mpg_foresight', Event.spawn,          306017, Dragorn_Spawn);
  eq.register_npc_event('mpg_foresight', Event.spawn,          306018, Dragorn_Spawn);
  eq.register_npc_event('mpg_foresight', Event.timer,          306013, Dragorn_Timer);
  eq.register_npc_event('mpg_foresight', Event.timer,          306014, Dragorn_Timer);
  eq.register_npc_event('mpg_foresight', Event.timer,          306015, Dragorn_Timer);
  eq.register_npc_event('mpg_foresight', Event.timer,          306016, Dragorn_Timer);
  eq.register_npc_event('mpg_foresight', Event.timer,          306017, Dragorn_Timer);
  eq.register_npc_event('mpg_foresight', Event.timer,          306018, Dragorn_Timer);
  eq.register_npc_event('mpg_foresight', Event.death_complete, 306013, Dragorn_Death);
  eq.register_npc_event('mpg_foresight', Event.death_complete, 306014, Dragorn_Death);
  eq.register_npc_event('mpg_foresight', Event.death_complete, 306015, Dragorn_Death);
  eq.register_npc_event('mpg_foresight', Event.death_complete, 306016, Dragorn_Death);
  eq.register_npc_event('mpg_foresight', Event.death_complete, 306017, Dragorn_Death);
  eq.register_npc_event('mpg_foresight', Event.death_complete, 306018, Dragorn_Death);
end

function event_encounter_unload(e)
end
