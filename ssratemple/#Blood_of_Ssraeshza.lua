function event_combat(e)
if (e.joined == true) then
eq.spawn_condition("ssratemple",0,1,1);
end
end

function event_death_complete(e)
eq.signal(162260,1); -- #EmpCycle
end
