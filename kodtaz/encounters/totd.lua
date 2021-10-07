--Gates of Discord Progression #4b: Temple of the Damned  revamp by Huffin

--on live there is no flag requirement to trigger Temple of the Damned
--depop totd (293112) when event is spawned
--##Pixtt_Dire_Summoner (293153) no loot version

--check if npc is up to spawn loot version or placehold version
--The bone pile crumbles and alerts the nearby Muramites that rush to ambush you!
-- 293179 -1409, 683, -453, 385
-- 293177 -1423, 705, -453, 385
-- 293186 -1423, 611, -453, 385
-- 293187 -1409, 619, -453, 385
-- 45 min respawn on bone pile


function Bones_Death(e)
if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(293112) == true) then
--loot version is able to be spawned
eq.unique_spawn(293220,0,0,-1414,656,-453,385);-- # NPC: ##Pixtt_Priest_Summoner
eq.unique_spawn(293177,0,0,-1423, 705, -453,385);-- # NPC: Pixtt_Priest_Guardian
eq.unique_spawn(293179,0,0,-1409, 683, -453,385);-- # NPC: Pixtt_Priest_Guardian
eq.unique_spawn(293186,0,0,-1423, 611, -453,385);-- # NPC: Pixtt_Priest_Guardian
eq.unique_spawn(293187,0,0,-1409, 619, -453,385);-- # NPC: Pixtt_Priest_Guardian

else
--spawn no loot version
eq.unique_spawn(293153,0,0,-1414,656,-453,385);-- # NPC: ##Pixtt_Dire_Summoner
eq.unique_spawn(293177,0,0,-1423, 705, -453,385);-- # NPC: Pixtt_Priest_Guardian
eq.unique_spawn(293179,0,0,-1409, 683, -453,385);-- # NPC: Pixtt_Priest_Guardian
eq.unique_spawn(293186,0,0,-1423, 611, -453,385);-- # NPC: Pixtt_Priest_Guardian
eq.unique_spawn(293187,0,0,-1409, 619, -453,385);-- # NPC: Pixtt_Priest_Guardian
end
end

function Priest_Spawn(e)
--both versions will share this
eq.set_timer("depop", 15 * 60 * 1000); --15 min until event depops (needs confirmation)
end

function Priest_Timer(e)
if (e.timer == "depop") then
eq.stop_timer("depop");
eq.depop_all(293220);
eq.depop_all(293153);
eq.depop_all(293177);
eq.depop_all(293179);
eq.depop_all(293186);
eq.depop_all(293187);
end
end

function Priest_Combat(e)
if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function Priest_Signal(e)
e.self:SetSpecialAbility(35, 0); --turn off immunity
e.self:SetSpecialAbility(24, 0); --turn off anti aggro
end

function Priest_Death(e)
eq.depop_with_timer(293112); --need to confirm respawn (3day?)
--only loot dropping priest will force this npc to start its respawn cycle
end

function Trash_Death(e)
if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(293177) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(293179) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(293186) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(293187) == false) then
--all adds are dead, signal named to become active
eq.signal(293220,1);
eq.signal(293153,1);
end
end

function event_encounter_load(e)
eq.register_npc_event('totd', Event.spawn, 293220, Priest_Spawn);
eq.register_npc_event('totd', Event.timer, 293220, Priest_Timer);
eq.register_npc_event('totd', Event.combat, 293220, Priest_Combat);
eq.register_npc_event('totd', Event.signal, 293220, Priest_Signal);
eq.register_npc_event('totd', Event.death_complete, 293220, Priest_Death);

eq.register_npc_event('totd', Event.spawn, 293153, Priest_Spawn);
eq.register_npc_event('totd', Event.timer, 293153, Priest_Timer);
eq.register_npc_event('totd', Event.combat, 293153, Priest_Combat);
eq.register_npc_event('totd', Event.signal, 293153, Priest_Signal);
    
eq.register_npc_event('totd', Event.death_complete, 293210, Bones_Death);

eq.register_npc_event('totd', Event.death_complete, 293177, Trash_Death);
eq.register_npc_event('totd', Event.death_complete, 293179, Trash_Death);
eq.register_npc_event('totd', Event.death_complete, 293186, Trash_Death);
eq.register_npc_event('totd', Event.death_complete, 293187, Trash_Death);
end
