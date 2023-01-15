local ADDS_TYPES = { -- these are level 56 versions; not the same as zone wanderers
	210249, -- a_roving_scorpioco
	210256, -- a_noxious_scorponnis
	210255, -- a_roving_cactore
	210257, -- a_spined_cactoric
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
		eq.unique_spawn(210178,0,0,2028,203,-432.88,256); --repop untargetable version
		eq.depop();
	elseif (e.timer == 'adds') then
		if ( adds < 6 ) then
		
			local x = e.self:GetX();
			local y = e.self:GetY();
			local z = e.self:GetZ() + 5;
			local rng = math.random(4, 6);
			local spawned = 0;
			
			for i = adds+1, 6 do
				eq.spawn2(eq.ChooseRandom(ADDS_TYPES[1], ADDS_TYPES[2], ADDS_TYPES[3], ADDS_TYPES[4]), 0, 0, x + math.random(-100, 100), y + math.random(-100, -50), z, 0);				
				spawned = spawned + 1;
				if ( spawned == rng ) then
					break;
				end
			end
			adds = adds + spawned;
		end
	
	end
end

function event_signal(e)
adds = adds - 1;
end
