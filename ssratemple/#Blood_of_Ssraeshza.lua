function event_combat(e)
if (e.joined == true) then
eq.spawn2(162280, 0, 0, 625, -356,  403,  0); --Ssraezsha (162280)
eq.spawn2(162280, 0, 0, 689, -356,  403,  0); --Ssraezsha (162280)
eq.spawn2(162280, 0, 0, 689, -293,  403,  0); --Ssraezsha (162280)
eq.spawn2(162280, 0, 0, 625, -293,  403,  0); --Ssraezsha (162280)
end
end

function event_death_complete(e)
eq.signal(162260,1); -- #EmpCycle
end
