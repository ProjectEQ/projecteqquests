function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
	eq.zone_emote(MT.Yellow,"The stone tile beneath your feet shifts, setting a complex trap into motion. Amidst the muffled sounds of grinding gears and grating stone you notice the clay golems nearby are stirring. A chill runs down your spine as you realize what you've done. They stumble forth to attack, dried flakes of clay raining from their ancient bodies.");
	eq.signal(296002,1);	-- activate golems
	eq.set_data("inktuta_status-"..eq.get_zone_instance_id(), "5",tostring(eq.seconds("6h")));
	eq.depop();
end
