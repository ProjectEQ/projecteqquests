function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("The boss might need some help!");
		local stanos = eq.get_entity_list():GetMobByNpcTypeID(5088); -- Stanos_Herkanor
		if ( stanos.valid ) then
			e.self:MoveTo(stanos:GetX(), stanos:GetY(), stanos:GetZ(), -1, false);
		end
	elseif(e.signal == 2) then
		e.self:Say("Gets moving before me smash yu to pulp!!")
	elseif(e.signal == 3) then
		e.self:Say("BWAHAHA HA!! Yoo werk fer Mister Axe now. Hehehe!!")
	end
end

function event_say(e)
	if (e.message:findi("hail") ) then
		e.self:Say("Yu be getting going. Dis here is da boss' table!!");
	end
end
