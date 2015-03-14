local counter = 0;
function event_signal(e)
	if (e.signal == 1) then
		counter = counter + 1;
	end
	if ( counter == 1 ) then
		e.self:SetHP(900000);
	elseif ( counter == 2 ) then
		e.self:SetHP(800000);
	elseif ( counter == 3 ) then
		e.self:SetHP(700000);
	elseif ( counter == 4 ) then
		e.self:SetHP(600000);
	elseif ( counter == 5 ) then
		e.self:SetHP(500000);
	elseif ( counter == 6 ) then
		e.self:SetHP(400000);
	elseif ( counter == 7 ) then
		e.self:SetHP(300000);
	elseif ( counter == 8 ) then
		e.self:SetHP(200000);
	elseif ( counter == 9 ) then
		e.self:SetHP(100000);
	end
end
