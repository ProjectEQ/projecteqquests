function event_death_complete(e)
	eq.spawn2(218068,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ() - 15, e.self:GetHeading());	--A_Planar_Projection
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000); -- 6 Sec OOB Check
	else
		eq.stop_timer("OOBcheck");
	end
end


function event_timer(e)
	if(e.timer=="OOBcheck") then
	eq.stop_timer("OOBcheck");
		if (e.self:GetZ() < 200) then
			e.self:Say("If you wish to challenge me, you must do it on my terms!");
			e.self:GotoBind();
			e.self:WipeHateList();
		else
			eq.set_timer("OOBcheck", 6 * 1000); -- 6 Sec OOB Check
		end
	end
end
