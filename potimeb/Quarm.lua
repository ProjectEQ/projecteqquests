--Quarm (223201)
--Phase 6 Final Boss
--potimeb

local phase = 1;

function event_spawn(e)
	phase = 1;
	eq.set_next_hp_event(76);
end

function event_signal(e)
	if (e.signal == 1) then
		-- start pathing away from spawn point
		eq.start(5);
	end
end

function event_waypoint_arrive(e)
	if (e.wp ==  3) then
		-- stop the pause timer at the end of path.
		eq.stop();
	end
end

function event_combat(e)
	if (e.joined) then
		eq.set_timer("quarm_adds",2000);
		eq.set_timer("AE", math.random(1000,3000));
		eq.stop_timer("reset");
	else
		eq.stop_timer("quarm_adds");
		eq.stop_timer("AE");
		eq.set_timer("reset",300000);
	end
end

function event_timer(e)
	if (e.timer == "quarm_adds") then
		eq.stop_timer(e.timer);
		eq.set_timer("quarm_adds",50000);
		SpawnAdds(e)
	elseif (e.timer == "AE") then
		eq.stop_timer(e.timer);
		eq.set_timer("AE", 25000);
		CastAE(e,phase);
	elseif (e.timer == "reset") then
		eq.stop_timer(e.timer);
		e.self:SetHP(e.self:GetMaxHP())
		eq.set_next_hp_event(76);
		phase = 1;
		e.self:SendIllusionPacket({race=304,gender=2,texture=0,helmtexture=0});
	end
end

function SpawnAdds(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	local heading = e.self:GetHeading();
	-- depop all existing time vortex mobs
	eq.depop_all(223112);
	-- spawn 3 new ones randomly around Quarm.
	eq.spawn2(223112,0,0,xloc + math.random(-50,50),yloc + math.random(-50,50),3,heading);
	eq.spawn2(223112,0,0,xloc + math.random(-50,50),yloc + math.random(-50,50),3,heading);
	eq.spawn2(223112,0,0,xloc + math.random(-50,50),yloc + math.random(-50,50),3,heading);
end

--controls AI spells that will change each time Quarm loses a head
function CastAE(e,phase)
	--initial spell lineup: Epoch Conviction(3767), Infernal Flames(3768), Glacier Breath(3769), Venomed Mist(3770), Plagued Earth(3771) 
	if (phase == 1) then
		spell = eq.ChooseRandom(3767,3768,3769,3770,3771);
	--Phase 2 spells used: Epoch Conviction(3772), Glacier Breath(3773), Venomed Mist(3774), Plagued Earth(3775) 
	elseif(phase == 2) then		
		spell = eq.ChooseRandom(3772,3773,3774,3775);
	--Phase 3 spells used: Epoch Conviction(3776), Venom Blast(3777), Plagued Earth(3778)
	elseif(phase == 3) then
		spell = eq.ChooseRandom(3776,3777,3778);
	--Final Phase spells used: Epoch Conviction(3779), Plague Seism(3780)	
	else
		spell = eq.ChooseRandom(3779,3780);
	end
	eq.GM_Message(MT.Lime,string.format("HP Ratio [%s]  AE Spell Chosen[%s]",tostring(e.self:GetHPRatio()),tostring(spell)));	--debug
	e.self:CastSpell(spell,e.self:GetID());
end
		

function event_hp(e)
	if (e.hp_event == 76) then
		phase = 2;
		e.self:Emote(" roars in pain as his red head explodes in a shower of flaming ethereal energy!");
		-- remove red head
		e.self:SendIllusionPacket({race=304,gender=2,texture=0,helmtexture=1});
		DispellBuffs(e);
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		phase = 3;
		e.self:Emote(" roars in pain as his blue head explodes into pure ethereal energy!");
		-- remove blue head
		e.self:SendIllusionPacket({race=304,gender=2,texture=0,helmtexture=2});
		DispellBuffs(e)
		eq.set_next_hp_event(26);
	elseif (e.hp_event == 26) then
		phase = 4;
		e.self:Emote(" shakes the cavern with a bellow of pain as the white head explodes into a swirling vortex of ethereal energy!");
		-- remove white head
		e.self:SendIllusionPacket({race=304,gender=2,texture=0,helmtexture=3});
		DispellBuffs(e)
	end
end

--resets AE timer and dispells all buffs each time a head is killed.  
function DispellBuffs(e)
	eq.stop_timer("AE");
	e.self:BuffFadeAll();
	eq.set_timer("AE",6000);
end

function event_death_complete(e)
	-- signal the zone_status that we died
	eq.signal(223097,7);
	eq.signal(223097,223201); -- Add Lockout
	-- depop all existing time vortex mobs
	eq.depop_all(223112);
	-- depop untargetable and pop targetable spawn Zebuxoruk's Cage
	eq.depop_all(223228);
	eq.spawn2(223214,0,0,-579,-1119,60.625,0);
	-- load the current quest globals
	local qglobals = eq.get_qglobals();

	if ( qglobals.time_emote == "TimeEntered") then
		eq.world_emote(15, "For a brief moment, it feels as if all time has stopped. Inside your mind, you hear a great beast screaming as it takes one last breath. It has been done. The gods have been overthrown.");
		eq.world_emote(15,"After a short moment of peace and joy, you are swallowed by the horror of what has happened. You say, out loud for no one to hear, 'What have we done?'");
		eq.set_global("time_emote","QuarmKilled",7,"F");
	end
end
