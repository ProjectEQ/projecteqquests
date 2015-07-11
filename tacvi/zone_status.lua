--[[
-- Tacvi Zone_Status
-- Control the Player Lockouts
-- 298223
--
-- Lockouts: 
-- Add - Bit - Mob
-- 1 -     1 - PXK Pixtt Xxeric Kex
-- 2 -     2 - PKK Pixtt Kretv Krakxt
-- 3 -     4 - PRT Pixtt rei Tavas
-- 4 -     8 - ZMKP Zun`Muram Kvxe Pirik
-- 5 -    16 - ZMSB Zun`Muram Shaldn Boc
-- 6 -    32 - ZMMD Zun`Muram Mordl Delt
-- 7 -    64 - ZMYV Zun`Muram Yihst Vor
-- 8 -   128 - TMCV Tunat`Muram Cuu Vauax
--
-- Mob IDs:
-- PXK  298039
-- PKK  298201
-- PRT  298032
-- ZMKP 298029
-- ZMSB 298018
-- ZMMD 298020
-- ZMYV 298023
-- TMCV 298054
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
local Tacvi_Lockouts = {}

function setup_lockouts()
  Tacvi_Lockouts = {
    [298039] = {'Tacvi_PXK', 1, Spawn_PXK},
    [298201] = {'Tacvi_PKK', 2, Spawn_PKK},
    [298032] = {'Tacvi_PRT', 4, Spawn_PRT},
    [298029] = {'Tacvi_ZMKP', 8, Spawn_ZMKP},
    [298018] = {'Tacvi_ZMSB', 16, Spawn_ZMSB},
    [298020] = {'Tacvi_ZMMD', 32, Spawn_ZMMD},
    [298023] = {'Tacvi_ZMYV', 64, Spawn_ZMYV},
    [298054] = {'Tacvi_TMCV', 128, Spawn_TMCV}
  }
end

function event_spawn(e)
  qglobals = eq.get_qglobals();
  instance_id = eq.get_zone_instance_id();
  charid_list = eq.get_characters_in_instance(instance_id);
  entity_list = eq.get_entity_list();
  lockout_bit = tonumber(qglobals[instance_id .. "_tacvi_bit"]);
  if (lockout_bit == nil) then lockout_bit = 0 end
  setup_lockouts();

  -- Door at zone in; Talking to Sensnil will unlock
  Door_Lock(18);

  -- Doors to TMCV
  Door_Lock(10);
  Door_Lock(11);
  Door_Lock(14);
  Door_Lock(19);

  for k,v in pairs(Tacvi_Lockouts) do
    if (bit.band(lockout_bit, v[2]) == 0 and v[3] ~= nil ) then
      v[3]();
    end
  end

end

function Spawn_PXK()
  eq.spawn2(298039, 0, 0, 151.00, -162.00, -6.87, 192.5);
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 26, -164, -6.9, 191);
end

function Spawn_PKK()
  eq.spawn2(298201, 0, 0, 162.79, 241.47, -6.87, 188.8);
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 76, 246, -6.77, 197);
end

function Spawn_PRT()
  eq.spawn2(298032, 0, 0, 194.95, -587.61, -6.77, 192.4);
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 83, -586, -6.77, 195.8);
end

function Spawn_ZMKP()
  eq.spawn2(298029, 0, 0, 379.87, -681.00, -6.87, 185.8);
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 272, -684, -6.9, 193);
end

function Spawn_ZMSB()
  eq.spawn2(298018, 0, 0, 366.00, 342.00, 2.60, 240.00);
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 274, 345, -6.77, 194);
end

function Spawn_ZMMD()
  eq.spawn2(298020, 0, 0, 377.60, 145.66, -6.87, 186.0);
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 270, 146, -6.87, 195.4);
end

function Spawn_ZMYV()
  eq.spawn2(298023, 0, 0, 366.00, -488.00, 2.6, 236);
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 272, -487, -6.87, 192.9);
end

function Spawn_TMCV()
  -- TMCV 462, -171, 32, 8
  -- Living Phylactery
  --  454, -242, 25.5, 32
  --  431, -100, 25.5, 56
  --  487, -100, 25.5, 76
  --  476, -242, 25.5, 92
  --  498, -193, 25.5, 228

end

function Door_Lock(door_id)
  local door = 0;
  door = entity_list:FindDoor(door_id);
  if (door ~= nil) then
    door:SetLockPick(-1);
  end
end

function Door_Unlock(door_id)
  local door = 0;
  door = entity_list:FindDoor(door_id);
  if (door ~= nil) then
    door:SetLockPick(0);
  end
end

function AddLockout(lockout)
  local lockout_name = lockout[1]; 
  local lockout_bit = lockout[2];

  current_bit = tonumber(qglobals[instance_id.."_tacvi_bit"]); 
  eq.set_global(instance_id.."_tacvi_bit",tostring(bit.bor(current_bit,lockout_bit)),7,"H6"); 

  for k,v in pairs(charid_list) do                                                                              
    eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(108)), "H108", 0,v, 0);
  end                                                                                                           
end

function event_signal(e)
  if ( Tacvi_Lockouts[e.signal] ~= nil ) then
    AddLockout( Tacvi_Lockouts[e.signal] );
  end
end

