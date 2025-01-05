--- PoM 2.0 Bristlebane

-- Variables
local bristlebane_id		= 126373;
local mischievous_jester_id	= 126012;
local event_adds			= {126375,126376,126377,126378};
local next_hp_event			= 90;
local event_stat_stages		= {
	-- [Percent]			= {AC, Min Attack, Max Attack, Attack Delay, mr, cr, fr, pr, dr, "Emote"}
	[10]	= {1587	,715	,1950	,12	,144	,144	,144	,144	,144	,"Bristlebane the King of Thieves shakes with laughter and says, 'You are much stronger than I thought. Looks like I'm gonna have to use all the tricks of the trade!' He then shouts a string of mystical words and suddenly his skin takes on a rock like apppearance and his muscles bulge with incomprehensible strength."},
	[20]	= {1087	,715	,1950	,12	,500	,500	,500	,500	,500	,"Bristlebane the King of Thieves shakes with laughter and says, 'You are much stronger than I thought. Looks like I'm gonna have to use all the tricks of the trade!' He then shouts a string of mystical words and is suddenly surrounded by a magical glowing aura and his muscles bulge with incomprehensible strength."},
	[30]	= {1087	,660	,1800	,8	,500	,500	,500	,500	,500	,"Bristlebane the King of Thieves shakes with laughter and says, 'You are much stronger than I thought. Looks like I'm gonna have to use all the tricks of the trade!' He then shouts a string of mystical words and is suddenly surrounded by a magical glowing aura and his attacks become a blur as he launches into a quickened attack routine."},
	[40]	= {1587	,660	,1800	,12	,500	,500	,500	,500	,500	,"Bristlebane the King of Thieves shakes with laughter and says, 'You are much stronger than I thought. Looks like I'm gonna have to use all the tricks of the trade!' He then shouts a string of mystical words and is suddenly surrounded by a magical glowing aura and his skin takes on a rock like appearance."},
	[50]	= {1087	,715	,1950	,12	,144	,144	,144	,144	,144	,"Bristlebane the King of Thieves shakes with laughter and says, 'You are much stronger than I thought. Looks like I'm gonna have to use all the tricks of the trade!' He then shouts a mystical word of power and suddenly his muscles bulge with incomprehensible strength."},
	[60]	= {1087	,660	,1800	,12	,500	,500	,500	,500	,500	,"Bristlebane the King of Thieves shakes with laughter and says, 'You are much stronger than I thought. Looks like I'm gonna have to use all the tricks of the trade!' He then shouts a mystical word of power and is suddenly surrrounded by a magical glowing aura."},
	[70]	= {1087	,715	,1800	,12	,200	,200	,200	,200	,200	,"Bristlebane the King of Thieves shakes with laughter and says, 'You are much stronger than I thought. Looks like I'm gonna have to use all the tricks of the trade!' He then shouts a mystical word of power and suddenly his muscles bulge with incomprehensible strength."},
	[80]	= {1087	,680	,1904	,12	,500	,500	,500	,500	,500	,"Bristlebane the King of Thieves shakes with laughter and says, 'You are much stronger than I thought. Looks like I'm gonna have to use all the tricks of the trade!' He then shouts a mystical word of power and is suddenly surrrounded by a magical glowing aura."},
	[90]	= {1587	,680	,1904	,12	,144	,96		,96		,96		,96		,"Bristlebane the King of Thieves shakes with laughter and says, 'You are much stronger than I thought. Looks like I'm gonna have to use all the tricks of the trade!' He then shouts a mystical word of power and suddenly his skin begins to take on a rock like appearance."},
	[100]	= {548	,680	,1904	,12	,144	,96		,96		,96		,96		,"You dare try to trick me!"} -- Base Stats
};

-- Event
function evt_bristlebane_spawn(e)
	next_hp_event = 90;
	eq.set_next_hp_event(next_hp_event);
	eq.set_timer("despawn", 2 * 60 * 60 * 1000); -- 2 Hours
end

function evt_bristlebane_combat(e)
	if e.joined then
		eq.stop_timer("reset_event");
		eq.pause_timer("despawn");
		eq.set_timer("aggrolink", 3 * 1000);
	else
		eq.set_timer("reset_event", 60 * 1000); -- 1 Minute Reset
		eq.resume_timer("despawn");
		eq.stop_timer("aggrolink");
	end
end

