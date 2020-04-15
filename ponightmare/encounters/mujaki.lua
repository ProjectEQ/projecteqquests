--[[
port-in to -1939, -2114, 167.48

2 minutes in between each wave, 9 waves total

- 3 spawn locations of adds

1.) spawns @ -1851.48 -2663.94 172.75 path to -1596.72 -2608.13 173.13 then despawns and turns into untargettable a Servant of Mujaki if not engaged along the way (undead knight on horse #a_servant_of_Mujaki (204079))

2.) spawns @ -1462.50 -2977.26 172.69 path to -1463.40 -2682.61 173.13 then despawns and turns into untargettable a Servant of Mujaki if not engaged along the way

3.) spawns @ -1096.82 -2660.80 175.06 path to -1388.35 -2636.48 173.13 then despawns and turns into untargettable a Servant of Mujaki if not engaged along the way

adds spawn as either: 
a servant of mujaki - cons indiff 
a helot of mujaki (these seem to be more rare. 1 or less per wave) - cons indiff
a_helot_of_Mujaki (204078)
a_servant_of_Mujaki (204077)

wave 1 = 3
wave 2 = 3
wave 3 = 3
wave 4 = 6
wave 5 = 6
wave 6 = 6
wave 7 = 6
wave 8 = 3
wave 9 = mujaki + any adds that got by. adds turn from invulnv to KoS

(supposedly 36 mobs must die and / or reach stage to spawn Mujaki)
--]]

local adds_killed=0;
local wave=1;
local gotsignal = 0;


function Add_Spawn(e)
--eq.zone_emote(15, "in addspawn" .. e.self:GetX());
 if (e.self:GetX() < -1851 and e.self:GetX() > -1852) then
	e.self:MoveTo(-1596.72, -2608.13, 173.13, 0, true) 
 elseif (e.self:GetX()==-1462.5) then
	e.self:MoveTo(-1463.40, -2682.61 ,173.13, 0, true)
 elseif (e.self:GetX() < -1096 and e.self:GetX() > -1097) then
	e.self:MoveTo(-1388.35, -2636.48, 173.13, 0, true)
 end
 eq.set_timer('wparrive', 1 * 1000);
end

function Add_Timer(e)
 --eq.zone_emote(15, "in addtimer");
 if (e.timer=='wparrive') then
	 if DistanceToWaypoint(e.self) <= 10 then
		--eq.zone_emote(15, "depop");
		eq.spawn2(204079, 0, 0, -1475+40-math.random(1,80), -2555-20-math.random(1,40), 179.38, 256);
		eq.depop();
		eq.stop_timer('wparrive');
		
	 end
 end
end

function Add_Death(e)
 adds_killed=adds_killed+1;
end

function Shade_Spawn(e)
 eq.set_timer('depop', 900 * 1000);
end

function Shade_Timer(e)
 if (e.timer=='depop') then
	eq.depop();
	eq.signal(204039,2); -- NPC: Mujaki_the_Devourer
 end
end

--function Mujaki_Spawn(e)
--  eq.zone_emote(15, "muj spawn");
--  eq.set_proximity(e.self:GetX()-600, e.self:GetY()-600, e.self:GetX()+600, e.self:GetY()+600);
--end
function Mujaki2_Spawn(e)
   eq.set_timer('depop', 900 * 1000);
end

function Mujaki2_Timer(e)
 if (e.timer=='depop') then
	eq.depop_all(204079); --guardians
	eq.depop();	
	eq.signal(204039,2); -- NPC: Mujaki_the_Devourer
 end
end

--function Mujaki_Enter(e)
--	eq.zone_emote(15, "prox enter");
--  	eq.set_timer('spawnwave', 1 * 1000);
--	adds_killed=0;
--	wave=1;
--	eq.zone_emote(15, "got signal");
--	gotsignal=1;
--end

 --spawn shade if paladin global
function Mujaki_Death(e)
  eq.stop_all_timers();
  local clist = eq.get_entity_list():GetClientList();
     if ( clist ~= nil ) then
		 --eq.zone_emote(15, "death1");
		 for currclient in clist.entries do
			if(currclient:GetClass() ==3) then			
				 --eq.zone_emote(15, "death2");
				if (currclient:HasItem(69928)) then				
					--eq.zone_emote(15, "death3");
					eq.spawn2(204081, 0, 0, -1475, -2555, 179.38, 256); -- NPC: #Shade_of_Mujaki_the_Devourer
					return; --only spawn 1
				end
			end
		 end
	 end
end


