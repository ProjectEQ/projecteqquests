function event_waypoint_arrive(e)
	if(e.wp == 2) then
		eq.spawn2(227003, 51, 0, 1257, 675, -88, 126); -- NPC: Defender_of_the_Broodmother
		eq.spawn2(227003, 51, 0, 1257, 665, -88, 126); -- NPC: Defender_of_the_Broodmother
	elseif(e.wp == 6) then
		eq.spawn2(227003, 52, 0, 1206, 1000, -74, 254); -- NPC: Defender_of_the_Broodmother
		eq.spawn2(227003, 52, 0, 1216, 1000, -74, 254); -- NPC: Defender_of_the_Broodmother
		eq.spawn2(227002, 52, 0, 1211, 1000, -74, 254); -- NPC: a_Luggald_Archseeker
	elseif(e.wp == 13) then
		eq.spawn2(227003, 53, 0, 820, 977, -74, 254); -- NPC: Defender_of_the_Broodmother
		eq.spawn2(227003, 53, 0, 825, 977, -74, 254); -- NPC: Defender_of_the_Broodmother
		eq.spawn2(227002, 53, 0, 830, 977, -74, 254); -- NPC: a_Luggald_Archseeker
		eq.spawn2(227002, 53, 0, 835, 977, -74, 254); -- NPC: a_Luggald_Archseeker
	elseif(e.wp == 16) then
		eq.spawn2(227003, 0, 0, 861, 675, -88, 126); -- NPC: Defender_of_the_Broodmother
		eq.spawn2(227003, 0, 0, 861, 665, -88, 126); -- NPC: Defender_of_the_Broodmother
		eq.spawn2(227003, 0, 0, 861, 660, -88, 126); -- NPC: Defender_of_the_Broodmother
		eq.spawn2(227002, 0, 0, 861, 680, -88, 126); -- NPC: a_Luggald_Archseeker
		eq.spawn2(227002, 0, 0, 861, 685, -88, 126); -- NPC: a_Luggald_Archseeker
	elseif(e.wp == 18) then
		eq.spawn2(227321, 0, 0, 1060, 549, -88,  0); -- NPC: #The_Luggald_Broodmother
		eq.depop();
	end
end
