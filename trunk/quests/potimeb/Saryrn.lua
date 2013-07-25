function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,5);
end

function event_spawn(e)
	eq.set_next_hp_event(91);
end

function event_hp(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	local heading = e.self:GetHeading();
	if (e.hp_event == 91) then
		-- spawn Saryrn's 4 random mobs from A_Mouth_of_Insanity, A_Tormentor, A_Mouth_of_Dementia, A_Twisted_Tormentor
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,xloc,yloc + 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,xloc,yloc + 25,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,xloc,yloc - 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,xloc,yloc - 25,zloc,heading);
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		-- spawn Saryrn's 4 random mobs from A_Mouth_of_Insanity, A_Tormentor, A_Mouth_of_Dementia, A_Twisted_Tormentor
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,xloc,yloc + 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,xloc,yloc + 25,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,xloc,yloc - 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,xloc,yloc - 25,zloc,heading);
		eq.set_next_hp_event(11);
	elseif (e.hp_event == 11) then
		-- spawn Saryrn's 4 random mobs from A_Mouth_of_Insanity, A_Tormentor, A_Mouth_of_Dementia, A_Twisted_Tormentor
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,xloc,yloc + 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,xloc,yloc + 25,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,xloc,yloc - 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,xloc,yloc - 25,zloc,heading);
	end
end