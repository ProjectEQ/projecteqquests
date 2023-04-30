local rage_fury = 0;
local counter = 0;
local instance_id = eq.get_zone_instance_id();

function event_say(e)
	if rage_fury == 0 then
		if e.message:findi("hail") then
			e.self:Say("The paths of fury and rage will unlock the way to the chambers of destruction. Behind each behemoth lies the hallways of fury and rage. I am one of few spirits whose souls have been cleansed of the corruption of Trushar. Now you must cleanse the taint of destruction from your spirit. In order to do this, you must tempt yourself with power. Only those who are worthy can walk the path of destruction. Defeating the harbingers of rage and fury is the only way to remove the taint that fills these halls. I would advise battling them simultaneously, as one will offer their power to the other shortly after being defeated. If you are successful, each altar will grant you its power and unlock the Chamber of Rites behind me. There you must give the power from each altar to its spectral keeper. If you are fast enough, you will remove the taint and gain access to the main ritual halls. That is where you will find Barxt and his followers. That is where your might will truly be tested. Tell me when you are [ready].");
		elseif e.message:findi("ready") then
			if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(292054) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(292053) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(292042) then
				--traps 1 2 and 3 have to be down to proceed
				e.self:Say("May your gods protect you. Let the trials begin.");
				rage_fury = 1;
				eq.depop(292019);
				eq.depop(292020);
				eq.spawn2(292056,0,0,-822,-1249,8,376); -- NPC: a_rage_behemoth
				eq.spawn2(292055,0,0,-917,-1251,8,122); -- NPC: a_fury_behemoth
				eq.set_timer("fail", 90 * 60 * 1000); -- 90 Minutes to failure
			else
				e.self:Say("The forces of the Trusik in the main entrance passages are still strong.  I am not sure how you bypassed them, but you will surely have no chance unless you rout them before proceeding any further.");
			end
		end
	end
end

function event_timer(e)
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self);

	if e.timer == "fail" then
		eq.stop_timer("fail_timer");
		eq.set_global(instance_id.."_destper","1",3,"H6");
		eq.zone_emote(15,"Your time has elapsed, you must suffer the punishment of failure, there is nothing I can do to help now.");
	elseif e.timer == "orb" then
		eq.stop_timer("orb");
		eq.set_global(instance_id.."_spectre_door","1",3,"H6");

		-- Room Trash
		-- Charmable
		eq.spawn2(292063,0,0,-836,-692,25,510);
		eq.spawn2(292063,0,0,-906,-636,25,26);

		-- Non-Charmable
		eq.spawn2(eq.ChooseRandom(292062,292064,292085),0,0,-869,-691,25,508);
		eq.spawn2(eq.ChooseRandom(292062,292064,292085),0,0,-836,-637,26,254);
		eq.spawn2(eq.ChooseRandom(292062,292064,292085),0,0,-906,-692,25,26);
		eq.spawn2(eq.ChooseRandom(292062,292064,292085),0,0,-883,-636,26,266);
		eq.spawn2(eq.ChooseRandom(292062,292064,292085),0,0,-850,-637,26,254);

		-- Pre-Vrex Mini
		eq.spawn2(292065,5,0,-871,-209,59,250);	-- NPC: #Devastating_Construct
		
		-- Vrex Event
		eq.spawn2(292066,0,0,-871,-209,59,250);	-- NPC: #Preshna_the_Lost
		eq.spawn2(292067,0,0,-866,-43,61,260);	-- NPC: #Guardian_of_Destruction
		eq.spawn2(292068,0,0,-869,-16,65,250);	-- NPC: Vrex_Barxt_Qurat

		eq.spawn2(292086,0,0,-813,-74,59,472);	-- SW 1st
		eq.spawn2(292086,0,0,-902,-83,59,26);	-- SE 1st
		eq.spawn2(292086,0,0,-904,109,59,226);	-- NE 1st
		eq.spawn2(292086,0,0,-827,110,59,270);	-- NW 1st

		eq.spawn2(292087,0,0,-822,-77,59,474);	-- SW 2nd
		eq.spawn2(292087,0,0,-911,-79,59,22);	-- SE 2nd
		eq.spawn2(292087,0,0,-895,112,59,228);	-- NE 2nd
		eq.spawn2(292087,0,0,-817,106,59,282);	-- NW 2nd

		eq.spawn2(292088,0,0,-830,-83,59,478);	-- SW 3rd
		eq.spawn2(292088,0,0,-921,-76,59,32);	-- SE 3rd
		eq.spawn2(292088,0,0,-886,117,59,226);	-- NE 3rd
		eq.spawn2(292088,0,0,-808,102,59,290);	-- NW 3rd

		eq.get_entity_list():FindDoor(4):SetLockPick(0);

		eq.depop();
	end
end

function event_signal(e)
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self);
	counter = counter + 1;
	if counter == 2 then
		eq.stop_timer("fail_timer");
		if qglobals[instance_id.. '_destper'] == nil then
			eq.set_global(instance_id.."_destoff","1",3,"H6");
			eq.zone_emote(MT.Yellow,"The Altar of Fury and Altar of Rage hum in harmony. A bright flash of light illuminates the room momentarily, causing the tendrils of murky shadow to dissipate. The Aura of Destruction has faded away.");
		end
		eq.zone_emote(MT.Yellow,"A strange voice shouts, You fools! While you may have stopped the rituals of fury and rage, you are still too late to prevent me from transferring the power of Trushar into our stone guardian. If you wish death, then continue into my chambers!");
		eq.set_timer("orb",20 * 1000) -- 20s to spawn
	end
end
