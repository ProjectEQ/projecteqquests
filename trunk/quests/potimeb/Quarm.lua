function event_spawn(e)
	eq.set_next_hp_event(76);

end

function event_signal(e)
	if (e.signal == 1) then
		-- start pathing away from spawn point
		eq.start(1);
	end
end

function event_waypoint_arrive(e)
	if (e.wp ==  1) then
		-- stop the pause timer at the end of path.
		eq.stop();
	end
end

function event_combat(e)
	if (e.joined) then
		-- begin 30 second timer to spawn adds
		eq.set_timer("quarm_adds",30000);
	else
		eq.stop_timer("quarm_adds");
	end
end

function event_timer(e)
	if (e.timer == "quarm_adds") then
		local xloc = e.self:GetX();
		local yloc = e.self:GetY();
		local zloc = e.self:GetZ();
		local heading = e.self:GetHeading();
		-- depop all existing time vortex mobs
		eq.depop_all(223112);
		-- spawn 3 new ones randomly around Quarm.
		eq.spawn2(223112,0,0,xloc + math.random(-50,50),yloc + math.random(-50,50),zloc,heading);
		eq.spawn2(223112,0,0,xloc + math.random(-50,50),yloc + math.random(-50,50),zloc,heading);
		eq.spawn2(223112,0,0,xloc + math.random(-50,50),yloc + math.random(-50,50),zloc,heading);
	end
end

function event_hp(e)
	if (e.hp_event == 76) then
		e.self:Emote(" roars in pain as his red head explodes in a shower of flaming ethereal energy!");
		-- remove red head
		e.self:SendIllusionPacket({race=304,gender=2,texture=1,helmtexture=1});
		-- remove fire based PBAE from spellset
		e.self:RemoveAISpell(3768);
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		e.self:Emote(" roars in pain as his blue head explodes into pure ethereal energy!");
		-- remove blue head
		e.self:SendIllusionPacket({race=304,gender=2,texture=2,helmtexture=2});
		-- remove poison based PBAE from spellset
		e.self:RemoveAISpell(3777);
		eq.set_next_hp_event(26);
	elseif (e.hp_event == 26) then
		e.self:Emote(" shakes the cavern with a bellow of pain as the white head explodes into a swirling vortex of ethereal energy!");
		-- remove white head
		e.self:SendIllusionPacket({race=304,gender=2,texture=3,helmtexture=3});
		-- remove ice based PBAE from spellset
		e.self:RemoveAISpell(3773);
	end
end

function event_death_complete(e)
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	-- update the zone status
	eq.set_global(instance_id.."_potimeb_status","QuarmDead",7,"H13");
	-- signal the zone_status that we died
	eq.signal(223097,7);
	-- depop all existing time vortex mobs
	eq.depop_all(223112);
	-- depop untargetable and pop targetable spawn Zebuxoruk's Cage
	eq.depop(223228);
	eq.spawn2(223214,0,0,-579,-1119,60.625,0);
	-- load the current quest globals
	local qglobals = eq.get_qglobals(e.self);
	if ( qglobals.time_emote == "TimeEntered" and e.self:Admin() < 10 ) then
		eq.world_emote(15, "For a brief moment, it feels as if all time has stopped. Inside your mind, you hear a great beast screaming as it takes one last breath. It has been done. The gods have been overthrown.");
		eq.world_emote(15,"After a short moment of peace and joy, you are swallowed by the horror of what has happened. You say, out loud for no one to hear, 'What have we done?'");
		eq.set_global("time_emote","QuarmKilled",7,"F");
	end
end
