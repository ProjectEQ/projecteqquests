--[[
-- Anguish Zone_Status
-- Control the Player Lockouts
--
-- Lockouts: 
-- Add - Bit - Mob/event
-- 1 -     1 - keldovan
-- 2 -     2 - jelvan
-- 3 -     4 - ture
-- 4 -     8 - hanvar
-- 5 -    16 - amv
-- 6 -    32 - omm
-- 7 -    64 - lower 2.0 orb
-- 8 -    128- upper 2.0 orb
-- 9 -    256- aug named
-- Mob IDs:
--
-- Zone Trash:
--
--]]
--
local lockout_bit;
local instance_id = 0;
local qglobals = {};
local charid_list;
local current_bit = 0;
local entity_list;
local instance_requests = require("instance_requests");
local Anguish_Lockouts = {};

function setup_lockouts()
  Anguish_Lockouts = {
    [317005] = {'Anguish_keldovan', 1,   Spawn_keldovan},
    [317004] = {'Anguish_jelvan',   2,   Spawn_jelvan},
    [317003] = {'Anguish_ture',     4,   Spawn_ture},
    [317002] = {'Anguish_hanvar',   8,   Spawn_hanvar},
    [317001] = {'Anguish_amv',      16,  Spawn_amv},
    [317000] = {'Anguish_omm',      32,  Spawn_omm},
	[1]		 = {'Anguish_lower_orb',64,  Spawn_lorb},
	[2]		 = {'Anguish_upper_orb',128, Spawn_uorb},
	[3]		 = {'Anguish_upper_orb',256, Spawn_augs}
  }
end

function event_spawn(e)
  qglobals = eq.get_qglobals();
  instance_id = eq.get_zone_instance_id();
  charid_list = eq.get_characters_in_instance(instance_id);
  entity_list = eq.get_entity_list();
  lockout_bit = tonumber(qglobals[instance_id .. "_anguish_bit"]);
  if (lockout_bit == nil) then lockout_bit = 0 end
  setup_lockouts();

  for k,v in pairs(Anguish_Lockouts) do
    if (bit.band(lockout_bit, v[2]) == 0 and v[3] ~= nil ) then
      v[3]();
    end
  end

end

function Spawn_keldovan()
	eq.unique_spawn(317005,0,0, -301 ,702, -201, 64);
end

function Spawn_jelvan()
	eq.unique_spawn(317004,0,0, -256 ,2100, -121, 0);
end

function Spawn_ture()
	eq.unique_spawn(317003,0,0, 610, 3381, -12, 130);
end

function Spawn_hanvar()
	eq.unique_spawn(317002,0,0, 424, 4389, 222, 64);
end

function Spawn_amv()
	eq.unique_spawn(317107,0,0, 336, 4486, 278, 0);
end

function Spawn_omm()
	eq.unique_spawn(317109,0,0, 507, 4969, 296.5, 127);
end

function Spawn_lorb()
end
function Spawn_uorb()
end
function Spawn_augs()
end

function AddLockout(lockout)
  local lockout_name = lockout[1]; 
  local lockout_bit = lockout[2];

  current_bit = tonumber(qglobals[instance_id.."_anguish_bit"]); 
  eq.set_global(instance_id.."_anguish_bit",tostring(bit.bor(current_bit,lockout_bit)),7,"H6"); 

  for k,v in pairs(charid_list) do
    eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(108)), "H108", 0,v, 0);
  end                                                                                                           
end

function event_signal(e)
  if ( Anguish_Lockouts[e.signal] ~= nil ) then
    AddLockout( Anguish_Lockouts[e.signal] );
  end
end

