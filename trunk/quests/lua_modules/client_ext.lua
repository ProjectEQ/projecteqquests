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