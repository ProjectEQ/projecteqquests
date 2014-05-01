function event_signal(e)
	-- get quest globals
	local qglobals = eq.get_qglobals();

	if (qglobals["poeb_Galronar"] and qglobals["poeb_Birak"] and qglobals["poeb_Awisano"] ) then
		eq.spawn2(222019, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	end
end
