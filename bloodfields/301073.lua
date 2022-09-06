function event_death_complete(e)
eq.spawn2(301074,0,0,-135,996,-622.81,0); -- NPC: #a_reclusive_girplan
eq.zone_emote(15, "Attracted by the recent commotion, a reclusive Girplan emerges from its hiding spot.");
end
-- 2nd girplan spawns 3rd

function event_timer(e)
  if (e.timer == "despawn") then
    eq.depop();
    eq.zone_emote(10, "The reclusive girplans slink back into their caves.");
  elseif e.timer=="blur" then
		local cl = eq.get_entity_list():GetShuffledClientList(); -- Shuffle the client list and choose 3 targets.
		local count = 0;
			for client in cl.entries do
				if client.valid then -- If valid
				e.self:CastedSpellFinished(5604, client); -- Crushing Blow
				count = count + 1; -- Add per client.
				end
				if (count == 3) then
				break -- Stop.
				end
			end
  	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"The girplan flings several nearby enemies");
	e.self:WipeHateList();
  end
end

function event_combat(e)
	if e.joined==true then
		eq.set_timer("blur",15*1000);
	else
		eq.stop_timer("blur");
	end
end
