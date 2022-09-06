function event_death_complete(e)
	local qglobals = eq.get_qglobals(e.self);
	if(qglobals["rog_bf_trigger"] == "1") then
		eq.spawn2(301079,0,0,-1257,144,-913,0); -- NPC: #Rolthee_Roundbelly
		eq.delete_global("rog_bf_trigger");
	else
		eq.spawn2(301077,0,0,-1257,144,-913,0); -- NPC: #Myrhee_the_Flighty
	end
	eq.zone_emote(15, "Attracted by the recent commotion, a reclusive Girplan emerges from its hiding spot.");
end
-- 5th girplan spawns 6th (named)

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
  	e.self:Emote("flings its bulky body toward you and sends several opponents flying!");
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
