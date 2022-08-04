-- War_Trigger (166257) - invis man coordinator for Hollowshade War

-- camp 1 is north, camp 2 is east, camp 3 is south
camps = { "north", "east", "south" };
-- race 1 is bears, race 2 is wolves, race 3 is grimlings
races = { "Owlbears", "Sonic Wolves", "Grimlings" };

conditions = { 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0 };
attackers = { 166139, 166091, 166266 };
defenders = { 166242, 166264, 166279 };
cats = { 166078, 166079, 166080, 166081, 166082, 166083, 166084 };

function event_spawn(e)
    reset_zone();
end

function event_timer(e)
    eq.stop_timer(e.timer);
	
	if e.timer == 'check_attack' then
		if not check_attackers() then -- no attackers left alive
			attack_cycle();
		else
			eq.set_timer('check_attack', 60 * 1000);
		end
		
    elseif e.timer == 'reset' or e.timer == 'idle_reset' then
        reset_zone();
		
    elseif e.timer == 'next_attack' then
		-- attack timer - determines a random camp and gets the race - if a boss has died recently, that overwrites the randomly generated camp
        local camp = math.random(1,3);
		if dead_boss ~= 0 then camp = math.floor( (dead_boss-1)/3 + 1); end
		local race = determine_race(camp);
        initiate_attack(camp, race) -- tries to execute an attack
		
    elseif e.timer == 'current_attack' then
		attack_cycle();
		
    elseif e.timer == 'war_win' then
        local win_race = 10 + determine_race(1);
        conditions[win_race] = 1;
		process_cond(conditions);
    end
end

function event_signal(e)
    if e.signal < 10 then -- keeps track of what bosses die... last boss to die before an attack designates what camp gets attacked
        -- signals here mapped in the same way as conditions - 1 is north bear, 2 is north wolf, 3 is north grim, 4 is east bear, etc
		dead_boss = e.signal;
		
		if not event_started then eq.set_timer('next_attack', 60 * 1000); end -- if the war isn't started, let's get it going!
		
		eq.stop_timer('idle_reset');
		eq.set_timer('idle_reset', 48 * 60 * 60 * 1000) -- 48 hour idle timer if nobody doing anything with the war
		
    elseif e.signal > 10 and e.signal < 35 then -- takeover signals
        -- signals here are coded as (camp)(race) - camp is 1/2/3 for north/east/south and race is 1/2/3 for bear/wolf/grim
        takeover(math.floor(e.signal / 10), e.signal % 10);
        attack_cycle();
		
    elseif e.signal == 101 then -- if any of the vah shirs in the fort spawn during occupation for any reason, they will be sent to ZL
        if conditions[11] == 1 or conditions[12] == 1 or conditions[13] == 1 then
            clear_fort();
        end
	
	elseif e.signal == 999 and not players and event_started then -- player zoned in after idle trigger, reset the attack cycle
		players = true;
		attack_cycle();
    elseif e.signal == 1000 then -- zone reset signal (random timer for zone reset)
        eq.set_timer('reset', math.random(5) * 60 * 1000);        
    end
end

function attack_cycle()
	eq.stop_timer('current_attack');
	eq.stop_timer('check_attack');
	attack_cleanup();
	if players then eq.set_timer('next_attack', math.random(5) * 60 * 1000); end
	
	-- checks for players
	if not player_check() then
		players = false;
	end
	
end

function player_check()
	plist = eq.get_entity_list():GetClientList();
	if plist ~= nil then
		for player in plist.entries do
			return true
		end
	end
	
	return false
end

function initiate_attack(tar, race)
    for i=1,2 do
        if race ~= determine_race(tar+i) then
            process_attack(tar+i, tar);
            process_emote(determine_race(tar+i), tar, race);
            event_started = true;
			dead_boss = 0;
            eq.set_timer('current_attack', 15 * 60 * 1000) -- 15 minute limit on attack duration
			eq.set_timer('check_attack', 60 * 1000) -- checks on attackers every minute to make sure they're not dead!
            return true
        end
    end
    
    return false -- returns false if no attack happened (all camps are same race)
end

