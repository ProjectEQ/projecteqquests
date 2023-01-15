function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("The boss might need some help!");
		local stanos = eq.get_entity_list():GetMobByNpcTypeID(5088); -- Stanos_Herkanor
		if ( stanos.valid ) then
			e.self:MoveTo(stanos:GetX(), stanos:GetY(), stanos:GetZ(), -1, false);
		end
	end
end
