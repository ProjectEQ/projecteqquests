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
	if (e.self:GetY() < -918) then
		e.self:Emote("bellows in a deep voice, 'You shall not distract me from my conjurings!");
		e.self:GotoBind();
		e.self:WipeHateList();
	else
		eq.set_timer("OOBcheck", 6 * 1000);
	end
end
end

function event_death_complete(e)
	eq.unique_spawn(214105, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); --NPC: A_Planar_Projection
  eq.spawn2(212078,0,0,1836,-1040,291,256); --a_warder_of_Xuzl (212078)
  eq.spawn2(212078,0,0,1800,-1090,291,125); --a_warder_of_Xuzl (212078)
  eq.spawn2(212078,0,0,1879,-1090,291,385); --a_warder_of_Xuzl (212078)
end
