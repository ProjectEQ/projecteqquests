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
local last_emote = '';
local emote_grace = 8;

function setup()
  hazards = {
    [1] = { "The room begins to heat up dramatically. The north side looks safe.", north_safe },
    [2] = { "The room begins to heat up dramatically. The south side looks safe.", south_safe },
    [3] = { "The room begins to heat up dramatically. The east side looks safe.", east_safe },
    [4] = { "The room begins to heat up dramatically. The west side looks safe.", west_safe },
    [5] = { "Your rings constrict and bite into your fingers.  You should remove them.", remove_rings },
  };

  rings = {
  };

  kyvs = {
    [1]  = { "From the corner of your eye, you notice a Kyv taking aim at your position. You should move.", kyv_move, 5696 },
    [2]  = { "From the corner of your eye, you notice a Kyv taking aim near your position. He appears to be leading the target, anticipating your next movement. You should stand still.", kyv_stop, 5696 },
    [3]  = { "From the corner of your eye, you notice a Kyv taking aim at your head. You should duck.", kyv_duck, 5694 },
  };

  more_emote = {
    [8]  = { "The Dragorn before you is developing an anti-magic aura." },
    [9]  = { "You notice that the Dragorn before you is preparing to cast a devastating close-range spell." },
    [10] = { "You notice that the Dragorn before you is preparing to cast a devastating spell. Doing enough damage to him might interrupt the process." },
    [11] = { "The Dragorn before you is sprouting sharp spikes." },
    [12] = { "The Weapon in your right hand begins to heat up dramatically. You should remove it." }
  }

  other_emotes = {
    [2]  = { "The room begins to heat up dramatically. The center looks safe.", center_safe },
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
    if ( e.message:findi("hail") ) then
      e.self:Say("This is the Mastery of Foresight Trial. You must react quickly to deadly and unforgiving hazards. Are you ready to [ " .. eq.say_link('begin', false, 'begin') .. " ]?");
    elseif ( e.message:findi("begin") ) then
      e.self:Say("Very well!  Let the battle commence!");
      Start_Event(e);
    elseif ( e.message:findi("test")) then
      if ( e.other:GetAppearance() == Appearance.Crouching ) then
        eq.zone_emote(15, "Name: " .. e.other:GetName() .. " is ducking.");
      end
      eq.zone_emote(15, "Ring: " .. e.other:GetItemIDAt(15) .. " Ring: " .. e.other:GetItemIDAt(16) );
      if ( e.other:GetItemIDAt(15) ~= -1 ) then
        e.self:CastSpell(5695, e.other:GetID());
      end
      if ( e.other:GetItemIDAt(16) ~= -1 ) then
        e.self:CastSpell(5695, e.other:GetID());
      end
    end
  end
end

function Do_Emote()
--   local num = math.random(1,table.getn(emotes));
--   if ( last_emote == num ) then
--     Do_Emote();
--   end
--   eq.zone_emote(14, emotes[num][1]);
--   last_emote = num;
-- 
--   emotes[num][2]();
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
  if (e.timer == "emotes") then
    -- Do_Emote();
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
  elseif (e.timer == "ring") then
    ring_check(e);
  elseif (e.timer == "hazard") then
    Do_Hazard();
  end
end

function ring_check(e)
  local cl = eq.get_entity_list():GetClientList();
  for v in cl.entries do
    if ( v:GetItemIDAt(15) ~= -1 ) then
      e.self:CastSpell(5695, v:GetID());
    end
    if ( v:GetItemIDAt(16) ~= -1 ) then
      e.self:CastSpell(5695, v:GetID());
    end
  end
  eq.set_timer('hazard', hazard_timer * 1000);
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

function remove_rings()
  eq.set_timer('ring', emote_grace * 1000);
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

  -- Spawn Greedy Dwarf
  eq.spawn2(304028, 0, 0, -204, 274, 66, 72);

  -- Update the Lockouts
  local mpg_helper = require("mpg_helper");
  mpg_helper.UpdateRaidTrialLockout(player_list, this_bit, lockout_name);
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

  eq.register_npc_event('mpg_foresight', Event.tick,           306020, Deathtouch_Tick);

end

function event_encounter_unload(e)
end
