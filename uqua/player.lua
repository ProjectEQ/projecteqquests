local gas_1_range = {-293, -263, -769, -718}
local gas_2_range = {-886, -850, -801, -750}
local player_minimum = 6;

function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self); 
	local instance_id = eq.get_zone_instance_id();

	if qglobals[instance_id.. '_spectre_door'] ~= nil then
		eq.get_entity_list():FindDoor(4):SetLockPick(0);
	end

	if qglobals[instance_id.. '_destoff'] == nil then
		auracast(e);
		eq.set_timer("aura", 90 * 1000); -- 90 sec
	end
end

function auracast(e)	
	local qglobals = eq.get_qglobals(e.self); 
	local instance_id = eq.get_zone_instance_id();

	local rangeditem	= (e.self:GetItemIDAt(Slot.Range) == 67736 or e.self:GetItemIDAt(Slot.Range) == 67737 or e.self:GetItemIDAt(Slot.Range) == 67738 or e.self:GetItemIDAt(Slot.Range) == 67739);
	local secondaryitem	= (e.self:GetItemIDAt(Slot.Secondary) == 67736 or e.self:GetItemIDAt(Slot.Secondary) == 67737 or e.self:GetItemIDAt(Slot.Secondary) == 67738 or e.self:GetItemIDAt(Slot.Secondary) == 67739);
	local hasbuff		= e.self:FindBuff(756);

	if qglobals[instance_id.. '_destper'] ~= nil then
		eq.SelfCast(5051);
	elseif rangeditem or secondaryitem or hasbuff then
		e.self:Message(MT.White, "Tendrils of murky shadow creep toward you but the trinket you carry seems to hold them at bay.");
	else
		eq.SelfCast(5051);
	end
end

function event_timer(e)
	local qglobals = eq.get_qglobals(e.self); 
	local instance_id = eq.get_zone_instance_id();

	if qglobals[instance_id.. '_destoff'] == nil then
		auracast(e);
	else
		eq.stop_timer("aura");
	end
end

