function NPC:ForeachHateList(func, cond)
	cond = cond or function(ent, hate, damage, frenzy) return true end;
	local lst = self:GetHateList();
	for ent in lst.entries do
		local cv = cond(ent.ent, ent.hate, ent.damage, ent.frenzy);
		if(cv) then
			func(ent.ent, ent.hate, ent.damage, ent.frenzy);
		end
	end
end

function NPC:CountHateList(cond)
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

function NPC:RandomRoam(maxx,maxy,maxz,los)
	maxz = maxz or 15;
	los = los or 5;

	if(self:IsEngaged() ~= 1) then
		local curx = self:GetX();
		local cury = self:GetY();
		local origx = self:GetSpawnPointX();
		local origy = self:GetSpawnPointY();
		local origz = self:GetSpawnPointZ();
		local guardx = self:GetGuardPointX();
		local guardy = self:GetGuardPointY();

		if(curx == guardx and cury == guardy) then
			local randomx = math.random(maxx) + 1;
			local randomy = math.random(maxy) + 1;
			local posx = origx + randomx;
			local posy = origy + randomy;
			local negx = origx - randomx;
			local negy = origy - randomy;
			local newx = math.random(posx,negx);
			local newy = math.random(posy,negy);
			local newz = self:FindGroundZ(newx,newy, 5) + 1;

			if(newz > -999999 and origz > (newz - maxz + 1) and origz < (newz + maxz - 1)) then
				local loscheck = self:CheckLoSToLoc(newx, newy, newz, los);
				if(loscheck) then
					self:MoveTo(newx,newy,newz,-1,true);
				end
			end
		end
	end
end
			
			