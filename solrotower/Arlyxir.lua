function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000);
		eq.set_timer("heal", 750000);
	else
		eq.stop_timer("OOBcheck");
		eq.stop_timer("heal");
	end
end

function event_timer(e)
	if(e.timer=="OOBcheck") then
	eq.stop_timer("OOBcheck");
		if (e.self:GetY() < 1240) then
			e.self:CastSpell(2830, e.self:GetID())
			e.self:SetHP(e.self:GetMaxHP());
			e.self:GotoBind();
			e.self:WipeHateList();
		else
			eq.set_timer("OOBcheck", 6 * 1000);
		end
	elseif ( e.timer == "heal" ) then
		e.self:Emote("is immolated in flames, and is reborn!");
		e.self:Heal();
		e.self:CastSpell(1281, e.self:GetTarget():GetID()); -- Searing Flames
	end
end

function event_death_complete(e)
eq.unique_spawn(202367, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: A_Planar_Projection
eq.spawn2(212074,0,0,1713,1206,627,264); -- a_warder_of_Arlyxir (212074)
eq.spawn2(212074,0,0,1738,1206,627,264); -- a_warder_of_Arlyxir (212074)
eq.spawn2(212074,0,0,1726,1146,612,264); -- a_warder_of_Arlyxir (212074)
end