function event_click_door(e)	
	local door = e.door:GetDoorID();
	local dz = eq.get_expedition()
	local qglobals = eq.get_qglobals(e.self); 
	local instance_id = eq.get_zone_instance_id();

	-- Keys: | Cracked = 67707 | Dusty = 67708 | Polished = 67709 | Jagged = 67710 |
	if door == 9 then
		local cursor_check = e.self:GetItemIDAt(Slot.Cursor)
		local keycheck = tonumber(qglobals[instance_id.. '_gaschmb1']) or 999999
		local is_complete = qglobals[instance_id.. '_gaschmb1complete'] ~= nil
		local is_gm = (e.self:Admin() > 80)
		local player_list = eq.get_entity_list():GetClientList();
		local count = 0;

		if player_list ~= nil then
			for pc in player_list.entries do
				if pc:GetX() >= gas_1_range[1] and pc:GetX() <= gas_1_range[2] and pc:GetY() >= gas_1_range[3] and pc:GetY() <= gas_1_range[4] and not pc:GetGM() then
					count = count + 1;
				end
			end
		end

		if is_complete then
			eq.get_entity_list():FindDoor(9):SetLockPick(0);
			eq.get_entity_list():FindDoor(9):ForceOpen(e.self);
		elseif count >= player_minimum or is_gm then
			if keycheck == 67707 and e.self:HasItem(67707) then -- Cracked Key
				if e.self:HasItem(67708) or e.self:HasItem(67709) or e.self:HasItem(67710) then -- Fail
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. There is an audible clank from the north and south as both doors seal shut. The small chamber begins to heat up dramatically.");
					eq.signal(292051,1); -- Gas Chamber 1
				else -- Win
					eq.get_entity_list():FindDoor(9):SetLockPick(0);
					eq.get_entity_list():FindDoor(9):ForceOpen(e.self);
					eq.set_global(instance_id.."_gaschmb1complete","1",3,"H6");
					eq.signal(292051,2); -- Gas Chamber 1
					eq.signal(292080,1); -- #Gas_Chamber_Cheater
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. With the help of your companions, you heave at the stone slab and it slides away.  Oddly, you realize that once the majority of your forces have crossed the threshold of the door, stragglers will be able to pass through safely without needing a key.");
				end
			elseif keycheck == 67708 and e.self:HasItem(67708) then -- Dusty Key
				if e.self:HasItem(67707) or e.self:HasItem(67709) or e.self:HasItem(67710) then -- Fail
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. There is an audible clank from the north and south as both doors seal shut. The small chamber begins to heat up dramatically.");
					eq.signal(292051,1); -- Gas Chamber 1
				else -- Win
					eq.get_entity_list():FindDoor(9):SetLockPick(0);
					eq.get_entity_list():FindDoor(9):ForceOpen(e.self);
					eq.set_global(instance_id.."_gaschmb1complete","1",3,"H6");
					eq.signal(292051,2); -- Gas Chamber 1
					eq.signal(292080,1); -- #Gas_Chamber_Cheater
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. With the help of your companions, you heave at the stone slab and it slides away.  Oddly, you realize that once the majority of your forces have crossed the threshold of the door, stragglers will be able to pass through safely without needing a key.");
				end
			elseif keycheck == 67709 and e.self:HasItem(67709) then -- Polished Key
				if e.self:HasItem(67708) or e.self:HasItem(67707) or e.self:HasItem(67710) then -- Fail
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. There is an audible clank from the north and south as both doors seal shut. The small chamber begins to heat up dramatically.");
					eq.signal(292051,1); -- Gas Chamber 1
				else -- Win
					eq.get_entity_list():FindDoor(9):SetLockPick(0);
					eq.get_entity_list():FindDoor(9):ForceOpen(e.self);
					eq.set_global(instance_id.."_gaschmb1complete","1",3,"H6");
					eq.signal(292051,2); -- Gas Chamber 1
					eq.signal(292080,1); -- #Gas_Chamber_Cheater
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. With the help of your companions, you heave at the stone slab and it slides away.  Oddly, you realize that once the majority of your forces have crossed the threshold of the door, stragglers will be able to pass through safely without needing a key.");
				end
			elseif keycheck == 67710 and e.self:HasItem(67710) then -- Jagged Key
				if e.self:HasItem(67708) or e.self:HasItem(67709) or e.self:HasItem(67707) then -- Fail
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. There is an audible clank from the north and south as both doors seal shut. The small chamber begins to heat up dramatically.");
					eq.signal(292051,1); -- Gas Chamber 1
				else -- Win
					eq.get_entity_list():FindDoor(9):SetLockPick(0);
					eq.get_entity_list():FindDoor(9):ForceOpen(e.self);
					eq.set_global(instance_id.."_gaschmb1complete","1",3,"H6");
					eq.signal(292051,2); -- Gas Chamber 1
					eq.signal(292080,1); -- #Gas_Chamber_Cheater
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. With the help of your companions, you heave at the stone slab and it slides away.  Oddly, you realize that once the majority of your forces have crossed the threshold of the door, stragglers will be able to pass through safely without needing a key.");
				end
			else -- Fail
				eq.signal(292051,1); -- Gas Chamber 1
			end
		else
			eq.zone_emote(MT.Yellow,"You heave at the stone slab, but it does not budge. Without more people to assist you it will be impossible to open.");
		end
	elseif door == 12 then
		local cursor_check = e.self:GetItemIDAt(Slot.Cursor)
		local keycheck = tonumber(qglobals[instance_id.. '_gaschmb2']) or 999999
		local is_complete = qglobals[instance_id.. '_gaschmb2complete'] ~= nil
		local is_gm = (e.self:Admin() > 80)
		local player_list = eq.get_entity_list():GetClientList();
		local count = 0;

		if player_list ~= nil then
			for pc in player_list.entries do
				if pc:GetX() >= gas_2_range[1] and pc:GetX() <= gas_2_range[2] and pc:GetY() >= gas_2_range[3] and pc:GetY() <= gas_2_range[4] and not pc:GetGM() then
					count = count + 1;
				end
			end
		end

		if is_complete then
			eq.get_entity_list():FindDoor(12):SetLockPick(0);
			eq.get_entity_list():FindDoor(12):ForceOpen(e.self);
		elseif count >= player_minimum or is_gm then
			if keycheck == 67707 and e.self:HasItem(67707) then -- Cracked Key
				if e.self:HasItem(67708) or e.self:HasItem(67709) or e.self:HasItem(67710) then -- Fail
					eq.signal(292052,1); -- Gas Chamber 2
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. There is an audible clank from the north and south as both doors seal shut. The small chamber begins to heat up dramatically.");
				else -- Win
					eq.get_entity_list():FindDoor(12):SetLockPick(0);
					eq.get_entity_list():FindDoor(12):ForceOpen(e.self);
					eq.set_global(instance_id.."_gaschmb2complete","1",3,"H6");
					eq.signal(292052,2); -- Gas Chamber 2
					eq.signal(292081,1); -- #Gas_Chamber_Cheater_2
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. With the help of your companions, you heave at the stone slab and it slides away.  Oddly, you realize that once the majority of your forces have crossed the threshold of the door, stragglers will be able to pass through safely without needing a key.");
				end
			elseif keycheck == 67708 and e.self:HasItem(67708) then -- Dusty Key
				if e.self:HasItem(67707) or e.self:HasItem(67709) or e.self:HasItem(67710) then -- Fail
					eq.signal(292052,1); -- Gas Chamber 2
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. There is an audible clank from the north and south as both doors seal shut. The small chamber begins to heat up dramatically.");
				else -- Win
					eq.get_entity_list():FindDoor(12):SetLockPick(0);
					eq.get_entity_list():FindDoor(12):ForceOpen(e.self);
					eq.set_global(instance_id.."_gaschmb2complete","1",3,"H6");
					eq.signal(292052,2); -- Gas Chamber 2
					eq.signal(292081,1); -- #Gas_Chamber_Cheater_2
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. With the help of your companions, you heave at the stone slab and it slides away.  Oddly, you realize that once the majority of your forces have crossed the threshold of the door, stragglers will be able to pass through safely without needing a key.");
				end
			elseif keycheck == 67709 and e.self:HasItem(67709) then -- Polished Key
				if e.self:HasItem(67708) or e.self:HasItem(67707) or e.self:HasItem(67710) then -- Fail
					eq.signal(292052,1); -- Gas Chamber 2
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. There is an audible clank from the north and south as both doors seal shut. The small chamber begins to heat up dramatically.");
				else -- Win
					eq.get_entity_list():FindDoor(12):SetLockPick(0);
					eq.get_entity_list():FindDoor(12):ForceOpen(e.self);
					eq.set_global(instance_id.."_gaschmb2complete","1",3,"H6");
					eq.signal(292052,2); -- Gas Chamber 2
					eq.signal(292081,1); -- #Gas_Chamber_Cheater_2
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. With the help of your companions, you heave at the stone slab and it slides away.  Oddly, you realize that once the majority of your forces have crossed the threshold of the door, stragglers will be able to pass through safely without needing a key.");
				end
			elseif keycheck == 67710 and e.self:HasItem(67710) then -- Jagged Key
				if e.self:HasItem(67708) or e.self:HasItem(67709) or e.self:HasItem(67707) then -- Fail
					eq.signal(292052,1); -- Gas Chamber 2
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. There is an audible clank from the north and south as both doors seal shut. The small chamber begins to heat up dramatically.");
				else -- Win
					eq.get_entity_list():FindDoor(12):SetLockPick(0);
					eq.get_entity_list():FindDoor(12):ForceOpen(e.self);
					eq.set_global(instance_id.."_gaschmb2complete","1",3,"H6");
					eq.signal(292052,2); -- Gas Chamber 2
					eq.signal(292081,1); -- #Gas_Chamber_Cheater_2
					e.self:Message(MT.Red,"You locate a recession on the slab which closely matches the unusual key in your possession. It's a perfect fit. You insert the key into place and rotate it slightly. With the help of your companions, you heave at the stone slab and it slides away.  Oddly, you realize that once the majority of your forces have crossed the threshold of the door, stragglers will be able to pass through safely without needing a key.");
				end
			else -- Fail
				eq.signal(292052,1); -- Gas Chamber 2
			end
		else
			eq.zone_emote(MT.Yellow,"You heave at the stone slab, but it does not budge. Without more people to assist you it will be impossible to open.");
		end
	elseif door == 4 then
		if qglobals[instance_id.. '_spectre_door'] ~= nil then
			if dz.valid and not dz:IsLocked() then
				dz:SetLocked(true); -- Lock DZ so no additional people can join.
				eq.zone_emote(MT.Yellow, "Your expedition is nearing its close. You cannot bring any additional people into your expedition at this time.");
			end
		end
	elseif door == 3 then
		if qglobals[instance_id.. '_uquaragedoor'] ~=nil and qglobals[instance_id.. '_uquaragedoor'] == '1' then
			eq.get_entity_list():FindDoor(3):ForceOpen(e.self);
		end
	elseif door == 2 then
		if qglobals[instance_id.. '_uquafurydoor'] ~=nil and qglobals[instance_id.. '_uquafurydoor'] == '1' then
			eq.get_entity_list():FindDoor(2):ForceOpen(e.self);
		end
	end
end
