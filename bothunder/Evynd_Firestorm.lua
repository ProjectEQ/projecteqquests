function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("Evynd_Adds", 120 * 1000);
	else
		eq.stop_timer("Evynd_Adds");
	end
end

function event_timer(e)
	if (e.timer == "Evynd_Adds") then
		eq.signal(209038 ,1,1); -- NPC: A_firestorm_portal
		eq.zone_emote(0, "Evynd waves his hands in the air, calling the power of the firestorm through the blazing portals.");
	end
end

function event_death_complete(e)
	eq.spawn2(209101,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #Askr_the_Lost
end
