-- poeb player.lua
-- The first door between the east area and the middle area will not
-- open unless the east area is completely clear of mobs.

-- The second door after the middle area will not open until the middle
-- area is completely clear.

function event_click_door(e)
	-- populate the current entity list whenever someone clicks.
	local entity_list = eq.get_entity_list()
	local npc_list = entity_list:GetNPCList()
	local door_id = e.door:GetDoorID()
	-- booleans to see if any mobs are spawned in each section
	local mob_spawned_in_east = false
	local mob_spawned_in_middle = false

	--door is always initially locked until we decide otherwise
	e.door:SetLockPick(-1)

	--first door after zone in
	if (door_id == 2 or door_id == 3) then
		if (npc_list ~= nil) then
			-- Step through the entity list and see if any mobs that come from
			-- the east section are spawned.
			for npc in npc_list.entries do
				if (npc:GetNPCTypeID() >= 222000 and npc:GetNPCTypeID() <= 222999 and npc:GetSpawnPointX() < -130) then
					mob_spawned_in_east = true
					-- break out of for loop on first npc found
					break
				end
			end
      	end
      	-- if not, open the door
      	if (mob_spawned_in_east == false) then
      		-- Unlock
      		e.door:SetLockPick(0)
      		-- Open both at the same time
      		if (door_id == 3) then
				entity_list:FindDoor(2):ForceOpen(e.self)
			else
				entity_list:FindDoor(3):ForceOpen(e.self)
			end
		else
			-- Mobs are still up, door is locked
			e.self:Message(0, "As you attempt to move the wall of stone it is clear that it is being held in place by a powerful force")
		end

	--second door, on the way to TRC
	elseif (door_id == 4 or door_id == 5) then
		if (npc_list ~= nil) then
			-- Step through the entity list and see if any mobs that come from
			-- the middle section are spawned.
			for npc in npc_list.entries do
				-- Race 240 is Teleport Man, used for some of the event controllers that are always up.
	      		if (npc:GetSpawnPointX() > -130 and npc:GetSpawnPointX() < 450 and npc:GetRace() ~= 240 and npc:GetNPCTypeID() >= 222000 and npc:GetNPCTypeID() <= 222999) then
	      			mob_spawned_in_middle = true
	      			-- break out of for loop on first npc found
	      			break
	      		end
	      	end
	 	end
	 	-- if not, open the door
	 	if (mob_spawned_in_middle == false) then
	 		-- Unlock
	 		e.door:SetLockPick(0)
      		-- Open both at the same time
      		if (door_id == 5) then
	 			entity_list:FindDoor(4):ForceOpen(e.self)
	 		else
	 			entity_list:FindDoor(5):ForceOpen(e.self)
	 		end
	 	else
	 		-- Mobs are still up, door is locked
	 		e.self:Message(0, "The massive wall of rock, dirt and stone seems to be impenetrable. It is obviously held in place by a magical force")
	 	end
	end
end
