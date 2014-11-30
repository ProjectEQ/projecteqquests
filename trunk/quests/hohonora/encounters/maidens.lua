--[[
--	Halls of Honor - Maidens Trial 
--	NPCs involved:
--
--	Room 1:
--	211060 Alekson_Garn
--	211076 A_Custodian_of_Marr_
--	211077 #a_norrathian_maiden
--	211080 a_crazed_norrathian
--	211085 #Advocent_Joran
--
--	Room 2: 
--	211078 #a_norrathian_maiden_
--	211082 #_a_crazed_norrathian
--	211084 #Halgoz_Rellinic
--
--	Room 3: 
--	211079 #_a_norathian_maiden
--	211083 a_crazed_norrathian_
--	211086 #Freegan_Haan
--
--	202368 A_Planar_Projection
--
--]]
local counter = 0;
local roomonemaid = 0;
local roomtwomaid = 0;
local roomthrmaid = 0;
local roomonetrash = 0;
local roomtwotrash = 0;
local roomthrtrash = 0;
local	boss = 0;

function CustodianDeath(e)
	roomonemaid = 0;
	roomtwomaid = 0;
	roomthrmaid = 0;
	roomonetrash = 0;
	roomtwotrash = 0;
	roomthrtrash = 0;
	boss = 0;

	--Maidens--
	--ROOM 1
	eq.spawn2(211077,0,0,-2468,-1725,-113,65);
	eq.spawn2(211077,0,0,-2485,-1719,-113,0);
	eq.spawn2(211077,0,0,-2485,-1739,-113,128);

	--ROOM 2
	eq.spawn2(211078,0,0,-3190,-1725,-113,65);
	eq.spawn2(211078,0,0,-3172,-1740,-113,128);
	eq.spawn2(211078,0,0,-3172,-1705,-113,0);

	--ROOM 3
	eq.spawn2(211079,0,0,-3172,-1097,-113,0);
	eq.spawn2(211079,0,0,-3201,-1130,-113,192);
	eq.spawn2(211079,0,0,-3151,-1129,-113,65);

	--MOBS--
	--ROOM 1 TRASH
	eq.spawn2(211080,0,0,-2400,-1600,-113,160);
	eq.spawn2(211080,0,0,-2400,-1870,-113,231);
	eq.spawn2(211080,0,0,-2582,-1872,-113,20.6);
	eq.spawn2(211080,0,0,-2588,-1727,-113,231);
	eq.spawn2(211080,0,0,-2588,-1600,-113,20.6);

	--ROOM 2 TRASH
	eq.spawn2(211082,0,0,-3318,-1841,-113,13);
	eq.spawn2(211082,0,0,-3319,-1725,-113,65);
	eq.spawn2(211082,0,0,-3299,-1621,-113,20.6);
	eq.spawn2(211082,0,0,-3034,-1636,-113,173);
	eq.spawn2(211082,0,0,-3034,-1816,-113,316);

	--ROOM 3 TRASH
	eq.spawn2(211083,0,0,-3293,-1027,-113,86);
	eq.spawn2(211083,0,0,-3027,-1035,-113,65);
	eq.spawn2(211083,0,0,-3035,-1229,-113,217);
	eq.spawn2(211083,0,0,-3303,-1229,-113,173);
	eq.spawn2(211083,0,0,-3168,-1028,-113,316);

end

function RoomOneTrashDeath(e)
	roomonetrash = roomonetrash + 1;
	if ( roomonetrash == 5 and roomonemaid < 3 ) then 
		eq.spawn2(211085,0,0,-2349,-1894,-113,233);
	end
end

function RoomTwoTrashDeath(e)
	roomtwotrash = roomtwotrash + 1;
	if ( roomtwotrash == 5 and roomtwomaid < 3 ) then
		eq.spawn2(211084,0,0,-3337,-1617,-113,76.2);
	end
end

function RoomThreeTrashDeath(e)
	roomthrtrash = roomthrtrash + 1;
	if ( roomthrtrash == 5 and roomthrmaid < 3 ) then
		eq.spawn2(211086,0,0,-2996,-991,-113,153);
	end
end

function RoomOneMaidenDeath(e)
	roomonemaid = roomonemaid + 1;
	-- If all the maidens in the room have died; the event has failed
	if ( roomonemaid == 3 ) then
		FailEvent();
	end
