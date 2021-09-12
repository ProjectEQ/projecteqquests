function event_spawn(e)
	eq.set_timer("depop", 600 * 1000); --need confirmation
end

function event_say(e)
local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
		if qglobals["bic_fer"] ~= nil and qglobals["bic_fer"] == "10" then
			e.other:Message(4, "You feel a chill surround your body as a voice enters your mind. 'Thank you for releasing me from an eternity of suffering. Now you must help the others on this continent whose fate I fear is much worse than mine. You must seek out Apprentice Udranda in Barindu. She can help you gain access to the temples beyond the mountain passes.");
			e.other:SummonItem(67526); -- Item: Rondo's Report
			eq.set_global("bic_fer", "11", 5, "F");
		end
		eq.set_global("god_vxed_access", "1", 5, "F");
		e.other:Message(4, "You receive a character flag!");
	end
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop();
	end
end
