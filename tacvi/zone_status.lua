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
-- Zone Trash:
-- 298015 an_elite_mastruq_berserker
-- 298016 an_elite_mastruq_crusher
-- 298021 an_elite_mastruq_destroyer
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
    [298055] = {'Tacvi_TMCV', 128, Spawn_TMCV}
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
  eq.spawn2(298039, 0, 0, 151.00, -162.00, -0.375, 386); -- NPC: Pixtt_Xxeric_Kex
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 37.0, -165.0, -2.75, 392); -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
  -- Zajee's remains
  eq.spawn2(298038, 0, 0, 12, -106, -6.03, 264):SetAppearance(3); -- NPC: #Zajeer`s_remains
end

function Spawn_PKK()
  eq.spawn2(298201, 0, 0, 161.0, 242.0, -4.125, 378); -- NPC: Pixtt_Kretv_Krakxt
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 76.0, 246.0, -2.75, 388); -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
  -- Frizznik's remains
  eq.spawn2(298036, 0, 0, 49, 251, -6.03, 40):SetAppearance(3); -- NPC: #Frizznik`s_Remains
end

function Spawn_PRT()
  eq.spawn2(298032, 0, 0, 202.0, -586.0, -4.125, 380); -- NPC: Pixtt_Riel_Tavas
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 83.0, -586.0, -2.75, 378); -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
  -- Absor's Remains
  eq.spawn2(298037, 0, 0, 66, -448, -6.03, 208):SetAppearance(3); -- NPC: #Absor`s_Remains
end

function Spawn_ZMKP()
  eq.spawn2(298029, 0, 0, 373.0, -686.0, -0.375, 352); -- NPC: Zun`Muram_Kvxe_Pirik
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 276.0, -685.0, -2.75, 366); -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
  -- Wijdan's Remains
  eq.spawn2(298030, 0, 0, 211, -683, -6.03, 496):SetAppearance(3); -- NPC: #Wijdan`s_Remains
end

function Spawn_ZMSB()
  eq.spawn2(298018, 0, 0, 366.0, 342.0, -0.375, 360); -- NPC: Zun`Muram_Shaldn_Boc
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 274.0, 345.0, -2.75, 364); -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
  -- Xenaida's remains
  eq.spawn2(298033, 0, 0, 230, 335, -6.03, 296):SetAppearance(3); -- NPC: #Xenaida`s_Remains
end

function Spawn_ZMMD()
  eq.spawn2(298020, 0, 0, 369.0, 144.0, -0.375, 352); -- NPC: Zun`Muram_Mordl_Delt
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 270.0, 146.0, -2.75, 370); -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
  -- Rytan's remains
  eq.spawn2(298034, 0, 0, 229, 149, -6.03, 504):SetAppearance(3); -- NPC: #Rytan`s_Remains
end

function Spawn_ZMYV()
  eq.spawn2(298023, 0, 0, 366.0, -488.0, -0.375, 352); -- NPC: Zun`Muram_Yihst_Vor
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 272.0, -487.0, -2.75, 354); -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
  -- Prathun's Remains
  eq.spawn2(298022, 0, 0, 197, -493, -6.77, 121.2):SetAppearance(3); -- NPC: #Prathun`s_Remains
end

function Spawn_TMCV()
  -- TMCV 462, -171, 32, 8
  -- Living Phylactery
  --  454, -242, 25.5, 32
  --  431, -100, 25.5, 56
  --  487, -100, 25.5, 76
  --  476, -242, 25.5, 92
  --  498, -193, 25.5, 228
  -- Door Guards
  --  602 16 21.23 249.9
  --  535 72 23.48 236
  --  601 -362 21.23 134.5
  --  538 -416 15.23 129.1
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 602.0, 16.0, 25.125, 4); -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 535.0, 72.0, 21.125, 14); -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 601.0, -362.0, 25.125, 258); -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
  eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 538.0, -416.0, 19.125, 258); -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)

  eq.spawn2(298014, 0, 0, 462, -171, 32, 128.2); -- NPC: #Tunat`Muram_Cuu_Vauax

  -- Rashere's remains
  eq.spawn2(298031, 0, 0, 506, 147, -6.03, 480):SetAppearance(3); -- NPC: #Rashere`s_Remains
  -- Kaikachi`s remains
  eq.spawn2(298017, 0, 0, 592, 313, -6.03, 440):SetAppearance(3); -- NPC: #Kaikachi`s_Remains
  -- Lyndroh's remains
  eq.spawn2(298010, 0, 0, 320, -144, 21.85, 96):SetAppearance(3); -- NPC: #Lyndroh`s_Remains
  -- Silius's remains
  eq.spawn2(298009, 0, 0, 322, -199, 21.85, 168):SetAppearance(3); -- NPC: #Silius`_Remains
  -- Maddoc's remains
  eq.spawn2(298011, 0, 0, 483, -171, 25.85, 496):SetAppearance(3); -- NPC: #Maddoc`s_Remains
  -- Vahlara's remains
  eq.spawn2(298024, 0, 0, 600, -588, -6.03, 0.0):SetAppearance(3); -- NPC: #Vahlara`s_Remains
  -- Valtron's remains
  eq.spawn2(298019, 0, 0, 494, -494, -6.125, 312):SetAppearance(3); -- NPC: #Valtron`s_Remains

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

