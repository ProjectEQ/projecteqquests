function EntityList:Foreach(func, cond, lst)
	for ent in lst.entries do
		local cv = cond(ent);
		if(cv) then
			func(ent);
		end
	end
end

function EntityList:ForeachMob(func, cond)
	cond = cond or function(ent) return true end;
	local lst = self:GetMobList();
	self:Foreach(func, cond, lst);
end

function EntityList:ForeachClient(func, cond)
	cond = cond or function(ent) return true end;
	local lst = self:GetClientList();
	self:Foreach(func, cond, lst);
end

function EntityList:ForeachNPC(func, cond)
	cond = cond or function(ent) return true end;
	local lst = self:GetNPCList();
	self:Foreach(func, cond, lst);
end

function EntityList:ForeachCorpse(func, cond)
	cond = cond or function(ent) return true end;
	local lst = self:GetCorpseList();
	self:Foreach(func, cond, lst);
end

function EntityList:ForeachObject(func, cond)
	cond = cond or function(ent) return true end;
	local lst = self:GetObjectList();
	self:Foreach(func, cond, lst);
end

function EntityList:ForeachDoor(func, cond)
	cond = cond or function(ent) return true end;
	local lst = self:GetDoorsList();
	self:Foreach(func, cond, lst);
end

function EntityList:ForeachSpawn(func, cond)
	cond = cond or function(ent) return true end;
	local lst = self:GetSpawnList();
	self:Foreach(func, cond, lst);
end

function EntityList:Count(cond, lst)
	local ret = 0;
	for ent in lst.entries do
		local cv = cond(ent);
		if(cv) then
			ret = ret + 1;
		end
	end
	
	return ret;
end

function EntityList:CountMob(cond)
	cond = cond or function(ent) return true end;
	local lst = self:GetMobList();
	return self:Count(cond, lst);
end

function EntityList:CountClient(cond)
	cond = cond or function(ent) return true end;
	local lst = self:GetClientList();
	return self:Count(cond, lst);
end

function EntityList:CountNPC(cond)
	cond = cond or function(ent) return true end;
	local lst = self:GetNPCList();
	return self:Count(cond, lst);
end

function EntityList:CountCorpse(cond)
	cond = cond or function(ent) return true end;
	local lst = self:GetCorpseList();
	return self:Count(cond, lst);
end

function EntityList:CountObject(cond)
	cond = cond or function(ent) return true end;
	local lst = self:GetObjectList();
	return self:Count(cond, lst);
end

function EntityList:CountDoor(cond)
	cond = cond or function(ent) return true end;
	local lst = self:GetDoorsList();
	return self:Count(cond, lst);
end

function EntityList:CountSpawn(cond)
	cond = cond or function(ent) return true end;
	local lst = self:GetSpawnList();
	return self:Count(cond, lst);
end
