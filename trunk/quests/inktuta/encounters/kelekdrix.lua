--[[
--	Kelekdrix raid event
--	NPCs involved:
--		#Kelekdrix,_Herald_of_Trushar (296024)
--		#Watcher_of_Kelekdrix (296025)
--		#Usher_of_Kelekdrix (296026)
--	http://everquest.allakhazam.com/db/quest.html?quest=4480 (Herald of Trushar section)
--]]
local counter = 0
local inst_id = 0
local kele = nil

function AddDeath(e)
	counter = counter - 1
	if (counter == 0) then
		kele:CastToNPC():ModifyNPCStat("special_attacks", "SQUMCNIDf") -- go active
	end
end

function AddSpawn(e)
	counter = counter + 1
	if (counter == 1) then -- add spawned, go inactive
		kele:CastToNPC():ModifyNPCStat("special_attacks", "ABfHG")
		kele:WipeHateList()
		eq.stop_timer("banish_top")
	end
end

function KeleCombat(e)
	if (e.joined) then
		eq.set_timer("banish_top", 45000)
	else
		eq.stop_timer("banish_top")
	end
end

function KeleTimer(e)
	-- we only have 1 timer, don't need to check the name
	local top_hate = kele:GetHateTop():CastToClient()
	if (top_hate.valid) then
		kele:Say("Begone " .. top_hate:GetName())
		kele:SetHate(top_hate, 1, 1)
		top_hate:MovePCInstance(296, inst_id, 210, -500, -26, 245)
	end
end

function KeleSpawn(e)
	kele = e.self
end

function event_encounter_load(e)
	inst_id = eq.get_zone_instance_id()
	counter = 0
	-- register our NPC event hooks
	eq.register_npc_event("usher_spawn", Event.spawn, 296026, AddSpawn)
	eq.register_npc_event("usher_death", Event.death_complete, 296026, AddDeath)
	eq.register_npc_event("watcher_spawn", Event.spawn, 296025, AddSpawn)
	eq.register_npc_event("watcher_death", Event.death_complete, 296025, AddDeath)
	eq.register_npc_event("kele_timer", Event.timer, 296024, KeleTimer)
	eq.register_npc_event("kele_combat", Event.combat, 296024, KeleCombat)
	eq.register_npc_event("kele_spawn", Event.spawn, 296024, KeleSpawn)
end

function event_encounter_unload(e)
	eq.get_entity_list():FindDoor(41):SetLockPick(0) -- unlock door
	eq.spawn2(296027, 0, 0, 90, -515, -27, 64) -- #Mimezpo_the_Oracle
	eq.set_global(inst_id .. "_inktuta_status", "2", 3, "H6")
	eq.spawn_condition("inktuta", inst_id, 1, 0) -- turn off Usher/Watcher spawns
	eq.depop_all(296025)
	eq.depop_all(296026)
	eq.signal(296070, 296024) -- setting lockout
end

