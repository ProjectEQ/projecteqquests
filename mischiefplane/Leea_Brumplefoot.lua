function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if( qglobals["Fatestealer_shak"] == "1" and e.message:findi("blue orb")) then
		e.other:SummonItem(9822); 
	end
end