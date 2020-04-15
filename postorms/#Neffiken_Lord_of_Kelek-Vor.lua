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
		eq.unique_spawn(210176,0,0,-1971,1267,-439.5,256); --repop untargetable version
		eq.depop();
	elseif (e.timer == 'adds') then
		local num_alive=0;
		local npc_list = eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 210248 or npc:GetNPCTypeID() == 210258 or npc:GetNPCTypeID() == 210259)) then
				num_alive=num_alive+1;
			end
		end
		
		if (num_alive ==0) then
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
		end
		if (num_alive ==1) then
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
		end
		if (num_alive ==2) then
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
		end
		if (num_alive ==3) then
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
		end
		if (num_alive ==4) then
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
		end
		if (num_alive ==5) then
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
		end
		if (num_alive ==6) then
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
		end
		if (num_alive ==7) then
			eq.spawn2(eq.ChooseRandom(210258,210259,210248), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC(s): a_restrained_ent (210248)
		end
	end
end

function event_death_complete(e)
eq.unique_spawn(210254,0,0,-1971,1267,-439.5,256); --Start Dolshak script
end
