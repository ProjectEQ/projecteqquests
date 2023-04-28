function event_click_door(e)
	local door_id = e.door:GetDoorID();
	local entity_list = eq.get_entity_list();
	-- if the door to the stonemites is clicked aggro the monoliths guarding it. 
	if door_id == 41 then
		-- get all the npcs 
		e.self:Message(MT.Red,"When you click the stone slab it slides away.");
		local npc_list = eq.get_entity_list():GetNPCList();
		-- make sure we actually have a list, would on be nil if a GM used #depopzone
		if npc_list ~= nil then
			-- loop through the list entries
			for npc in npc_list.entries do
				-- check for the npcid of a_clay_monolith (296069)
				if npc:GetNPCTypeID() == 296069 and not e.self:GetGM() then
					-- set aggro on person who clicked
					e.self:Message(MT.Red,"The door mechanism awakens the guardians standing nearby! They stumble forth to attack, dried flakes of clay raining from their ancient bodies.");
					npc:SetSpecialAbility(24, 0);
					npc:SetSpecialAbility(35, 0);
					npc:AddToHateList(e.self,1);
				end
			end
		end
	elseif door_id == 42 then
		-- open door 43 also		
		if entity_list:FindDoor(42):GetLockPick() == 0 then
			entity_list:FindDoor(43):ForceOpen(e.self);
			eq.signal(296075,5); -- NPC: #noqufiel_trigger
			e.self:Message(MT.DimGray,"You heave at the stone doors with all your might!  They shudder and give way.");		
		else
			if e.self:GetY() > -800 then -- Inside of Door
				noq_door_safe = true;
				entity_list:FindDoor(43):ForceOpen(e.self);
				entity_list:FindDoor(42):ForceOpen(e.self);
				eq.set_timer("door", 10 * 1000); -- Arm Door
			elseif noq_door_safe then -- Outside and Door is safe
				entity_list:FindDoor(43):ForceOpen(e.self);
				entity_list:FindDoor(42):ForceOpen(e.self);
			else -- Outside Door
				if math.random(100) > 80 then -- 20% chance to open door
					e.self:Message(MT.DimGray,"You heave at the stone doors with all your might but they do not budge.");
					e.self:Message(MT.Red,"The stone is scalding hot!");		
					e.self:CastSpell(2315,e.self:GetID()); --searing heat 2315
				else
					e.self:Message(MT.DimGray,"You heave at the stone doors with all your might!  They shudder and give way.");
					e.self:Message(MT.Red,"The stone is scalding hot!");		
					e.self:CastSpell(2315,e.self:GetID()); --searing heat 2315
					entity_list:FindDoor(43):ForceOpen(e.self);
				end
			end
		end
	elseif door_id == 43 then
		-- open door 42 also
		if entity_list:FindDoor(43):GetLockPick() == 0 then
			entity_list:FindDoor(42):ForceOpen(e.self);
			eq.signal(296075,5); -- NPC: #noqufiel_trigger
			e.self:Message(MT.DimGray,"You heave at the stone doors with all your might!  They shudder and give way.");		
		else
			if e.self:GetY() > -800 then -- Inside of Door
				noq_door_safe = true;
				entity_list:FindDoor(43):ForceOpen(e.self);
				entity_list:FindDoor(42):ForceOpen(e.self);
				eq.set_timer("door", 10 * 1000); -- Arm Door
			elseif noq_door_safe then -- Outside and Door is safe
				entity_list:FindDoor(43):ForceOpen(e.self);
				entity_list:FindDoor(42):ForceOpen(e.self);
			else -- Outside Door
				if math.random(100) > 80 then -- 20% chance to open door
					e.self:Message(MT.DimGray,"You heave at the stone doors with all your might but they do not budge.");
					e.self:Message(MT.Red,"The stone is scalding hot!");		
					e.self:CastSpell(2315,e.self:GetID()); --searing heat 2315
				else
					e.self:Message(MT.DimGray,"You heave at the stone doors with all your might!  They shudder and give way.");
					e.self:Message(MT.Red,"The stone is scalding hot!");		
					e.self:CastSpell(2315,e.self:GetID()); --searing heat 2315
					entity_list:FindDoor(42):ForceOpen(e.self);
				end
			end
		end


	elseif door_id == 20 then
		-- mites door leading to stairs down, starts out locked before event is won		
		if entity_list:FindDoor(20):GetLockPick() == -1 then
			e.self:Message(MT.Red,"This way is closed"); --need live emote		
		else
			e.self:Message(MT.Red,"When you click the stone slab it slides away.");		
		end
	end
end

function event_timer(e)
	if e.timer == "door" then
		noq_door_safe = false;
	end
end