function evt_bristlebane_hp(e)
	if e.hp_event == next_hp_event and next_hp_event > 0 then
		set_phase(e,next_hp_event);
		next_hp_event = next_hp_event - 10;
		eq.set_next_hp_event(next_hp_event);

		if e.hp_event == 80 then
			eq.spawn2(126375,0,0,-88,886,178,384):AddToHateList(e.self:GetHateRandom(),1);	-- NPC: a_devious_guardian_jokester
			eq.spawn2(126376,0,0,-157,886,178,128):AddToHateList(e.self:GetHateRandom(),1);	-- NPC: a_tricky_guardian_jester 
		elseif e.hp_event == 50 then
			eq.spawn2(126375,0,0,-88,886,178,384):AddToHateList(e.self:GetHateRandom(),1);	-- NPC: a_devious_guardian_jokester
			eq.spawn2(126378,0,0,-157,886,178,128):AddToHateList(e.self:GetHateRandom(),1);	-- NPC: a_charming_guardian_jester
			eq.spawn2(126377,0,0,-127,840,178,0):AddToHateList(e.self:GetHateRandom(),1);	-- NPC: a_dazed_guardian_jester
		elseif e.hp_event == 20 then
			eq.spawn2(126377,0,0,-88,886,178,384):AddToHateList(e.self:GetHateRandom(),1);	-- NPC: a_dazed_guardian_jester
			eq.spawn2(126378,0,0,-157,886,178,128):AddToHateList(e.self:GetHateRandom(),1);	-- NPC: a_charming_guardian_jester
			eq.spawn2(126377,0,0,-146,840,178,0):AddToHateList(e.self:GetHateRandom(),1);	-- NPC: a_dazed_guardian_jester
			eq.spawn2(126377,0,0,-110,840,178,0):AddToHateList(e.self:GetHateRandom(),1);	-- NPC: a_dazed_guardian_jester
			eq.spawn2(126375,0,0,-127,840,178,0):AddToHateList(e.self:GetHateRandom(),1);	-- NPC: a_devious_guardian_jokester
		end
	end
end

function evt_bristlebane_timer(e)
	if e.timer == "despawn" then
		depop_all_event_mobs(e);
		eq.depop();
	elseif e.timer == "reset_event" then
		reset_event(e);
	elseif e.timer == "aggrolink" then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 126375 or npc:GetNPCTypeID() == 126376 or npc:GetNPCTypeID() == 126377 or npc:GetNPCTypeID() == 126378) then
				npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end
	end
end

function reset_event(e)
	depop_all_event_mobs(e);
	e.self:WipeHateList();
	e.self:GotoBind();
	e.self:BuffFadeAll();
	e.self:SetHP(e.self:GetMaxHP());

	set_phase(e,100);
	next_hp_event = 90;
	eq.set_next_hp_event(next_hp_event);
end

function set_phase(e, hp_event)
	e.self:ModifyNPCStat("ac",				tostring(event_stat_stages[hp_event][1]));
	e.self:ModifyNPCStat("min_hit",			tostring(event_stat_stages[hp_event][2]));
	e.self:ModifyNPCStat("max_hit",			tostring(event_stat_stages[hp_event][3]));
	e.self:ModifyNPCStat("attack_delay",	tostring(event_stat_stages[hp_event][4]));
	e.self:ModifyNPCStat("mr",				tostring(event_stat_stages[hp_event][5]));
	e.self:ModifyNPCStat("cr",				tostring(event_stat_stages[hp_event][6]));
	e.self:ModifyNPCStat("fr",				tostring(event_stat_stages[hp_event][7]));
	e.self:ModifyNPCStat("pr",				tostring(event_stat_stages[hp_event][8]));
	e.self:ModifyNPCStat("dr",				tostring(event_stat_stages[hp_event][9]));

	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},MT.LightBlue,500,event_stat_stages[hp_event][10]);
end

function depop_all_event_mobs(e)
	for i = 1, #event_adds do
		eq.depop_all(event_adds[i]);
	end
end

function evt_add_spawn(e)
	eq.set_timer("depop", 2 * 60 * 60 * 1000);
end

function evt_add_combat(e)
	if e.joined then
        if not eq.is_paused_timer("depop") then
            eq.pause_timer("depop");
        end
    else
        eq.resume_timer("depop");
    end
end

function evt_add_timer(e)
	if e.timer == "depop" then
        eq.depop();
    end
end

function evt_jester_death(e)
	eq.unique_spawn(bristlebane_id,0,0,-127,938,186.125,264);	--NPC: Bristlebane_the_King_of_Thieves
	eq.zone_emote(MT.Yellow, "Merry laughter echoes throughout the castle and a cheerful voice is heard saying, 'Come on then if you seek the King of Thieves you must choose wisely! Hurry up lads and lasses!")
end

function event_encounter_load(e)
	eq.register_npc_event(Event.spawn,			bristlebane_id, evt_bristlebane_spawn);
	eq.register_npc_event(Event.combat,			bristlebane_id, evt_bristlebane_combat);
	eq.register_npc_event(Event.hp,				bristlebane_id, evt_bristlebane_hp);
	eq.register_npc_event(Event.timer,			bristlebane_id, evt_bristlebane_timer);

	for i = 1, #event_adds do
		eq.register_npc_event(Event.spawn,			event_adds[i], evt_add_spawn);
		eq.register_npc_event(Event.combat,			event_adds[i], evt_add_combat);
		eq.register_npc_event(Event.timer,			event_adds[i], evt_add_timer);
	end

	eq.register_npc_event(Event.death_complete,	mischievous_jester_id, evt_jester_death);
end
