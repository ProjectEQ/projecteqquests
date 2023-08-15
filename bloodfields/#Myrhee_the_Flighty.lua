function event_spawn(e)
  eq.set_timer("despawn", 930 * 1000);
end

function event_timer(e)
  if (e.timer == "despawn") then
    eq.depop();
    eq.zone_emote(MT.NPCQuestSay, "The reclusive girplans slink back into their caves.");
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
  	e.self:Emote("flings its bulky body toward you and sends several opponents flying!");
	e.self:WipeHateList();
  end
end

function event_combat(e)
	if e.joined then
		eq.set_timer("blur",15*1000);
	else
		eq.stop_timer("blur");
	end
end
function event_death_complete(e)
  eq.spawn2(301078,0,0,-1279,168,-924,212); -- NPC: #Keetra_the_Lost
end
-- spawn rog 2.0 mob
