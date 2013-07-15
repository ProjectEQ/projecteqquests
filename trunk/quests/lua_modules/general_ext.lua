function eq.ChooseRandom(...)
	local tbl = {...};
	return tbl[math.random(#tbl)];
end

function eq.SelfCast(spell_id)
	local init = eq.get_initiator();
	local sp = Spell(spell_id);
	
	if(init.null or sp.null) then
		return;
	end
	
	init:SpellFinished(spell_id, init, 10, 0, -1, sp:ResistDiff());
end