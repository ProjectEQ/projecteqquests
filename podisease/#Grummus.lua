function event_combat(e)
if (e.joined == true) then
eq.set_timer("OOBcheck", 6 * 1000);
else
eq.stop_timer("OOBcheck");
end
end

function event_timer(e)
if(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetX() < 1800) then
		e.self:GotoBind();
		e.self:WipeHateList();
	else
		eq.set_timer("OOBcheck", 6 * 1000);
	end
end
end


function event_death_complete(e)
eq.spawn2(202366, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); --A_Planar_Projection
end
