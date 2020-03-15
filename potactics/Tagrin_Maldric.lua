function event_combat(e)
if (e.joined == true) then
eq.set_timer("OOBcheck", 6 * 1000);
eq.spawn2(214119,0,0,1643,1966,-328,387);
eq.spawn2(214119,0,0,1163,1786,-328,131);
eq.spawn2(214119,0,0,1643,1966,-328,387);
eq.spawn2(214119,0,0,1163,1786,-328,131);
eq.spawn2(214119,0,0,1163,1786,-328,131);
else
eq.stop_timer("OOBcheck");
end
end


function event_timer(e)
if(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetY() < 1697) then
		e.self:GotoBind();
		e.self:WipeHateList();
	else
		eq.set_timer("OOBcheck", 6 * 1000);
	end
end
end
