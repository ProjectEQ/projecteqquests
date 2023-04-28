function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	local can_get_key = (qglobals.ink_final == nil and not e.other:HasItem(60253));

	if e.message:findi("Hail") and can_get_key then
		e.other:Message(MT.Yellow,"The sentinel nods solemnly and reaches toward you with a closed palm. His clenched fist opens and an unusual splinter of stone falls into your possession.");
		e.other:SummonItem(60253);	-- Item: Splinter of the High Temple
		eq.set_global("ink_final","1",0,"F");
	end
end
