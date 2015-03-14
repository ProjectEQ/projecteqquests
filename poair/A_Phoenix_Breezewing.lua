-- A_Phoenix_Breezewing NPCID: 215058
function event_death_complete(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	local eh = e.self:GetHeading();
	-- send a signal to #Mist_Trigger
	eq.signal(215455, 4, 2000);
	-- spawn #A_Phoenix_Gustlet x 2
	eq.spawn2(215477, 0, 0, ex - 5, ey, ez, eh);
	eq.spawn2(215477, 0, 0, ex + 5, ey, ez, eh);
end