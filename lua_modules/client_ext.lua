function Client:Faction(faction_id, faction_value, temp)
	temp = temp or 0;
	self:SetFactionLevel2(self:CharacterID(), faction_id, self:GetClass(), self:GetBaseRace(), self:GetDeity(), faction_value, temp);
end

function Client:GiveCash(copper, silver, gold, platinum)
	copper = copper or 0;
	silver = silver or 0;
	gold = gold or 0;
	platinum = platinum or 0;
	
	if(copper == 0 and silver == 0 and gold == 0 and platinum == 0) then
		return;
	end
	
	self:AddMoneyToPP(copper, silver, gold, platinum, true);
	
	local tmp = "You receive ";
	local first = true;
	if(platinum > 0) then
		tmp = tmp .. tostring(platinum) .. " platinum";
		first = false;
	end
	
	if(gold > 0) then
		if(first) then
			first = false;
		else
			tmp = tmp .. ", ";
		end
	
		tmp = tmp .. tostring(gold) .. " gold";
	end
	
	if(silver > 0) then
		if(first) then
			first = false;
		else
			tmp = tmp .. ", ";
		end
	
		tmp = tmp .. tostring(silver) .. " silver";
	end
	
	if(copper > 0) then
		if(first) then
			first = false;
		else
			tmp = tmp .. ", ";
		end
	
		tmp = tmp .. tostring(copper) .. " copper";
	end
	
	tmp = tmp .. " pieces.";
	
	self:Message(260, tmp);
end

function Client:Ding()
	self:SendSound();
end

function Client:GetFaction(npc)
	return self:GetFactionLevel(self:CharacterID(), npc:GetID(), self:GetRace(), self:GetClass(), self:GetDeity(), npc:GetPrimaryFaction(), npc);
end

function Client:Class()
	local class = self:GetClass();
	
	do
		local c = {
		 [1] = "Warrior",
		 [2] = "Cleric",
		 [3] = "Paladin",
		 [4] = "Ranger",
		 [5] = "Shadow Knight",
		 [6] = "Druid",
		 [7] = "Monk",
		 [8] = "Bard",
		 [9] = "Rogue",
		 [10] = "Shaman",
		 [11] = "Necromancer",
		 [12] = "Wizard",
		 [13] = "Magician",
		 [14] = "Enchanter",
		 [15] = "Beastlord",
		 [16] = "Berserker"
		 }

	return c[class];
	end
end

function Client:Race()
	local race = self:GetRace();
	
	do
		local r = {
		 [1] = "Human",
		 [2] = "Barbarian",
		 [3] = "Erudite",
		 [4] = "Wood Elf",
		 [5] = "High Elf",
		 [6] = "Dark Elf",
		 [7] = "Half Elf",
		 [8] = "Dwarf",
		 [9] = "Troll",
		 [10] = "Ogre",
		 [11] = "Halfling",
		 [12] = "Gnome",
		 [14] = "Werewolf",
		 [74] = "Froglok",
		 [75] = "Elemental",
		 [108] = "Eye of Zomm",
		 [120] = "Wolf Elemental",
		 [128] = "Iksar",
		 [130] = "Vah Shir",
		 [161] = "Iksar Skeleton",
		 [330] = "Froglok",
		 [367] = "Skeleton",
		 [522] = "Drakkin",
		 ['?'] = "Unknown"
		 }

	return r[race];
	end
end

