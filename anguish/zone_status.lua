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
	[1]		 = {'Anguish_lower_orb',64,  PH_lorb},
	[2]		 = {'Anguish_upper_orb',128, PH_uorb},
	[3]		 = {'Anguish_augs'	   ,256, PH_augs}
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

function PH_lorb()
end
function PH_uorb()
end
function PH_augs()
end

function Check_lorb()
end
function Check_uorb()
end

function Spawn_augs()
	local rolled_mob;
	local num_mob=0;
	local mob_list = {};
	local num_to_spawn;
	local mob_in_list=false;

--#a_lightning_warrior_commander (317076)
  list_named = {
    [1] = { 317094, 'Grenlok_the_Converter', 4, 1638, -204, 128},
    [2] = { 317105, 'Vilria_the_Keeper', 204, 703, -202, 195},
    [3] = { 317106, 'Damlin_Lingering_Charge', 355, 3815, 141, 193},
    [4] = { 317078, 'First_Lieutenant_Minas', 345, 4669, 215.4, 0},
    [5] = { 317077, 'Administrator_Charial', 20.75, 3811.7, 143, 64}
	};
	
	local diceroll=math.random(1,100);	
	if (diceroll<=20) then
		num_to_spawn=2;
	elseif (diceroll<=50) then
		num_to_spawn=3;
	elseif (diceroll<=80) then
		num_to_spawn=4;
	else
		num_to_spawn=5;
	end

	--eq.zone_emote(13,"num_to_spawn: " .. num_to_spawn);
	while( num_mob < num_to_spawn ) do
		rolled_mob=list_named[math.random(1,5)][1];	
		mob_in_list=false;		
		for k,v in pairs(mob_list) do
			if v==rolled_mob then
				mob_in_list=true;
			end
		end		
		if not mob_in_list then
			num_mob=num_mob+1;
			mob_list[num_mob]=rolled_mob;
		end
	end
	
	for i = 1, 5 do
		mob_in_list=false
		for k,v in pairs(mob_list) do
			if v==list_named[i][1] then
				mob_in_list=true;
			end
		end
		if mob_in_list then
			--eq.zone_emote(15,"spawn: " .. list_named[i][1] .. " ," .. list_named[i][3] .. " ," .. list_named[i][4] .. " ," .. list_named[i][5] .. " ," ..list_named[i][6]); 
		    eq.spawn2(list_named[i][1],0,0,list_named[i][3],list_named[i][4],list_named[i][5],list_named[i][6]);		  
		 else
			eq.spawn2(317076,0,0,list_named[i][3],list_named[i][4],list_named[i][5],list_named[i][6]);
		end;
	end
end

function AddLockout(lockout)
  local lockout_name = lockout[1]; 
  local lockout_bit = lockout[2];
  local lockout_duration;
  if (lockout_name=="Anguish_augs") then
	lockout_duration="H2";
  else
    lockout_duration="H108";
  end
  
  current_bit = tonumber(qglobals[instance_id.."_anguish_bit"]); 
  eq.set_global(instance_id.."_anguish_bit",tostring(bit.bor(current_bit,lockout_bit)),7,"H6"); 

  for k,v in pairs(charid_list) do
    eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(108)), lockout_duration, 0,v, 0);
  end

  --wait til after lockouts set to spawn in case of crash, etc
  if (lockout_name=="Anguish_augs") then
	Spawn_augs();
  elseif (lockout_name=="Anguish_keldovan" or lockout_name=="Anguish_jelvan") then
	Check_lorb();
  elseif (lockout_name=="Anguish_ture" or lockout_name=="Anguish_hanvar") then
    Check_uorb();
  end
end

function event_signal(e)
  if ( Anguish_Lockouts[e.signal] ~= nil ) then
    AddLockout( Anguish_Lockouts[e.signal] );
  end
end

