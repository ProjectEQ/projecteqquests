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
