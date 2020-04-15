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
		local num_alive=0;
		local npc_list = eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 210249 or npc:GetNPCTypeID() == 210255 or npc:GetNPCTypeID() == 210256 or npc:GetNPCTypeID() == 210257)) then
				num_alive=num_alive+1;
			end
		end
		
		if (num_alive ==0) then
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
		end
		if (num_alive ==1) then
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
		end
		if (num_alive ==2) then
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
		end
		if (num_alive ==3) then
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
		end
		if (num_alive ==4) then
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
		end
		if (num_alive ==5) then
			eq.spawn2(eq.ChooseRandom(210249,210255,210256,210257), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): #a_roving_scorpioco (210249)
		end
	end
end
