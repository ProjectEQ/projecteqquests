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
local lockout_bit;
local instance_id = 0;
local qglobals = {};
local charid_list;
local current_bit = 0;
local entity_list;
local spawn_orb=false;
local instance_requests = require("instance_requests");
local Anguish_Lockouts = {};

function setup_lockouts()
	Anguish_Lockouts = {
		[317005] = {'Anguish_keldovan', 1,   Spawn_keldovan},
		[317004] = {'Anguish_jelvan',   2,   Spawn_jelvan},
		[317003] = {'Anguish_ture',     4,   Spawn_ture},
		[317002] = {'Anguish_hanvar',   8,   Spawn_hanvar},
		[317107] = {'Anguish_amv',      16,  PH_amv},
		[317109] = {'Anguish_omm',      32,  Spawn_omm},
		[1]		 = {'Anguish_lower_orb',64,  PH_lorb},
		[2]		 = {'Anguish_upper_orb',128, PH_uorb},
		[3]		 = {'Anguish_augs'	   ,256, PH_augs}
	};
end

function event_spawn(e)
  qglobals = eq.get_qglobals();
  instance_id = eq.get_zone_instance_id();
  charid_list = eq.get_characters_in_instance(instance_id);
  entity_list = eq.get_entity_list();
  lockout_bit = tonumber(qglobals[instance_id .. "_anguish_bit"]);
  if (lockout_bit == nil) then lockout_bit = 0 end
  setup_lockouts();
  eq.debug("Lockout Bit: " ..  lockout_bit);
  for k,v in pairs(Anguish_Lockouts) do
    if (bit.band(lockout_bit, v[2]) == 0 and v[3] ~= nil ) then
      v[3]();
    end
  end

end

function Spawn_keldovan()
	eq.unique_spawn(317005,0,0, -301 ,702, -201, 128); -- NPC: Keldovan_the_Harrier
end

function Spawn_jelvan()
	eq.unique_spawn(317004,0,0, -256 ,2100, -121, 0); -- NPC: Jelvan
end

function Spawn_ture()
	eq.unique_spawn(317003,0,0, 610, 3381, -12, 260); -- NPC: Ture
end

function Spawn_hanvar()
	eq.unique_spawn(317002,0,0, 424, 4389, 222, 128); -- NPC: Warden_Hanvar
end

function PH_amv()	
end

function Spawn_omm()
--always spawn AMV if OMM is up.  AMV only drops chest on the first kill
	eq.unique_spawn(317107,0,0, 366, 4886, 278, 0); -- NPC: Arch_Magus_Vangl
	eq.unique_spawn(317109,0,0, 507, 4969, 296.5, 254); -- NPC: Overlord_Mata_Muram
end

function PH_lorb()
end
function PH_uorb()
end
function PH_augs()
end

function Check_lorb(lockout_name)
	qglobals = eq.get_qglobals()
	spawn_orb=false;
	current_bit = tonumber(qglobals[instance_id.."_anguish_bit"]);
	--if lower orb bit(64) is not set
	if (bit.band(current_bit,64)==0) then
		--if keldovan (1) and jelvan(2) dead spawn orb 
		if (bit.band(current_bit,1)==1 and bit.band(current_bit,2)==2) then
			spawn_orb=true
		--if only keldovan or jelvan are dead, 50% chance to spawn orb
		--elseif (math.random(1,2)==1) then
		--	spawn_orb=true
		end
		
		if(spawn_orb==true) then
			AddLockout(Anguish_Lockouts[1]);
			
			if lockout_name =="Anguish_keldovan" then
				eq.spawn2(317087,0,0, -301 ,702, -201, 0); -- NPC: Orb_of_Discordant_Energy
			elseif lockout_name == "Anguish_jelvan" then
				eq.get_entity_list():GetNPCByNPCTypeID(317111):AddItem(47100,1); -- NPC: a_minor_scarab
			end	
			eq.debug("Check_lorb: Spawn Lower Orb");
		else
			eq.debug("Check_lorb: No Lower Orb");
		end
	end
end

function Check_uorb(lockout_name)
	qglobals = eq.get_qglobals()
	--eq.debug("checking urb"):
	spawn_orb=false;
	current_bit = tonumber(qglobals[instance_id.."_anguish_bit"]);
	--eq.zone_emote(13,"in uorb bit: " .. bit.band(current_bit,128));
	--if upper orb bit(128) is not set
	if (bit.band(current_bit,128)==0) then
		--eq.debug("urb bit not set: ".. current_bit .. " :  bitand: " .. bit.band(current_bit,128)):
		--if ture (4) and hanvar(8) dead spawn orb 
		if (bit.band(current_bit,4)==4 and bit.band(current_bit,8)==8) then
			spawn_orb=true
		--if only ture or hanvar are dead, 50% chance to spawn orb
		--elseif (math.random(1,2)==1) then
		--	spawn_orb=true
		end
		
		if(spawn_orb==true) then
			AddLockout(Anguish_Lockouts[2]);
			
			if lockout_name =="Anguish_ture" then
				eq.spawn2(317087,0,0, 610, 3381, -12, 0); -- NPC: Orb_of_Discordant_Energy
			elseif lockout_name == "Anguish_hanvar" then
				eq.spawn2(317087,0,0, 478, 4390, 209, 0); -- NPC: Orb_of_Discordant_Energy
			end				
			eq.debug("Check_uorb: Spawn Upper Orb");
		else
			eq.debug("Check_uorb: No Upper Orb");
		end
	end
