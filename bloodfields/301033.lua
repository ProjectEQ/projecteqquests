function event_death_complete(e)
eq.spawn2(301073,0,0,-1292,61,-910.61,0); -- NPC: #a_reclusive_girplan
eq.zone_emote(MT.Yellow, "Attracted by the recent commotion, a reclusive Girplan emerges from its hiding spot.");
end
-- 1st girplan spawns 2nd

function event_spawn(e)
  eq.set_timer("despawn", 930 * 1000);
end

function event_timer(e)
  if (e.timer == "despawn") then
    eq.depop();
    eq.zone_emote(MT.NPCQuestSay, "The reclusive girplans slink back into their caves.");
  elseif e.timer=="blur" then
	hate_list = e.self:CountHateList();
	if (hate_list ~= nil and tonumber(hate_list) == 1) then
		        e.self:CastedSpellFinished(5604, e.self:GetHateRandom())
	elseif (hate_list ~= nil and tonumber(hate_list) == 2) then
		        e.self:CastedSpellFinished(5604, e.self:GetHateRandom())
                e.self:CastedSpellFinished(5604, e.self:GetHateRandom())
	elseif (hate_list ~= nil and tonumber(hate_list) >= 3) then
				e.self:CastedSpellFinished(5604, e.self:GetHateRandom())
                e.self:CastedSpellFinished(5604, e.self:GetHateRandom())
                e.self:CastedSpellFinished(5604, e.self:GetHateRandom())
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
