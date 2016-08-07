function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if( (qglobals["Fatestealer_shak"] == "1" or e.other:HasItem(52355) == true or e.other:HasItem(52356) == true) and e.message:findi("blue orb")) then
		e.other:SummonItem(9822); 
	end
end