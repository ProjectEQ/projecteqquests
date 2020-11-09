function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetCleanName() .. "! I patrol Halas to insure the safety of the travelers and the resident clans. Just ask if you need help in finding your destination.");
	elseif(e.message:findi("bank")) then
		e.self:Say("Follow me! I will lead you there.");
		eq.move_to(122, 193, 6, 213,false);
	elseif(e.message:findi("shaman guild")) then
		e.self:Say("Follow me! I will lead you there.");
		eq.move_to(332, 330, 4, 59,false);
	elseif(e.message:findi("warrior guild")) then
		e.self:Say("Follow me! I will lead you there.");
		eq.move_to(-422, 483, 4, 0,false);
	elseif(e.message:findi("rogue guild")) then
		e.self:Say("Follow me! I will lead you there.");
		eq.move_to(153, 273, 9, 64,false);
	elseif(e.message:findi("dock")) then
		e.self:Say("Follow me! I will lead you there.");
		eq.move_to(8, -17, 4, 128,false);
	end
end
