function event_clickdoor(e)
	local door_id = e.door:GetDoorID();
	-- if the door to the stonemites is clicked aggro the monoliths guarding it. 
	if (door_id == 41) then
		-- get all the npcs 
		local npc_list = eq.get_entity_list():GetNPCList();
		-- make sure we actually have a list, would on be nil if a GM used #depopzone
		if (npc_list ~= nil) then
			-- loop through the list entries
			for npc in npc_list.entries do
				-- check for the npcid of a_clay_monolith (296069)
				if (npc:GetNPCTypeID() == 296069) then
					-- set aggro on person who clicked
					npc:AddToHateList(e.self,1);
				end
			end
		end
	elseif (door_id == 42) then
		-- open door 43 also
		entity_list:FindDoor(43):ForceOpen(e.self);
	elseif (door_id == 43) then
		-- open door 42 also
		entity_list:FindDoor(42):ForceOpen(e.self);
	end
end