end

function Check_amv_chest()
	qglobals = eq.get_qglobals()
--spawn ornate chest only if amv lockout is not already set
--do not set AMV lockout if it already exists
	current_bit = tonumber(qglobals[instance_id.."_anguish_bit"]);
	if (bit.band(current_bit,16)==0) then
		eq.set_global(instance_id.."_anguish_bit",tostring(bit.bor(current_bit,16)),7,"H6"); 
		for k,v in pairs(charid_list) do
			eq.target_global('Anguish_amv', tostring(instance_requests.GetLockoutEndTimeForHours(108)), "H108", 0,v, 0);
		end
		eq.unique_spawn(317112,0,0, 366, 4886, 278, 0); --Ornate_Chest
		eq.debug("Check_amv_chest: Spawn Chest");
	else
		eq.debug("Check_amv_chest: No Chest");
	end	
end

function Spawn_augs()
	local rolled_mob;
	local num_mob=0;
	local mob_list = {};
	local num_to_spawn;
	local mob_in_list=false;
	
	--#a_lightning_warrior_commander (317076) is placeholder
  list_named = {
	[1] = { 317094, 'Grenlok_the_Converter', 4, 1638, -204, 256},
	[2] = { 317105, 'Vilria_the_Keeper', 204, 703, -202, 384},
	[3] = { 317106, 'Damlin_Lingering_Charge', 355, 3815, 141, 384},
	[4] = { 317078, 'First_Lieutenant_Minas', 345, 4642, 209.4, 256},
	[5] = { 317077, 'Administrator_Charial', 20.75, 3811.7, 143, 128}
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

	eq.debug("Aug Named to spawn: " .. num_to_spawn);
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
	
	local grid;
	for i = 1, 5 do
		mob_in_list=false
		for k,v in pairs(mob_list) do
			if v==list_named[i][1] then
				mob_in_list=true;
			end
		end
		
		if i==4 then grid=16 else grid=0 end
		
		if mob_in_list then
			--eq.zone_emote(15,"spawn: " .. list_named[i][1] .. " ," .. list_named[i][3] .. " ," .. list_named[i][4] .. " ," .. list_named[i][5] .. " ," ..list_named[i][6]); 
		    eq.spawn2(list_named[i][1],grid,0,list_named[i][3],list_named[i][4],list_named[i][5],list_named[i][6]);		  
		 else
			eq.spawn2(317076,grid,0,list_named[i][3],list_named[i][4],list_named[i][5],list_named[i][6]); -- NPC: #a_lightning_warrior_commander
		end;		
	end
end

function AddLockout(lockout)
	qglobals = eq.get_qglobals()
	local lockout_name = lockout[1]; 
	local lockout_bit = lockout[2];
	local lockout_duration;
	local lockout_end_time;
	if (lockout_name=="Anguish_augs") then
		lockout_duration="H2";
		lockout_end_time=tostring(instance_requests.GetLockoutEndTimeForHours(2));
	else
		lockout_duration="H108";
		lockout_end_time=tostring(instance_requests.GetLockoutEndTimeForHours(108));
	end	
	--you cant blanket assign a lockout to AMV
	if (lockout_name=="Anguish_amv") then	
		Check_amv_chest();
	else		
		current_bit = tonumber(qglobals[instance_id.."_anguish_bit"]);
		--if (lockout_bit == nil) then lockout_bit = 0 end
		--if (current_bit ~= nil and current_bit > 0 and bit.bor(current_bit,lockout_bit)==0) then
		eq.set_global(instance_id.."_anguish_bit",tostring(bit.bor(current_bit,lockout_bit)),7,"H6"); 

		for k,v in pairs(charid_list) do
			eq.target_global(lockout_name, lockout_end_time, lockout_duration, 0,v, 0);
		end

		--wait til after lockouts set to spawn in case of crash, etc
		if (lockout_name=="Anguish_augs") then
			Spawn_augs();
		elseif (lockout_name=="Anguish_keldovan" or lockout_name=="Anguish_jelvan") then
			Check_lorb(lockout_name);
		elseif (lockout_name=="Anguish_ture" or lockout_name=="Anguish_hanvar") then
			Check_uorb(lockout_name);			
		end
		--end
	end
end

function event_signal(e)
  eq.debug("signal: " .. e.signal);
  if ( Anguish_Lockouts[e.signal] ~= nil ) then  	
    AddLockout(Anguish_Lockouts[e.signal]);
  end
end

