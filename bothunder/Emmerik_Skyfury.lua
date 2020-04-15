function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("Emmy_Adds", 120 * 1000);
	else
		eq.stop_timer("Emmy_Adds");
	end
end

function event_timer(e)
	if (e.timer == "Emmy_Adds") then
		eq.signal(209036 ,1,1); -- NPC: A_celestial_portal
		eq.zone_emote(10, "Emmerik raises his arm high above his head.  Great bolts of energy surge through him and strike the portals.");
	end
end

function event_death_complete(e)
eq.spawn2(209102,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #Askr_the_Lost_
end