function process_attack(ac, dc)
	atk_camp = parse(ac);
	def_camp = parse(dc);
	local locs = {};
	-- north camp
	locs[1] = { [1] = {1103,2134,137,182}; [2] = {1137,2109,143,178}; [3] = {1129,2166,143,187}; [4] = {1175,2175,170,172}; [5] = {1185,2121,167,180} };
    -- east camp
	locs[2] = { [1] = {-2704,541,46,39}; [2] = {-2730,592,48,60}; [3] = {-2714,571,47,57}; [4] = {-2747,498,51,43}; [5] = {-2719,514,46,65} };
    -- south camp
	locs[3] = { [1] = {-621,-2753,55,252}; [2] = {-602,-2764,60,242}; [3] = {-633,-2773,60,239}; [4] = {-644,-2794,68,254}; [5] = {-591,-2794,69,252} };
        
    local atk_race = determine_race(atk_camp);
    local def_race = determine_race(def_camp);
    local paths = { [1] = {101, 102, 103}; [2] = {201, 202, 203}; [3] = {301, 302, 303} }; -- 101, 202, 303 aren't real paths... should not occur!
    
    -- loop to spawn attackers
    local grid = paths[atk_camp][def_camp];
    for i=1,5 do
        eq.spawn2(attackers[atk_race], grid, 0, locs[atk_camp][i][1], locs[atk_camp][i][2], locs[atk_camp][i][3], locs[atk_camp][i][4])
    end
    
    -- check whether to spawn defenders and do it if necessary
    if determine_race(6-atk_camp-def_camp) ~= def_race then
        for i=1,5 do
            eq.spawn2(defenders[def_race], 0, 0, locs[def_camp][i][1], locs[def_camp][i][2], locs[def_camp][i][3], locs[def_camp][i][4])
        end
    end
    -- return atk_list, def_list -- returns tables of attacker and defender mobs
end

function takeover(camp, race) -- triggered if attackers reach the end of their path before end of the attack timer
    local off = (parse(camp) - 1) * 3; -- offset is 0 for north, 3 for east, 6 for south
    for i=1,3 do
        if i == parse(race) then
            conditions[off+i] = 1
        else
            conditions[off+i] = 0
        end
    end
    
    process_cond(conditions);
    check_war_win();
end

function check_war_win()
    if determine_race(1) == determine_race(2) and determine_race(2) == determine_race(3) then
        eq.stop_all_timers(); -- no more attacks until reset
        eq.set_timer('war_win', math.random(5) * 60 * 1000 );
        clear_fort();
		
		eq.stop_timer('idle_reset');
		eq.set_timer('idle_reset', 48 * 60 * 60 * 1000) -- 48 hour idle timer if nobody doing anything with the war
    end
end

function check_attackers()
	local ent_list = eq.get_entity_list();
	for _, v in pairs(attackers) do
		if ent_list:IsMobSpawnedByNpcTypeID(v) then
			return true
		end
	end
	
	return false
end

function clear_fort()
    for _, v in pairs(cats) do -- move vah shir to ZL
        eq.signal(v, 99);
    end
end

function process_emote(atk_race, def_camp, def_race)
    emotes = {};
    emotes[1] = "Somewhere in the distance, the Owlbear sharpen their claws on boulders.";
    emotes[2] = "Frenzied howling fills the air, the sound taking on every aspect of an angry wail.";
    emotes[3] = "Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy.";
    eq.zone_emote(MT.DimGray, string.format("%s The %s in the %s are on the defensive.", emotes[atk_race], races[def_race], camps[def_camp] ));
end

function determine_race(camp)
    local off = (parse(camp) - 1) * 3; -- offset is 0 for north, 3 for east, 6 for south
    for i=1,3 do
        if conditions[off+i] == 1 then
            return i
        end
    end
    
    return 0 -- shouldn't normally get here
end

function attack_cleanup()
    for _, v in pairs(attackers) do
        eq.depop_all(v)
    end
    for _, v in pairs(defenders) do
        eq.depop_all(v)
    end
end

function reset_zone()
    -- conditions 1/2/3 are north camp (bear, wolf, grim), 4/5/6 are east camp, 7/8/9 are south camp, 10 is ???, 11/12/13 are fort - starting config is bears north, wolves east, grims south
    conditions = { 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0 };
    process_cond(conditions);
    event_started = false;
	dead_boss = 0;
	players = true;
    
    for _, v in pairs(cats) do -- return vah shir to the fort
        eq.signal(v, 100);
    end
end

function process_cond(cond_array)
    for i, v in pairs(cond_array) do
        eq.spawn_condition("hollowshade", 0, i, v);
    end
end

function parse(num)
    -- this function rolls over numbers at a multiple of 3. i.e. 1->1, 2->2, 3->3, 4->1, 5->2, 6->3, 7->1, etc
    return ((num - 1) % 3) + 1
end