function Mujaki_Signal(e)
  if (e.signal == 1 and gotsignal==0) then
	--event_started, 2 min timer til first wave
	eq.set_timer('spawnwave', 120 * 1000);
	adds_killed=0;
	wave=1;
	--eq.zone_emote(15, "got signal");
	gotsignal=1;
  elseif (e.signal ==2) then
    eq.depop_with_timer();
  end
end

function Serv_Signal(e)
  if (e.signal == 1) then
        e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
        e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
        e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
        e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
  end
end
  
function Mujaki_Timer(e)
	--eq.zone_emote(15, "in timer, wave: "..wave);
  if (e.timer=='spawnwave') then
	--event_started, 2 min timer til first wave
	if (wave <= 3 or wave==8 ) then
		eq.spawn2(eq.ChooseRandom( 204077, 204077, 204077, 204078 ), 0, 0, -1851.48, -2663.94, 172.75, 100);
		eq.spawn2(eq.ChooseRandom( 204077, 204077, 204077, 204078 ), 0, 0, -1462.50, -2977.26, 172.69, 0);
		eq.spawn2(eq.ChooseRandom( 204077, 204077, 204077, 204078 ), 0, 0, -1096.82, -2660.80, 175.06, 404);
	elseif (wave >=4 and wave <= 7) then
		eq.spawn2(eq.ChooseRandom( 204077, 204077, 204077, 204078 ), 0, 0, -1851.48, -2663.94, 172.75, 100);
		eq.spawn2(eq.ChooseRandom( 204077, 204077, 204077, 204078 ), 0, 0, -1462.50, -2977.26, 172.69, 0);
		eq.spawn2(eq.ChooseRandom( 204077, 204077, 204077, 204078 ), 0, 0, -1096.82, -2660.80, 175.06, 404);
		eq.spawn2(eq.ChooseRandom( 204077, 204077, 204077, 204078 ), 0, 0, -1851.48, -2663.94, 172.75, 100);
		eq.spawn2(eq.ChooseRandom( 204077, 204077, 204077, 204078 ), 0, 0, -1462.50, -2977.26, 172.69, 0);
		eq.spawn2(eq.ChooseRandom( 204077, 204077, 204077, 204078 ), 0, 0, -1096.82, -2660.80, 175.06, 404);	    
	elseif (wave==9) then
	--muj + unkilled
		eq.stop_all_timers();
		eq.spawn2(204080, 0, 0, -1475, -2555, 179.38, 256); -- NPC: #Mujaki_the_Devourer
		eq.signal(204079,1); -- NPC: #a_servant_of_Mujaki
	end
	wave=wave+1;
  end
end

function DistanceToWaypoint(self)
    return self:CalculateDistance(self:GetWaypointX(), self:GetWaypointY(), self:GetWaypointZ())
end

function event_encounter_load(e)

--main Mujaki_the_Devourer
  eq.register_npc_event('mujaki', Event.timer,          204039, Mujaki_Timer);
  eq.register_npc_event('mujaki', Event.signal,         204039, Mujaki_Signal);
  --eq.register_npc_event('mujaki', Event.spawn, 			204039, Mujaki_Spawn);
  --eq.register_npc_event('mujaki', Event.enter,          204039, Mujaki_Enter);
--spawned/fight #Mujaki_the_Devourer
  eq.register_npc_event('mujaki', Event.death_complete, 204080, Mujaki_Death);
  eq.register_npc_event('mujaki', Event.combat, 		204080, Mujaki2_Spawn);
  eq.register_npc_event('mujaki', Event.timer, 			204080, Mujaki2_Timer);  
  eq.register_npc_event('mujaki', Event.spawn, 			204081, Shade_Spawn);
  eq.register_npc_event('mujaki', Event.timer, 			204081, Shade_Timer);
-- add shade spawn if anyone in zone with pally epic global
  
  eq.register_npc_event('mujaki', Event.signal, 		204079, Serv_Signal);
  
  eq.register_npc_event('mujaki', Event.spawn, 			204077, Add_Spawn);
  eq.register_npc_event('mujaki', Event.spawn,			204078, Add_Spawn);
  eq.register_npc_event('mujaki', Event.death_complete, 204077, Add_Death);
  eq.register_npc_event('mujaki', Event.death_complete, 204078, Add_Death);
  eq.register_npc_event('mujaki', Event.timer, 			204077, Add_Timer);
  eq.register_npc_event('mujaki', Event.timer, 			204078, Add_Timer);

  
end

function event_encounter_unload(e)
end
