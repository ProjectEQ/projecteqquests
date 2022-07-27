--a_pile_of_living_rubble (223106)
--Phase 1 - Terlok of Earth Trial
--potimeb

--trial boundary for mob spawns
local min_x = -50;
local max_x = 65;
local min_y = 1598;
local max_y = 1670;
		
function event_death_complete(e)
	-- spawn between 2 and 4 a_rock_shaped_assassin (random location within area)
	local count = math.random(2,4) 
	for i = 1, count do
		eq.spawn2(223147,0,0,math.random(min_x,max_x),math.random(min_y,max_y),505,0);
	end
end
