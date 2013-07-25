function event_enter_zone(e)
	-- load the current qglobals
	local qglobals = eq.get_qglobals(e.self);
	if (qglobals.potimeb_lockout == nil or qglobals.potimeb_lockout == "Phase1") then
		-- set global for phase 1 player lockout to 12 hours on zone in.
		eq.set_global("potimeb_lockout","Phase1",5,"H12");
	end
end

function event_click_door(e)
	-- load the current qglobals
	local qglobals = eq.get_qglobals(e.self);
	-- drop the door information into some local variable
	local door_id = e.door:GetDoorID();
	local entity_list = eq.get_entity_list();
	local lock_pick = entity_list:FindDoor(door_id):GetLockPick();
	if (lock_pick == 0 and door_id <= 45) then
		-- Phase 1 fire doors
		if (door_id >= 5 and door_id <= 8) then
			-- if one of the door pieces is clicked, open all of them.
			OpenDoors(e,entity_list,door_id,5,8);
		-- Phase 1 earth doors
		elseif (door_id >= 9 and door_id <= 12) then
			-- if one of the door pieces is clicked, open all of them.
			OpenDoors(e,entity_list,door_id,9,12);
		-- Phase 1 air doors
		elseif (door_id >= 1 and door_id <= 4) then
			-- if one of the door pieces is clicked, open all of them.
			OpenDoors(e,entity_list,door_id,1,4);
		-- Phase 1 water doors
		elseif (door_id >= 25 and door_id <= 28) then
			-- if one of the door pieces is clicked, open all of them.
			OpenDoors(e,entity_list,door_id,25,28);
		-- Phase 1 undead doors
		elseif (door_id >= 29 and door_id <= 32) then
			-- if one of the door pieces is clicked, open all of them.
			OpenDoors(e,entity_list,door_id,29,32);
		-- Phase 2 undead doors
		elseif (door_id >= 33 and door_id <= 36) then
			-- if one of the door pieces is clicked, open all of them.
			OpenDoors(e,entity_list,door_id,33,36);
		-- Phase 2 earth/air doors
		elseif (door_id >= 38 and door_id <= 41) then
			-- if one of the door pieces is clicked, open all of them.
			OpenDoors(e,entity_list,door_id,38,41);
		-- Phase 2 water/fire doors
		elseif (door_id >= 42 and door_id <= 45) then
			-- if one of the door pieces is clicked, open all of them.
			OpenDoors(e,entity_list,door_id,42,45);
		end
	-- this is a simple hack to show on the lockout global what we did last.
	-- all that really matters is that the lockout is set for 5.5 days.
	-- the different values are not used at this time.
	elseif (lock_pick == 0 and door_id == 62) then
		-- update player lockout to phase 3
		eq.set_global("potimeb_lockout","Phase3",5,"H132");
	elseif (lock_pick == 0 and door_id == 83) then
		-- update player lockout to phase 4
		eq.set_global("potimeb_lockout","Phase4",5,"H132");
	elseif (lock_pick == 0 and door_id == 51) then
		-- update player lockout to phase 5
		eq.set_global("potimeb_lockout","Phase5",5,"H132");
	end
end

function OpenDoors(e, entity_list, door_id, first_id, last_id)
	for i = first_id, last_id, 1 do
		-- the server handles the door actually clicked by the player.
		-- if we do not exclude it, then it does not get opened.
		if (door_id ~= i) then
			entity_list:FindDoor(i):ForceOpen(e.self);
		end
	end
end
