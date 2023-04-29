local bones_spawned = false;

function event_say(e)
	if e.message:findi("hail") then		
		e.self:Say("It's so ironic. My furthest distant memory is a dream of finding this ancient sentinel and now that I've found it, there is no point. The only thing worse than realizing that I've been living in an illusion, unaware that we died long ago, is . . . The knowledge that we will slip back into the endless routine again. I can feel my lucidity slipping away even now. It's only a matter of time before . . . we haunt this place as if you had never arrived. Before I lose myself again, allow me to offer you something that may help...");
		e.self:Say("I notice that you are not afraid to face the consequences of your actions, but you will also pursue the non-violent solution if such a thing is possible. This ancient armor should suit you well. Tell me if you wish to [" .. eq.say_link("receive the reward",false,"receive the reward") .. "] for your actions. I only have one to offer, so select the recipient wisely.");
	elseif e.message:findi("receive the reward") then		
		local inktuta_status = tonumber(eq.get_data("inktuta_status-"..eq.get_zone_instance_id())) or 0
		if inktuta_status == 9 and not bones_spawned then
			bones_spawned = true;
			eq.signal(296070,296071); -- NPC: zone_status
			e.self:Emote("nods solemnly.  A dusty pile of bones materializes on the floor at his feet");
		else
			e.self:Say("I'm afraid I have nothing else to offer. See to the sentinel if you have not already.");
		end
	end
end
