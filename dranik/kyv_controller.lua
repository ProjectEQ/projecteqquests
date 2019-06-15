local Jaeth = false;
local Mihl = false;
local Nass = false

function event_spawn(e)
	eq.unique_spawn(336068,0,0,297.36, -621.88, 99.41, 116.5); -- Nass
	eq.unique_spawn(336067,0,0,419.13, -947.84, 101.55, 9.0); -- Jaeth
	eq.unique_spawn(336066,0,0,520.05, -552.84, 99.41, 281.2); -- Mihl
	Jaeth = false;
	Mihl = false;
	Nass = false
end


function event_signal(e)
	if (e.signal == 336066) then
		Mihl = true;
	elseif (e.signal == 336067) then
		Jaeth = true;
	elseif (e.signal == 336068) then
		Nass = true;
	end
	if (Jaeth and Mihl and Nass) then
		eq.depop_with_timer();
	end
end
