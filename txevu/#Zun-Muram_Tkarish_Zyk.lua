-- Zun`Muram Tkarish Zyk NPCID 297150

local banished_pc = nil
local add_timer = 30000

function event_spawn(e)
	banished_pc = nil
	add_timer = 30000
	spawn_event()
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("banishHateTop", eq.ChooseRandom(30,120) * 1000) -- between 30 sec and 2 minute random banish timer
		eq.set_timer("spawn_add", add_timer)
		-- Wanton Destruction, scripted AE
		eq.set_timer("wanton",15000)
		eq.set_timer("OOBcheck", 3000)
		eq.stop_timer("fail_check")
		eq.set_timer("aggrolink", 3 * 1000)
	else
		-- wipe or tether
		eq.stop_timer("banishHateTop")
		eq.stop_timer("spawn_add")
		eq.stop_timer("wanton")
		eq.signal(297147, 297150) -- Tell Ritualists I lost agro
		banished_pc = 0
		eq.stop_timer("OOBcheck")
		eq.set_timer("fail_check", 20 * 60 * 1000) --20 min reset
		eq.stop_timer("aggrolink");
	end
end

function event_timer(e)
	if (e.timer == "ghost_check") then
		if (banished_pc ~= nil) then
			if (banished_pc:GetX() >= 1410 and banished_pc:GetX() <= 1501 and banished_pc:GetY() >= 178 and banished_pc:GetY() <= 237) then
				-- Spawn north jail ghosts, a_vengeful_apparition
				banished_pc:Message(7,"Angered by your presence here, apparitions step through the nearby walls.  A bone chilling cold fills the room as they reach for your throat.")
				eq.spawn2(297152,0,0,1500, 180, -328, 396)
				eq.spawn2(297152,0,0,1500, 234, -328, 308)
				eq.spawn2(297152,0,0,1469, 236, -328, 260)
				eq.spawn2(297152,0,0,1449, 235, -328, 236)
				eq.spawn2(297152,0,0,1413, 234, -328, 200)	
				eq.spawn2(297152,0,0,1412, 207, -328, 138)
			elseif (banished_pc:GetX() >= 1410 and banished_pc:GetX() <= 1501 and banished_pc:GetY() >= -237 and banished_pc:GetY() <= -178) then
				-- Spawn south jail ghosts, a_vengeful_apparition
				banished_pc:Message(7,"Angered by your presence here, apparitions step through the nearby walls.  A bone chilling cold fills the room as they reach for your throat.")
				eq.spawn2(297152,0,0,1500, -180, -328, 396)
				eq.spawn2(297152,0,0,1500, -234, -328, 460)
				eq.spawn2(297152,0,0,1469, -236, -328, 510)
				eq.spawn2(297152,0,0,1449, -235, -328, 510)
				eq.spawn2(297152,0,0,1413, -234, -328, 72)	
				eq.spawn2(297152,0,0,1412, -207, -328, 134)
			end
		end
		eq.stop_timer("ghost_check")
	elseif (e.timer == "banishHateTop") then
		banished_pc = e.self:GetHateTop()
		if (banished_pc ~= nil) then
			banished_pc:Message(7,"Zun`Muram Tkarish Zyk tells you, 'I grow tired of your insolence.  Rot in your new home!'")
			e.self:SetHate(banished_pc,1,1)
			-- Randomly north or south jail
			if (banished_pc:IsClient()) then
				local banished_pc_v = banished_pc:CastToClient()
				if (banished_pc_v.valid) then
					local rand = math.random(1,2);
					if (rand == 1) then
						banished_pc_v:MovePC(297, 1475, 205, -327, 255) --north jail
						eq.spawn2(297076,0,0, 1475, 205, -327, 0)
						--spawn north jailer npc a_jailer (297076)
					elseif (rand == 2) then
						banished_pc_v:MovePC(297, 1475, -205, -327, 0) --south jail
						eq.spawn2(297075,0,0, 1475, -205, -327, 0)
						--spawn south jailer npc a_jailer (297075)
					end
				end
			end
			-- If they don't open the door and get out within 20 seconds, the ghosts spawn2
			--eq.set_timer("ghost_check", 20000)

		end
	elseif (e.timer == "spawn_add") then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(297147)) then
			-- Ritualist adds - slow down as there are less Ritualists
			local which_add = eq.ChooseRandom(297159, 297161, 297161, 297222, 297222, 297223, 297223)
			local which_loc = eq.ChooseRandom(1,2,3,4)
			if (which_loc == 1) then
				eq.spawn2(which_add,0,0,1330, 0, -304, 128):AddToHateList(e.self:GetHateTop(),1)
			elseif (which_loc == 2) then eq.spawn2(which_add,0,0,1305, 27, -304, 0):AddToHateList(e.self:GetHateTop(),1) elseif (which_loc == 3) then
				eq.spawn2(which_add,0,0,1305, -27, -304, 256):AddToHateList(e.self:GetHateTop(),1)
			elseif (which_loc == 4) then
				eq.spawn2(which_add,0,0,1276, 0, -304, 384):AddToHateList(e.self:GetHateTop(),1)
			end
			eq.set_timer("spawn_add", add_timer)
		else
			--all Ikaav Ritualists are dead
			eq.stop_timer("spawn_add")
		end

	elseif (e.timer == "fail_check") then
		-- respawn the whole event
		eq.depop_all(297147)
		eq.depop_all(297148)
		eq.depop_all(297149)
		eq.depop_all(297159)
		eq.depop_all(297161)
		eq.depop_all(297222)
		eq.depop_all(297223)
		add_timer = 30000
		banished_pc = nil
		--init_engage = false
		eq.stop_all_timers()
		--eq.spawn2(297150,0,0,1506,2,-285,374) -- myself, which also will trigger Spawn_Event()
		--eq.depop()
		spawn_event()
	elseif (e.timer == "wanton") then
		e.self:CastSpell(1250,e.self:GetID())
		eq.set_timer("wanton", eq.ChooseRandom(100,120) * 1000)
	elseif(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() < 1215 or e.self:GetY() > 106 or e.self:GetY() < -106) then
				e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 3 * 1000);
			end
	elseif (e.timer == "aggrolink") then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 297148 or npc:GetNPCTypeID() == 297149 or npc:GetNPCTypeID() == 297147)) then
			npc:AddToHateList(e.self:GetHateRandom(),1); -- add ritualists and inquisitor goats to aggro list if alive
		end
		end
	end
end

function event_signal(e)
	-- signal is from Ritualists when they die - slow down add spawns
	add_timer = add_timer + 30000
end

function spawn_event()
	-- 4 Ikaav Ritualist and the two Inquisitor goats.
	eq.spawn2(297147,0,0,1353, 0, -305, 384)
	eq.spawn2(297147,0,0,1305, 45, -305, 256)
	eq.spawn2(297147,0,0,1305, -45, -305, 0)
	eq.spawn2(297147,0,0,1260, 0, -305, 128)
	eq.spawn2(297148,0,0,1528, 30, -285, 384)
	eq.spawn2(297149,0,0,1528, -30, -285, 384)
end

