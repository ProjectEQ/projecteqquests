local kyv = 0;


function event_spawn(e)
	eq.unique_spawn(336068,0,0,297.36, -621.88, 99.41, 116.5); -- Nass
	eq.unique_spawn(336067,0,0,419.13, -947.84, 101.55, 9.0); -- Jaeth
	eq.unique_spawn(336066,0,0,520.05, -552.84, 99.41, 281.2); -- Mihl
	kyv = 0;
	eq.debug("Kyvs Dead : " .. kyv);
end


function event_signal(e)
	if (e.signal==1) then
	kyv= kyv+ 1;
	eq.debug("Kyvs Dead : " .. kyv);
		if kyv == 3 then
		eq.depop_with_timer();
		end
	end
end
