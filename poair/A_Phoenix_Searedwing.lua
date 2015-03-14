-- A_Phoenix_Searedwing NPCID: 215028
function event_death_complete(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	local eh = e.self:GetHeading();
	-- send a signal to #Mist_Trigger
	eq.signal(215455, 4, 2000);
	-- spawn #A_Phoenix_Scorchlet x 4
	eq.spawn2(215478, 0, 0, ex - 5, ey, ez, eh);
	eq.spawn2(215478, 0, 0, ex + 5, ey, ez, eh);
	eq.spawn2(215478, 0, 0, ex, ey - 5, ez, eh);
	eq.spawn2(215478, 0, 0, ex, ey + 5, ez, eh);
end
