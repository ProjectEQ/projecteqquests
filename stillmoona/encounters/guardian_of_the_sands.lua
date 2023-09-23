local sand_areas = {
	[1] = {1, 1, -655.19, -602.51, 660.34, 794.29, 0, 10.0},
	[2] = {2, 1, -602.55, -411.91, 580.00, 605.54, 0, 10.0},
	[3] = {3, 1, -655.44, -602.60, 580.00, 632.69, 0, 10.0},
	[4] = {4, 1, -575.59, -414.02, 627.43, 685.55, 0, 10.0},
	[5] = {5, 1, -575.59, -442.43, 707.75, 795.00, 0, 10.0},
	[6] = {6, 1, -412.37, -361.44, 580.00, 795.00, 0, 10.0},
	[7] = {7, 1, -655.65, -605.03, 866.56, 960.59, 0, 10.0},
	[8] = {8, 1, -573.04, -522.38, 866.56, 960.59, 0, 10.0},
	[9] = {9, 1, -496.10, -444.75, 866.55, 960.57, 0, 10.0},
	[10] = {10, 1, -410.54, -362.23, 866.55, 960.57, 0, 10.0},
	[11] = {11, 1, -576.00, -441.64, 1033.96, 1086.75, 0, 10.0},
	[12] = {12, 1, -415.34, -362.00, 1033.96, 1086.75, 0, 10.0},
	[13] = {13, 1, -576.00, -490.00, 1114.00, 1246.89, 0, 10.0},
	[14] = {14, 1, -467.81, -410.14, 1114.00, 1275.00, 0, 10.0},
	[15] = {15, 1, -387.84, -362.00, 1086.50, 1275.00, 0, 10.0},
	[16] = {16, 1, -576.00, -362.00, 1278.20, 1327.00, 0, 10.0},
	[17] = {17, 1, -742.61, -649.80, 1035.40, 1083.96, 0, 10.0},
	[18] = {18, 1, -742.61, -649.80, 1117.10, 1166.93, 0, 10.0},
	[19] = {19, 1, -743.14, -650.50, 1194.71, 1244.73, 0, 10.0},
	[20] = {20, 1, -743.14, -650.50, 1276.82, 1327.12, 0, 10.0}
};

local goblin_npc = {338310,338311,338312,338313,338314,338318,338319,338323,338324};

function Setup_Traps(e)
	for v in pairs(sand_areas) do
		eq.add_area(unpack(sand_areas[v]));
	end
end

function Sand_Trap(e)
	local x,y,z,h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
	local number_to_spawn = math.random(2);
	while number_to_spawn > 0 do
		eq.spawn2(goblin_npc[math.random(#goblin_npc)],0,0,x,y,z,h):AddToHateList(e.self, 1);
		number_to_spawn = number_to_spawn - 1;
	end
end

function Guardian_Spawn(e)
	eq.set_timer("leash", 1000);
end

function Guardian_Timer(e)
	if e.self:GetX() < -664 and e.self:GetY() < 661.55 then
		e.self:GotoBind();
		e.self:WipeHateList();
		e.self:SetHP(e.self:GetMaxHP());
	end
end

function Guardian_Death(e)
	eq.unregister_player_event(Event.enter_area);
end

function event_encounter_load(e)
	Setup_Traps(e);
	eq.register_player_event(Event.enter_area,	Sand_Trap);
	eq.register_npc_event(Event.spawn,			338171,	Guardian_Spawn);
	eq.register_npc_event(Event.timer,			338171,	Guardian_Timer);
	eq.register_npc_event(Event.death_complete,	338171,	Guardian_Death);
end
