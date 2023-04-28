function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
	eq.zone_emote(MT.Yellow,"The stone tile beneath your feet shifts, setting a complex trap into motion. Amidst the muffled sounds of grinding gears and grating stone you notice the clay golems nearby are stirring. A chill runs down your spine as you realize what you've done. They stumble forth to attack, dried flakes of clay raining from their ancient bodies.");
	eq.signal(296050,1);	-- activate golems
	eq.spawn2(296079,0,0,-243.20,-911.59,-129.12,384); -- NPC: a_cursebearer
	eq.set_data("inktuta_status-"..eq.get_zone_instance_id(), "7",tostring(eq.seconds("6h")));
	eq.depop();
end
