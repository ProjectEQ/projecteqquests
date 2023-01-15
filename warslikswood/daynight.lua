function event_spawn(e)
	eq.set_timer("timecheck", 30 * 1000);
end

function event_timer(e)
	local zone_time = eq.get_zone_time();

	if(zone_time["zone_hour"] <= 6 or zone_time["zone_hour"] >= 22) then
		--check between 10pm - 6am

		if (eq.get_spawn_condition("warslikswood", 0, 1) == 1) then
			--if spawn condition is already on, do nothing

		else
			eq.spawn_condition("warslikswood", 0, 1, 1);
			--set lurking hopeful spawn condition to on
		end

	else
		-- if time is between 7am-9pm turn off spawn condition
		eq.spawn_condition("warslikswood", 0, 1, 0);
	end
end
