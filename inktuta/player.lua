function event_click_door(e)
	local door_id = e.door:GetDoorID();
	local entity_list = eq.get_entity_list();
	instance_id = eq.get_zone_instance_id();
	-- if the door to the stonemites is clicked aggro the monoliths guarding it. 
	if (door_id == 41) then
		-- get all the npcs 
		local npc_list = eq.get_entity_list():GetNPCList();
		-- make sure we actually have a list, would on be nil if a GM used #depopzone
		if (npc_list ~= nil) then
			-- loop through the list entries
			for npc in npc_list.entries do
				-- check for the npcid of a_clay_monolith (296069)
				if (npc:GetNPCTypeID() == 296069 and not e.self:GetGM()) then
					-- set aggro on person who clicked
					npc:AddToHateList(e.self,1);
				end
			end
		end
	elseif (door_id == 42) then
		-- open door 43 also		
		if (entity_list:FindDoor(42):GetLockPick() == 0) then
			entity_list:FindDoor(43):ForceOpen(e.self);
			eq.signal(296075,5); -- NPC: #noqufiel_trigger
			e.self:Message(1,"You heave at the stone doors with all your might!  They shudder and give way.");		
		else
			e.self:Message(1,"You heave at the stone doors with all your might but they do not budge.");
			e.self:Message(13,"The stone is scalding hot!");		
			e.self:CastSpell(2315,e.self:GetID()); --searing heat 2315
		end
	elseif (door_id == 43) then
		-- open door 42 also
		if (entity_list:FindDoor(43):GetLockPick() == 0) then
			entity_list:FindDoor(42):ForceOpen(e.self);
			eq.signal(296075,5); -- NPC: #noqufiel_trigger
			e.self:Message(1,"You heave at the stone doors with all your might!  They shudder and give way.");		
		else
			e.self:Message(1,"You heave at the stone doors with all your might but they do not budge.");
			e.self:Message(13,"The stone is scalding hot!");		
			e.self:CastSpell(2315,e.self:GetID()); --searing heat 2315
		end
	end
end
