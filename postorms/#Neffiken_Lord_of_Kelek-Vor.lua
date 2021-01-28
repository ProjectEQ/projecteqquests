local ADDS_TYPES = {
	210248, -- a_restrained_ent (210248)
	210259, -- a_manipulated_ent (210259)
	210258, -- a_maligned_ent (210258)
};
local adds = 0;

function event_spawn(e)
eq.set_timer('depop', 3600 * 1000);
end

function event_combat(e)
	if (e.joined == true) then
		if(not eq.is_paused_timer('depop')) then
			eq.pause_timer('depop');
		end
	eq.set_timer('adds', 30 * 1000);
	else
		eq.resume_timer('depop');
		eq.stop_timer('adds');
	end
end

function event_timer(e)
	if (e.timer == 'depop') then
		eq.unique_spawn(210176,0,0,-1971,1267,-439.5,256); --repop untargetable version
		eq.depop();
	elseif (e.timer == 'adds') then
		if ( adds < 6 ) then
		
			local x = e.self:GetX();
			local y = e.self:GetY();
			local z = e.self:GetZ() + 5;
			local rng = math.random(4, 6);
			local spawned = 0;
			
			for i = adds+1, 6 do
				eq.spawn2(eq.ChooseRandom(ADDS_TYPES[1], ADDS_TYPES[2], ADDS_TYPES[3]), 0, 0, x + math.random(-100, 100), y + math.random(-100, -50), z, 0);				
				spawned = spawned + 1;
				if ( spawned == rng ) then
					break;
				end
			end
			adds = adds + spawned;
		end
	
	end
end

function event_death_complete(e)
eq.unique_spawn(210254,0,0,-1971,1267,-439.5,256); --Start Dolshak script
end
