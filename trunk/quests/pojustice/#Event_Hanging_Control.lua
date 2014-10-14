-- 201448 #Event Hanging Control
--
-- There are 4 waves of 4 mobs: 
-- - 2 Mobs from (201456, 201457, 201458, 201459)
-- and 
-- Any Mobs not killed before both spirits are killed will remain up.
-- After the 8th spirit has been killed; spawn Gallows Master Teion
--
-- The event starts with 3 prisoners (201471, 201472, 201473) on the three platforms.
-- 
-- Wave #1
-- After 20 seconds; a spirit of suffocation (201460) will spawn with 2 random mobs from (201456, 201457, 201458, 201459)
-- After 40 seconds; a second a spirit of suffocation (201460) will spawn.
--
-- Wave #2 will start 30 seconds after the second a spirit of suffocation dies
-- Same as Wave #1
--
-- Wave #3 will start 30 seconds after the fourth a spirit of suffocation dies
-- Same as Wave #1
--
-- Wave #4 will start 30 seconds after the sixth a spirit of suffocation dies
-- Same as Wave #1
--
-- Wave #5
-- After the eigth a spirit of suffocation dies Gallows Master Teion (201461) will spawn
--
-- Notes:
-- Any random mob (201456, 201457, 201458, 201459) not killed with its a spirit of suffocation will remain up until killed.
-- Each a spirit of suffocation will pick a prisoner to suffocate.
--  - From the time a prisoner is picked:
--  -- Immediately Emote (emote 1)
--  -- After 25 seconds the Prisoner will Feign Death (emote 3)
--  -- After 60 seconds the Prisoner will Die and the Trail will be Failed (emote 4)
--  -- Timer is Ended when the a spirit of suffocation dies (prisoner gets a reprieve - emote 2)
--
-- Prisoner Emotes:
--  1) The prisoner begins to choke as an invisible noose tightens around his neck.
--  2) The Prisoner gasps, taking in large breaths and coughing as the invisible noose disappears.
--  3) The Prisoner clutches at [her/her] throat, trying to desperately to breathe.
--  4) The prisoner gives one final twitch and suddenly becomes still, its limbs no longer flailing.  You have failed.
--

local prisoners_list			= { 201471, 201472, 201473 };
local spirits_killed			= 0;
local last_steps				= 0;
local spirits_to_prisoners = { };

function event_spawn(e)
	spawn_prisoners();

	-- Mobs should spawn ~20 seoncds after Event Starts
	eq.set_timer("next_wave", 20000);

	spirits_killed				= 0;
	spirits_to_prisoners		= { };
end

function event_signal(e)
	
	if (e.signal == 7) then
		depop_prisoners();
		eq.get_entity_list():MessageClose(e.self, false, 120, 3, "Success!");
		
		-- Signal the Tribunal that the Group was Successful
		eq.signal(201436, 1);

		-- Depop the Controller
		eq.depop();

	elseif (e.signal == 201460 or e.signal == 201474 ) then 
		-- Signal received that one of the a spirit of suffocation's died.
		-- Look up the Prisoner that it was choking so we can reset its animations.
		local prisoner = spirits_to_prisoners[ e.signal ];
		table.remove( spirits_to_prisoners, e.signal );

		eq.get_entity_list():MessageClose(e.self, false, 120, 3, "The Prisoner grasps, taking in large breaths and coughing as the invisible noose disappears.");

		-- Can kill off the fail and feign death timers assocated with the 
		-- prisoner.
		eq.stop_timer("failtimer_" .. prisoner);
		eq.stop_timer("fdtimer_"   .. prisoner);

		-- Stand the Prisoner Backup
		eq.get_entity_list():GetMobByNpcTypeID(prisoner):SetAppearance(0);

		-- Keep track of the number of Spirits we've killed.
		-- Once we've killed 8 spirits; spawn the boss.
		-- Every 2 spirits; Spawn the next wave of mobs.
		spirits_killed = spirits_killed + 1;
		if ( spirits_killed >= 8 ) then
			spawn_boss();
		elseif ( spirits_killed % 2 == 0 ) then 
			eq.set_timer("next_wave", 30000);
		end

	end
end

