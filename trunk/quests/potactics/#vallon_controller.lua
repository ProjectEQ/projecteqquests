local phase = 0;

function event_spawn(e)
	phase = 1;
	--spawn vallon up by the door
	eq.spawn2(214083,0,0,-822,1980,205,130.9); --Real Vallon
end

function event_signal(e)
	if (e.signal == 1) then --tell vallon which phase we are on
		eq.signal(214083,phase);
	elseif (e.signal == 2) then --Vallon Depopped
		if (phase == 1) then
			eq.set_timer("vz_fail",7200000); --two hour fail timer on first split
		end
		phase = phase + 1; --increment phase passed to vallon
		--spawn Vallon and 4 clones.
		eq.spawn2(214110,0,0,-606,1980,195.1,130.9);	-- Fake Vallon
		eq.spawn2(214110,0,0,-666,1980,195.1,130.9);	-- Fake Vallon
		eq.spawn2(214110,0,0,-636,1950,195.1,130.9);	-- Fake Vallon
		eq.spawn2(214110,0,0,-636,2010,195.1,130.9);	-- Fake Vallon
		eq.spawn2(214083,0,0,-636,1980,195.1,130.9);	-- Real Vallon
	elseif (e.signal == 3) then --vallon dead, despawn with timer
		eq.depop_with_timer();
	end
end

function event_timer(e)
	if (e.timer == "vz_fail") then --event failed, depop all mobs
		eq.depopall(214083); --real vallon
		eq.depopall(214110); --fake vallons
		eq.depop_with_timer(); --myself with respawn timer
	end
end
