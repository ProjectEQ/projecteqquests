function event_spawn(e)
local tagrin = eq.get_entity_list():GetMobByNpcTypeID(214054);	--Tagrin_Maldric (214054)
eq.move_to(tagrin:GetX(),tagrin:GetY(),tagrin:GetZ(),tagrin:GetHeading(),true);
e.self:SetRunning(true);
eq.set_timer('depop', 120 * 1000);
end

function event_death_complete(e)
	if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(214054) == true) then
		local which = math.random(1,2);
    		if  (which == 1) then
			eq.spawn2(214119,0,0,1643,1966,-328,387); -- NPC: Animated_Decorin_Blade
		elseif (which == 2) then
			eq.spawn2(214119,0,0,1163,1786,-328,131); -- NPC: Animated_Decorin_Blade
		end

	end
end


function event_combat(e)
if (e.joined == true) then
if(not eq.is_paused_timer('depop')) then
			eq.pause_timer('depop');
		end
	else
		eq.resume_timer('depop');
	end
end

function event_timer(e)
if (e.timer == 'depop') then
eq.depop();
end
end
