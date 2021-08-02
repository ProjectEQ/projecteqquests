--a_Stillmoon_warlord (338413)
-- a_Stillmoon_goblin (338412)
--a_Stillmoon_goblin (338415)
--a_Stillmoon_goblin (338416)
--a_Stillmoon_goblin (338417)
--#Osashi (338403)
--an_Ancient_Stillmoon_Guardian (338414)
local addsdead = 0;
local failure = 0;
local event_started = 0;

function Hail_Osashi(e)
if(e.message:findi("hail")) then
		e.self:Say("You have come at the goblins' behest? Very well. Perseverance is important to all, regardless of what you seek, be it wealth, knowledge, or power. This trial will show me just how committed you are to obtain your desires. When you being this trial, several goblins will wait near the gong and attempt to ring it after one minute. Do not let this happen and you shall prove yourself in this trial. Are you [ready] to begin?");
elseif(e.message:findi("ready")) then
		if (event_started == 0) then
			event_started = 1;
			eq.unique_spawn(338412, 0, 0, -23, 50, -30, 128);
			eq.unique_spawn(338415, 0, 0, -9, 32, -30, 2);
    			eq.unique_spawn(338416, 0, 0, 8, 50, -30, 385);
    			eq.unique_spawn(338417, 0, 0, -8, 67, -30, 257);
    			eq.depop();
		end
	end
end

function Goblin_Spawn(e)
  eq.set_timer("ringbellone", 20000); --20 sec
end

function Goblin_Timer(e)
if (e.timer == "ringbellone") then
    e.self:Emote("gets ready to ring the bell...");
    eq.stop_timer("ringbellone");
    eq.set_timer("ringbelltwo", 20000); --20 sec
elseif (e.timer == "ringbelltwo") then
    eq.stop_timer("ringbelltwo");
    e.self:Emote("rings the bell...");
    failure = 1;
    eq.unique_spawn(338414, 0, 0, -9, 83, -30, 257);
 end
 end

function Goblin_Combat(e)
  if (e.joined == true) then
    eq.stop_timer("ringbellone");
    eq.stop_timer("ringbelltwo");
  else
    eq.set_timer("ringbellone", 20000); --20 sec
  end
end

function Goblin_Death1(e)
  addsdead = addsdead +1;
  if ( addsdead == 8 and failure == 0) then
    eq.unique_spawn(338413, 0, 0, -9, 83, -30, 257);
  end
  if (addsdead < 8 and failure == 0 ) then
    eq.spawn2(338412, 0, 0, -23, 50, -30, 128);
  end
end

function Goblin_Death2(e)
  addsdead = addsdead +1;
  if ( addsdead == 8 and failure == 0) then
    eq.unique_spawn(338413, 0, 0, -9, 83, -30, 257);
  end
  if (addsdead < 8 and failure == 0 ) then
    eq.spawn2(338415, 0, 0, -9, 32, -30, 2);
  end
end

function Goblin_Death3(e)
  addsdead = addsdead +1;
  if ( addsdead == 8 and failure == 0) then
    eq.unique_spawn(338413, 0, 0, -9, 83, -30, 257);
  end
  if (addsdead < 8 and failure == 0 ) then
    eq.spawn2(338416, 0, 0, 8, 50, -30, 385);
  end
end

function Goblin_Death4(e)
  addsdead = addsdead +1;
  if ( addsdead == 8 and failure == 0) then
    eq.unique_spawn(338413, 0, 0, -9, 83, -30, 257);
  end
  if (addsdead < 8 and failure == 0 ) then
    eq.spawn2(338417, 0, 0, -8, 67, -30, 257);
  end
end

function event_encounter_load(e)
  eq.register_npc_event('perseverance', Event.death_complete, 338412, Goblin_Death1);
  eq.register_npc_event('perseverance', Event.combat,         338412, Goblin_Combat);
  eq.register_npc_event('perseverance', Event.timer,          338412, Goblin_Timer);
  eq.register_npc_event('perseverance', Event.spawn,          338412, Goblin_Spawn);
  eq.register_npc_event('perseverance', Event.death_complete, 338415, Goblin_Death2);
  eq.register_npc_event('perseverance', Event.combat,         338415, Goblin_Combat);
  eq.register_npc_event('perseverance', Event.timer,          338415, Goblin_Timer);
  eq.register_npc_event('perseverance', Event.spawn,          338415, Goblin_Spawn);
  eq.register_npc_event('perseverance', Event.death_complete, 338416, Goblin_Death3);
  eq.register_npc_event('perseverance', Event.combat,         338416, Goblin_Combat);
  eq.register_npc_event('perseverance', Event.timer,          338416, Goblin_Timer);
  eq.register_npc_event('perseverance', Event.spawn,          338416, Goblin_Spawn);
  eq.register_npc_event('perseverance', Event.death_complete, 338417, Goblin_Death4);
  eq.register_npc_event('perseverance', Event.combat,         338417, Goblin_Combat);
  eq.register_npc_event('perseverance', Event.timer,          338417, Goblin_Timer);
  eq.register_npc_event('perseverance', Event.spawn,          338417, Goblin_Spawn);
  
  eq.register_npc_event('perseverance', Event.say,          338403, Hail_Osashi);
end

-- do adds stop spawning after warlod spawns?
