function event_spawn(e)
	eq.spawn2(eq.ChooseRandom(296031,296032,296034),0,0,82,-468,-27,506);		-- NPC(s): a_shambling_exile (296031), a_blighted_exile (296032), a_dying_exile (296034)
	eq.spawn2(eq.ChooseRandom(296031,296032,296034),0,0,-21,-454,-27,252);		-- NPC(s): a_shambling_exile (296031), a_blighted_exile (296032), a_dying_exile (296034)
	eq.spawn2(eq.ChooseRandom(296031,296032,296034),0,0,38,-452,-27,390);		-- NPC(s): a_shambling_exile (296031), a_blighted_exile (296032), a_dying_exile (296034)
	eq.spawn2(eq.ChooseRandom(296031,296032,296034),0,0,118,-530,-27,76);		-- NPC(s): a_shambling_exile (296031), a_blighted_exile (296032), a_dying_exile (296034)
	eq.spawn2(eq.ChooseRandom(296031,296032,296034),0,0,38,-515,-27,162);		-- NPC(s): a_shambling_exile (296031), a_blighted_exile (296032), a_dying_exile (296034)
end

function event_aggro(e)
	e.self:Shout("What?! How in the name of Trushar did you get to this cursed place? From the smug look on your face I can only imagine you think you can destroy us . . . We are already doomed, knaves!");
end

function event_death_complete(e)
	eq.set_data("inktuta_status-"..eq.get_zone_instance_id(), "3",tostring(eq.seconds("6h")));
end
