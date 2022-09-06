function event_death_complete(e)
eq.spawn2(301073,0,0,-1292,61,-910.61,0); -- NPC: #a_reclusive_girplan
eq.zone_emote(15, "Attracted by the recent commotion, a reclusive Girplan emerges from its hiding spot.");
end
-- 1st girplan spawns 2nd

function event_timer(e)
  if (e.timer == "despawn") then
    eq.depop();
    eq.zone_emote(10, "The reclusive girplans slink back into their caves.");
  elseif e.timer=="blur" then
		local player_count = 0;
		local hate_list = e.self:GetHateRandom();
		if hate_list ~= nil then
			for mob in hate_list.entries do
				if mob.ent:IsClient() then 	--only want clients in this
					mob.ent:CastToClient():CastedSpellFinished(5604); --crushing blow
				player_count = player_count + 1;
				end
				if (player_count == 3) then
				break
				end
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
