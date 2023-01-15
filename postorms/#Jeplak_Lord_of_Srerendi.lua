--#Jeplak_Lord_of_Srerendi (210231)


local guards={}

function event_spawn(e)
	activated = false;
	guards[1] = eq.spawn2(eq.ChooseRandom(210056,210099,210058),0,0,390,-2921,-455,254);
	guards[2] = eq.spawn2(eq.ChooseRandom(210056,210099,210058),0,0,310,-2921,-455,254);
	eq.set_timer("depop", 3600 * 1000);
end

function event_combat(e)
	if (e.joined == true) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	eq.set_timer("adds", 60 * 1000);
	else
		eq.resume_timer("depop");
		eq.stop_timer("adds");
	end
end

function event_signal(e)-- Signal from the death of any appropriate named or trash
	if not trash_check() and not activated then
		activate(e.self);	--activate if trash is cleared
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.unique_spawn(210179,0,0,346,-2513,-440.5,0); --repop untargetable version
		eq.depop();
	elseif e.timer == "adds" and e.self:IsEngaged() then
		eq.stop_timer(e.timer);
		eq.set_timer("adds", 60 * 1000);
		spawn_adds(e,2,8);	--spawn adds
	elseif e.timer == "monitor" then
		if trash_check() and not e.self:IsEngaged() then
			eq.unique_spawn(210179,0,0,346,-2513,-440.5,0); --repop untargetable version
			eq.depop();
		else
			eq.stop_timer(e.timer);
			eq.set_timer("monitor", 10 * 1000);
		end
	end
end

function event_slay(e)
	if e.other:IsClient() or e.other:IsPet() then
		spawn_adds(e,2,2);	--2 adds on death always
	end
end

function event_death_complete(e)
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,300,"As the corpse of Jeplak crashes to the ground, you notice a slight, deranged smile on his face.");
end

function deactivate(mob)
	activated = false;
	eq.stop_all_timers();
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);	--will not aggro
	mob:SetSpecialAbility(35, 1);	--no harm from players
	mob:WipeHateList();
	mob:GotoBind();
end

function activate(mob)
	activated = true;
	mob:SetBodyType(1, true);		--humanoid
	mob:SetSpecialAbility(24, 0);	--will not aggro
	mob:SetSpecialAbility(35, 0);	--no harm from players
	eq.set_timer("monitor", 10 * 1000); -- check for mob respawns

end

function spawn_adds(e,low,high)
	local rand = math.random(low,high);
	for n = 1,high do
		mob = eq.spawn2(eq.ChooseRandom(210234,210233),0,0,e.self:GetX() + math.random(-50,50),e.self:GetY() + math.random(-50,50),e.self:GetZ() - 10,e.self:GetHeading());	--#a_lost_soul or #a_mangled_traveller
		mob:AddToHateList(e.self:GetHateRandom(),1);
	end
end

function trash_check()	--iterate through related spawnpoints for both Jeplak camps
	local spawn_table = {35744,35742,35783,35740,35739,35741,35737,35736,35771,35756,35755,35773,35772,35425,35753,35749,35750,35751,35748,35745,35747,35424,35752,35512,35505,35514,35513,35897,35507,35506,35509,35511,35508,35510};

	for _,spawns in pairs(spawn_table) do
		local giant = eq.get_entity_list():GetNPCBySpawnID(spawns);
		
		if giant.valid then
			return true;
		end
	end

	return false;
end