function event_timer(e)
	
	if (e.timer == "next_wave") then
		eq.stop_timer(e.timer);
		spawn_mobs();
		spawn_spirit(201460);	
		eq.get_entity_list():MessageClose(e.self, false, 120, 3, "The prisoner begins to choke as an invisible noose tightens around his neck.");
		
		-- Spawn the 2nd Spirit 40 seconds after the Wave begins
		eq.set_timer("next_spirit", 40000);

	elseif (e.timer == "next_spirit" ) then
		eq.stop_timer(e.timer);
		spawn_spirit(201474);
		eq.get_entity_list():MessageClose(e.self, false, 120, 3, "The prisoner begins to choke as an invisible noose tightens around his neck.");

	elseif (e.timer == "fdtimer_201471" or e.timer == "fdtimer_201472" or e.timer == "fdtimer_201473") then
		eq.stop_timer(e.timer);

		-- Extract the mob_id from the timer name; as that is the mob we need to feign death
		local timer_name_not_used, npc_to_feign = string.match(e.timer, "([^_]+)_([^_]+)");

		-- FD the prisoner who's timer went off
		eq.get_entity_list():GetMobByNpcTypeID(tonumber(npc_to_feign)):SetAppearance(3);

		--eq.get_entity_list():MessageClose(e.self, false, 120, 3, "The Prisoner clutches at [her/her] throat, trying to desperately to breathe.");
		eq.get_entity_list():MessageClose(e.self, false, 120, 3, "The Prisoner clutches at their throat, trying to desperately to breathe.");

	elseif (e.timer == "failtimer_201471" or e.timer == "failtimer_201472" or e.timer == "failtimer_201473") then
		-- If the Event has failed; then Kill all the Potential Fail Timers.
		eq.stop_timer("failtimer_201471");
		eq.stop_timer("failtimer_201472");
		eq.stop_timer("failtimer_201473");

		eq.get_entity_list():MessageClose(e.self, false, 120, 3, "The prisoner gives one final twitch and suddenly becomes still, its limbs no longer flailing.  You have failed.");

		-- Signal the Tribunal that the Group has failed
		eq.signal(201436, 2);
		
		depop_prisoners();
		depop_list();
		eq.depop();
		
	end
end

function spawn_spirit(spirit_id)
	-- Randomize which of the 3 steps the spirit spawns at.
	local spirit_x = { -50, 0, 50 };

	-- Choose Steps/Prisoner
	local steps = eq.ChooseRandom( 1, 2, 3 );
	
	-- But don't spawn the Spirit in front of the same Prisoner twice.
	while ( steps == last_steps ) do
		steps = eq.ChooseRandom( 1, 2, 3 );
	end

	-- Changing the Heading of the prisoner
	--eq.get_entity_list():GetMobByNpcTypeID(prisoners_list[steps]):SetHeading(125);
	eq.get_entity_list():GetMobByNpcTypeID(prisoners_list[steps]):SetAppearance(4);

	-- Keep track of the steps we spawned so we don't do it twice.
	last_steps = steps;

	-- If a spirit lives for more than 60 seconds; the event fails.
	eq.set_timer("failtimer_" .. prisoners_list[steps], 60000);

	-- if a spirit lives for more than 25 seconds; FD its prisoner.
	eq.set_timer("fdtimer_" ..   prisoners_list[steps], 25000);

	-- Spawn the Mob
	eq.spawn2( spirit_id, 0, 0, (490 + spirit_x[steps]), -1139, 73, 125);

	spirits_to_prisoners[ spirit_id ] = prisoners_list[ steps ];

end

function spawn_mobs()
	-- Spawn 2 of the 4 mobs randomly at the two spawn points.
	eq.spawn2( eq.ChooseRandom( 201456, 201457, 201458, 201459),  0, 0, 440, -1093, 73, 124 );
	eq.spawn2( eq.ChooseRandom( 201456, 201457, 201458, 201459),  0, 0, 536, -1093, 73, 124 );
end

function spawn_boss()
	-- Spawn the Gallows Master Teion
	eq.spawn2( 201461, 0, 0, 488, -1068, 73, 125);

	-- Signal the Agenent of the Tribunal (can't leave once the boss spawns)
	eq.signal( 201075, 3 );
end

function spawn_prisoners()
	-- Spawn the 3 prisoners by the hangmen's noose
	eq.spawn2( 201471, 0, 0, 440, -1175, 80, 255);
	eq.spawn2( 201472, 0, 0, 490, -1175, 80, 255);
	eq.spawn2( 201473, 0, 0, 540, -1175, 80, 255);
end

function depop_list()
	local	npc_list = { 201448, 201460, 201461, 201463, 201456, 201457, 201458, 201459, 201471, 201472, 201473, 201474 };
	for k,v in pairs(npc_list) do
		eq.depop_all(v);
	end
end

function depop_prisoners()
	for k,v in pairs(prisoners_list) do
		eq.depop_all(v);
	end
end

function MoveGroup(trial_group, src_x, src_y, src_z, distance, tgt_x, tgt_y, tgt_z, tgt_h)
	if ( trial_group ~= nil) then
		local trial_count = trial_group:GroupCount();

		for i = 0, trial_count - 1, 1 do
			local client_v = trial_group:GetMember(i):CastToClient();

			if (client_v.valid) then
				-- check the distance and port them up if close enough
				if (client_v:CalculateDistance(src_x, src_y, src_z) <= distance) then
					-- port the player up
					client_v:MovePC(201, tgt_x, tgt_y, tgt_z, tgt_h);
				end
			end
		end
	end
end
