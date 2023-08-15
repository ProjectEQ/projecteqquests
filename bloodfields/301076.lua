function event_death_complete(e)
	local qglobals = eq.get_qglobals(e.self);
	if(qglobals["rog_bf_trigger"] == "1") then
		eq.spawn2(301079,0,0,-1257,144,-913,0); -- NPC: #Rolthee_Roundbelly
		eq.delete_global("rog_bf_trigger");
	else
		eq.spawn2(301077,0,0,-1257,144,-913,0); -- NPC: #Myrhee_the_Flighty
	end
	eq.zone_emote(MT.Yellow, "Attracted by the recent commotion, a reclusive Girplan emerges from its hiding spot.");
end
-- 5th girplan spawns 6th (named)

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