function Client:HasItem(itemid, trade)
	-- trade because ahh people sometimes
	trade = trade or nil
	if (trade ~= nil) then
		-- shallow copy
		local trade_copy = {};
		for k, v in pairs(trade) do
			trade_copy[k] = v;
		end

		for i = 1, 4 do
			local key = "item" .. i;
			if (trade_copy[key] ~= nil and trade_copy[key].valid) then
				for a = Slot.AugSocketBegin, Slot.AugSocketEnd, 1 do
					local thisaugitem = self:GetAugmentIDAt(i,a);
					if(thisaugitem == itemid) then
						return true;
					end
				end
				if(trade_copy[key]:GetID() == itemid) then
					return true;
				end
			end
		end
	end

	--possessions
	for i = Slot.PossessionsBegin, Slot.PossessionsEnd, 1 do
		local thisitem = self:GetItemIDAt(i);
		for a = Slot.AugSocketBegin, Slot.AugSocketEnd, 1 do
			local thisaugitem = self:GetAugmentIDAt(i,a);
			if(thisaugitem == itemid) then
				return true;
			end
		end
		if(thisitem == itemid) then
			return true;
		end
	end
	
	--general and cursor containers
	for i = Slot.GeneralBagsBegin, Slot.CursorBagEnd, 1 do
		local thisitem = self:GetItemIDAt(i);
		for a = Slot.AugSocketBegin, Slot.AugSocketEnd, 1 do
			local thisaugitem = self:GetAugmentIDAt(i,a);
			if(thisaugitem == itemid) then
				return true;
			end
		end
		if(thisitem == itemid) then
			return true;
		end
	end

	--bank
	for i = Slot.BankBegin, Slot.BankEnd, 1 do
		local thisitem = self:GetItemIDAt(i);
		for a = Slot.AugSocketBegin, Slot.AugSocketEnd, 1 do
			local thisaugitem = self:GetAugmentIDAt(i,a);
			if(thisaugitem == itemid) then
				return true;
			end
		end
		if(thisitem == itemid) then
			return true;
		end
	end

	--bank containers
	for i = Slot.BankBagsBegin, Slot.BankBagsEnd, 1 do
		local thisitem = self:GetItemIDAt(i);
		for a = Slot.AugSocketBegin, Slot.AugSocketEnd, 1 do
			local thisaugitem = self:GetAugmentIDAt(i,a);
			if(thisaugitem == itemid) then
				return true;
			end
		end
		if(thisitem == itemid) then
			return true;
		end
	end
	
	--shared bank
	for i = Slot.SharedBankBegin, Slot.SharedBankEnd, 1 do
		local thisitem = self:GetItemIDAt(i);
		for a = Slot.AugSocketBegin, Slot.AugSocketEnd, 1 do
			local thisaugitem = self:GetAugmentIDAt(i,a);
			if(thisaugitem == itemid) then
				return true;
			end
		end
		if(thisitem == itemid) then
			return true;
		end
	end
	
	--shared bank containers
	for i = Slot.SharedBankBagsBegin, Slot.SharedBankBagsEnd, 1 do
		local thisitem = self:GetItemIDAt(i);
		for a = Slot.AugSocketBegin, Slot.AugSocketEnd, 1 do
			local thisaugitem = self:GetAugmentIDAt(i,a);
			if(thisaugitem == itemid) then
				return true;
			end
		end
		if(thisitem == itemid) then
			return true;
		end
	end

	--corpse
	local bodycount = self:GetCorpseCount();
	
	if(bodycount > 0) then
		for b = 0, bodycount, 1 do
			local bodyid = self:GetCorpseID(b); 
			for i = Slot.PossessionsBegin, Slot.PossessionsEnd, 1 do
				local thisitem = self:GetCorpseItemAt(bodyid, i);
				if(thisitem == itemid) then
					return true;
				end
			end
			for i = Slot.GeneralBagsBegin, Slot.CursorBagEnd, 1 do
				local thisitem = self:GetCorpseItemAt(bodyid, i);
				if(thisitem == itemid) then
					return true;
				end
			end
		end
	end
	return false;
end

function Client:ForeachHateList(func, cond)
	cond = cond or function(ent, hate, damage, frenzy) return true end;
	local lst = self:GetHateList();
	for ent in lst.entries do
		local cv = cond(ent.ent, ent.hate, ent.damage, ent.frenzy);
		if(cv) then
			func(ent.ent, ent.hate, ent.damage, ent.frenzy);
		end
	end
end

function Client:CountHateList(cond)
	cond = cond or function(ent, hate, damage, frenzy) return true end;
	local lst = self:GetHateList();
	local ret = 0;
	for ent in lst.entries do
		local cv = cond(ent.ent, ent.hate, ent.damage, ent.frenzy);
		if(cv) then
			ret = ret + 1;
		end
	end
	
	return ret;
end

function Client:GetGroupMemberCount()
	-- group member count with support for raid groups
	local raid = self:GetRaid()
	local group = self:GetGroup()
	if group.valid then
		return group:GroupCount()
	elseif raid.valid and raid:GetGroup(self) ~= -1 then
		return raid:GroupCount(raid:GetGroup(self))
	end
	return 0
end

function Client:DoesAnyPartyMemberHaveLockout(expedition_name, event_name, max_member_check)
	max_member_check = max_member_check or 0
	if self:GetRaid().valid then
		return self:GetRaid():DoesAnyMemberHaveExpeditionLockout(expedition_name, event_name, max_member_check)
	elseif self:GetGroup().valid then
		return self:GetGroup():DoesAnyMemberHaveExpeditionLockout(expedition_name, event_name, max_member_check)
	end
	return self:HasExpeditionLockout(expedition_name, event_name)
end

function Client:GetRaidMemberCountInZone()
	local count = 0
	local raid = self:GetRaid()
	if raid.valid then
		for i=0,raid:RaidCount() - 1 do
			if raid:GetMember(i).valid then
				count = count + 1
			end
		end
	end
	return count
end
