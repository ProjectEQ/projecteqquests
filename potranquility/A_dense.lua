function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 45, xloc + 45, yloc - 45, yloc + 45, zloc - 3, zloc + 6);
end

function event_enter(e)
	e.self:Emote("fog of incense smoke envelopes you as you enter the dark rooms. The low murmur of meditative mantras reverberates throughout the building. The elders are all in a meditative state.");
	eq.depop_with_timer();
end
