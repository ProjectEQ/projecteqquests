-- #Bertoxxulous (223142)
--Phase 5 God
--potimeb

function event_spawn(e)
	eq.set_next_hp_event(90);
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("reset");
	else
		eq.set_timer("reset", 5 * 60 * 1000);
	end
end

function event_timer(e)
	if (e.timer == "reset") then
		eq.stop_timer("reset");
		eq.set_next_hp_event(90);
	end
end

--controls min/max hit based on HP %
function event_hp(e)	
	if e.hp_event == 90 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Blisters and festering sores covering Bertoxxulous's hide burst.  A noxious ooze bleeds down his scarred flesh, strengthening his physical body.");
		eq.set_next_hp_event(70);
		SetStats(e,2);		
	elseif e.hp_event == 70 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Blisters and festering sores covering Bertoxxulous's hide burst.  A noxious ooze bleeds down his scarred flesh, strengthening his physical body.");
		eq.set_next_hp_event(55);
		SetStats(e,3)
	elseif e.hp_event == 55 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Blisters and festering sores covering Bertoxxulous's hide burst.  A noxious ooze bleeds down his scarred flesh, strengthening his physical body.");
		eq.set_next_hp_event(40);
		SetStats(e,4)
	elseif e.hp_event == 40 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Bertoxxulous falters, nearly imperceptibly.");
		eq.set_next_hp_event(30);
		SetStats(e,3);
	elseif e.hp_event == 30 then
		eq.set_next_hp_event(10);
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Bertoxxulous falters, nearly imperceptibly.");
		SetStats(e,2);
	elseif e.hp_event == 10 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Bertoxxulous falters, nearly imperceptibly.");
		SetStats(e,1);
	end		
end

function SetStats(e,level)
	local damage_tables = {		[1] = {"940","1700"},
								[2] = {"1040","1800"},
								[3] = {"1145","2000"},
								[4] = {"1250","2200"}
	};

	local resist_tables = {		[1] = {"300"},
								[2] = {"250"},
								[3] = {"200"},
								[4] = {"150"}
	};
	eq.GM_Message(MT.Yellow,string.format("Strength level:[%s/4] min_hit[%s] max_hit[%s] -- Resists [%s]",level,damage_tables[level][1],damage_tables[level][2],resist_tables[level][1]));	--debug
	e.self:ModifyNPCStat("min_hit",damage_tables[level][1]);
	e.self:ModifyNPCStat("max_hit",damage_tables[level][2]);
	e.self:ModifyNPCStat("mr",resist_tables[level][1]);
	e.self:ModifyNPCStat("cr",resist_tables[level][1]);
	e.self:ModifyNPCStat("fr",resist_tables[level][1]);
	e.self:ModifyNPCStat("dr",resist_tables[level][1]);
	e.self:ModifyNPCStat("pr",resist_tables[level][1]);
end

function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,223142); -- Add Lockout
	eq.signal(223097,6);
end
