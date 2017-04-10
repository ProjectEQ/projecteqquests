function Mob:ForeachHateList(func, cond)
	cond = cond or function(ent, hate, damage, frenzy) return true end;
	local lst = self:GetHateList();
	for ent in lst.entries do
		local cv = cond(ent.ent, ent.hate, ent.damage, ent.frenzy);
		if(cv) then
			func(ent.ent, ent.hate, ent.damage, ent.frenzy);
		end
	end
end

function Mob:CountHateList(cond)
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

function Mob:CastedSpellFinished(spell_id, target) -- note, we do have a server side function (not exported) called this too ...
	self:SendBeginCast(spell_id, 0);
	self:SpellFinished(spell_id, target);
end

