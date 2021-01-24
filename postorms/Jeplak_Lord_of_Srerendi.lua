local activated = false;
local guards = {};	--spawned once fake Jeplak is activated

function event_spawn(e)
	--depop mobs if happen to be up since cycle is restarting
	eq.depop_all(210267) --a_confused_castaway (210267)
	eq.depop_all(210231) --Jeplak_Lord_of_Srerendi (210231)
	activated = false;
end


function event_signal(e)-- Signal from the death of any appropriate named or trash
	if not trash_check() and not activated then
		activate(e.self);	--activate if trash is cleared
	end
end

function event_timer(e)
	if e.timer == "monitor" then
		if trash_check() and not e.self:IsEngaged() then
			deactivate(e.self);
		else
			eq.stop_timer(e.timer);
			eq.set_timer("monitor", 15 * 1000);
		end
	end
end

function event_death_complete(e)
	eq.unique_spawn(210267,0,0,346,-2512,-450,0);	 --a_confused_castaway (210267)
end


function deactivate(mob)
	activated = false;
	eq.stop_all_timers();
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);	--will not aggro
	mob:SetSpecialAbility(35, 1);	--no harm from players
	mob:WipeHateList();
	mob:GotoBind();
	depop_guards();
end

function activate(mob)
	activated = true;
	mob:SetBodyType(1, true);		--humanoid
	mob:SetSpecialAbility(24, 0);	--will not aggro
	mob:SetSpecialAbility(35, 0);	--no harm from players
	eq.set_timer("monitor", 30 * 60 * 1000);	--remain targetable for 30 minutes at a minimum.  after that point will go untargetable if spwanpoints repop and mob is not engaged
	spawn_guards();
end

function trash_check()	--iterate through related spawnpoints for both Jeplak camps
	local spawn_table = {35744,35742,35783,35740,35739,35741,35737,35736,35771,35756,35755,35773,35772,35425,35753,35749,35750,35751,35748,35745,35747,35424};

	for _,spawns in pairs(spawn_table) do
		local giant = eq.get_entity_list():GetNPCBySpawnID(spawns);
		
		if giant.valid then
			return true;
		end
	end
	return false;
end

function spawn_guards()
	local spawn_locs = {	[1] = {435,-2400,-460,0}, [2] = {426,-2415,-460,0}, [3] = {447,-2415,-451,0}, [4] = {378,-2400,-462,0}, [5] = {362,-2400,-462,0}, 
							[6] = {370,-2415,-462,0}, [7] = {317,-2415,-462,0}, [8] = {267,-2415,-462,0}, [9] = {260,-2400,-462,0}, [10] = {253,-2415,-462,0}	};
	
	for n = 1,10 do
		guards[n] = eq.spawn2(eq.ChooseRandom(210056,210099,210058),0,0,spawn_locs[n][1],spawn_locs[n][2],spawn_locs[n][3],spawn_locs[n][4]);
	end
end

function depop_guards()
	for k,v in pairs(guards) do
		guards[k]:Depop(false);
	end
end