end

function RoomTwoMaidenDeath(e)
	roomtwomaid = roomtwomaid + 1;
	-- If all the maidens in the room have died; the event has failed
	if ( roomtwomaid == 3 ) then
		FailEvent();
	end
end

function RoomThreeMaidenDeath(e)
	roomthrmaid = roomthrmaid + 1;
	-- If all the maidens in the room have died; the event has failed
	if ( roomthrmaid == 3 ) then
		FailEvent();
	end
end

function BossDeath(e)
	boss = boss + 1;
	if ( boss == 3 ) then
		eq.update_spawn_timer(44032,25920000000); --Alekson Garn 3 days on win
		eq.spawn2(202368,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading() );
		DespawnEventMobs();
	end
end

function FailEvent()
	eq.update_spawn_timer(44032,86400000000); --Alekson Garn 24 hours on fail
	DespawnEventMobs();
end

function TimerSpawn(e)
	eq.set_timer('maidens', 7200000);
end

function MaidensTimer(e)
	if ( e.timer == 'maidens' ) then 
		FailEvent();
	end
end

function DespawnEventMobs()
	eq.depop_all(211060);
	eq.depop_all(211077);
	eq.depop_all(211078);
	eq.depop_all(211079);
	eq.depop_all(211080);
	eq.depop_all(211082);
	eq.depop_all(211083);
	eq.depop_all(211084);
	eq.depop_all(211085);
	eq.depop_all(211086);
end

function AleksonSay(e)
	if (e.message:findi("hail")) then 
		e.self:Say("Weakling! How dare you approach me. Access to Lord Marrs temple is reserved only for the honorable! You will never be [ready]...");
	elseif (e.message:findi("ready")) then
		e.self:Say("Be warned, " .. e.other:GetName() .. ". If you believe you are ready, you will fail, even if you can kill Lord Marr's servants!");
		eq.spawn2(211076, 0, 0, (e.self:GetX() - 50), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- A_Custodian_of_Marr_
		eq.depop_with_timer();
	end
end

function event_encounter_load(e)
	-- register our NPC event hooks
	eq.register_npc_event("maidens", Event.say,            211060, AleksonSay);
	eq.register_npc_event("maidens", Event.death_complete, 211076, CustodianDeath);

	-- Hook a timer to each of the mobs which could end up lingering around with 
	-- this event.  Custodian and the Named in each room; if they are up for 
	-- 2hours; the event will despawn itself.  The timers are discarded when 
	-- each mob dies;  So when the Custodian dies his timer is discarded for the 
	-- purpose of the Event there will be 2hours once the first named spawns till 
	-- the Event cleans itself up.
	eq.register_npc_event("maidens", Event.spawn,			 211076, SpawnTimer);
	eq.register_npc_event("maidens", Event.timer,          211076, MaidensTimer);
	eq.register_npc_event("maidens", Event.spawn,			 211084, SpawnTimer);
	eq.register_npc_event("maidens", Event.timer,          211084, MaidensTimer);
	eq.register_npc_event("maidens", Event.spawn,			 211085, SpawnTimer);
	eq.register_npc_event("maidens", Event.timer,          211085, MaidensTimer);
	eq.register_npc_event("maidens", Event.spawn,			 211086, SpawnTimer);
	eq.register_npc_event("maidens", Event.timer,          211086, MaidensTimer);

	eq.register_npc_event("maidens", Event.death_complete, 211080, RoomOneTrashDeath);
	eq.register_npc_event("maidens", Event.death_complete, 211082, RoomTwoTrashDeath);
	eq.register_npc_event("maidens", Event.death_complete, 211083, RoomThreeTrashDeath);
	eq.register_npc_event("maidens", Event.death_complete, 211077, RoomOneMaidenDeath);
	eq.register_npc_event("maidens", Event.death_complete, 211078, RoomTwoMaidenDeath);
	eq.register_npc_event("maidens", Event.death_complete, 211079, RoomThreeMaidenDeath);
	eq.register_npc_event("maidens", Event.death_complete, 211084, BossDeath);
	eq.register_npc_event("maidens", Event.death_complete, 211085, BossDeath);
	eq.register_npc_event("maidens", Event.death_complete, 211086, BossDeath);
end

function event_encounter_unload(e)
	DespawnEventMobs();
end
