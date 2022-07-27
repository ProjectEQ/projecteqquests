function event_death_complete(e)
  eq.signal(281127,1,0); -- NPC: #Trigger_Qinimi_2
  eq.signal(281127,2,5); -- NPC: #Trigger_Qinimi_2
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("casting", 20 * 1000)
	else
		eq.stop_timer("casting")
	end
end

function event_spawn(e)
	eq.set_next_hp_event(5)
end
	
function event_hp(e)
    if (e.hp_event == 5) then
		e.self:CastSpell(4663,e.self:GetID()); -- Spell: Aura of the Hunter (4663)
		e.self:Emote("grins as its muscles twitch with power.")
        eq.set_next_inc_hp_event(5)
    elseif (e.inc_hp_event == 5) then
        eq.set_next_hp_event(5)
    end
end

function event_timer(e)
    if (e.timer == "casting") then
        local roll = math.random(100)
        if (roll >= 50) then
        e.self:Emote("releases a volley of arrows.");
        hate_list = e.self:CountHateList();
	if (hate_list ~= nil and tonumber(hate_list) == 1) then
		        e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
	elseif (hate_list ~= nil and tonumber(hate_list) == 2) then
		        e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
	elseif (hate_list ~= nil and tonumber(hate_list) == 3) then
		        e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
	elseif (hate_list ~= nil and tonumber(hate_list) == 4) then
		        e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
	elseif (hate_list ~= nil and tonumber(hate_list) == 5) then
		        e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
	elseif (hate_list ~= nil and tonumber(hate_list) == 6) then
		        e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
    elseif (hate_list ~= nil and tonumber(hate_list) > 6) then --only fires on a max of 7 targets
		        e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
                e.self:CastedSpellFinished(4664, e.self:GetHateRandom())
	end
        
        eq.set_timer("casting", 20  * 1000)
        end
    end
end
