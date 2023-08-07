-- Jevlan Event

local event_started		= false;
local tanthi_aggro		= false;
local tantho_aggro		= false;
local tanthu_aggro		= false;
local depopping			= false;

local relinquish_spell	= false;
local torment_spell		= false;
local suppression_spell	= false;
local blessing_spell	= true;

local lowest_npc		= 0;

function Jelvan_Spawn()
	clear_event(e);
end

function clear_event(e)
	eq.stop_all_timers();
	event_started		= false;
	tanthi_aggro		= false;
	tantho_aggro		= false;
	tanthu_aggro		= false;
	relinquish_spell	= false;
	torment_spell		= false;
	suppression_spell	= false;
	blessing_spell		= true;
	lowest_npc			= 0;
end

function Jelvan_Say(e)
	if not event_started then
		if e.message:findi("hail") then
			e.self:Emote("grabs his head in pain. 'The voices. Make them stop. My thoughts are my own! You will not break me! Shhh. Can you [" .. eq.say_link("hear") .. "] them?");
		elseif e.message:findi("hear") then
			e.self:Say("The tormentors. They are trying to break me. They want me to be one of them. They want my power. You must [help] me. You must destroy them.");
		elseif e.message:findi("help") then
			e.self:Say("They must be killed! They... Can you here them? They are coming close. I will help you while I can, but I can already feel their taint seeping into my bones");
			clear_event(e);
			event_started		= true;
			depopping			= true;
			eq.unique_spawn(317099,0,0, -174, 2152, -149, 334);	-- NPC: Tanthi_the_Tormentor
			eq.unique_spawn(317100,0,0, -341, 2152, -149, 154);	-- NPC: Tantho_the_Tormentor
			eq.unique_spawn(317101,0,0, -252, 2008, -149, 0);	-- NPC: Tanthu_the_Tormentor
			eq.set_timer("check_event_status", 1 * 1000);
			eq.set_timer("balance_check", 1 * 1000);
			eq.set_timer("blessing_check", 60 * 1000);
			eq.set_timer("check_leash", 3 * 1000);
			eq.set_timer("depop_event", 15 * 1000);				--depop 15 sec if no aggro
		end
	end
end

function Jelvan_Timer(e)
	if e.timer == "check_event_status" then
		local tormentors_alive = 0;

		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(317099) then
			tormentors_alive = tormentors_alive + 1;
		else
			tanthi_aggro = false;
		end

		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(317100) then
			tormentors_alive = tormentors_alive + 1;
		else
			tantho_aggro = false;
		end

		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(317101) then
			tormentors_alive = tormentors_alive + 1;
		else
			tanthu_aggro = false;
		end

		if tormentors_alive == 0 then -- Event Win
			--set player lockout
			--chance to spawn 2.0 orb, if so set zone lockout for "bottom orb"			
			eq.signal(317116,317004); -- NPC: zone_status
			eq.unique_spawn(317111,0,0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: Jelvan`s_Keepsake
			eq.zone_emote(MT.Yellow,"You hear Jelvan's shouts of gratitude as he runs into the shadows.");	
			event_started = false;
			eq.depop();
		elseif tormentors_alive == 1 then -- Only 1 boss left, no balance
			eq.stop_timer("balance_check");
		elseif not tanthi_aggro and not tantho_aggro and not tanthu_aggro and not depopping then -- No one on aggro, start reset
			eq.set_timer("depop_event", 15 * 1000);
			depopping = true;
		elseif depopping and (tanthi_aggro or tantho_aggro or tanthu_aggro) then -- On Aggro, stop reset event
			eq.stop_timer("depop_event");
			depopping = false;
		end
	elseif e.timer == "depop_event" then
		if not tanthi_aggro and not tantho_aggro and not tanthu_aggro and depopping then -- Still not on aggro, reset event
			clear_event(e);
			eq.depop_all(317099);
			eq.depop_all(317100);
			eq.depop_all(317101);
		end
	elseif e.timer == "check_leash" then
			Leash_Tormentors(e);
	elseif e.timer == "balance_check" and (tanthi_aggro or tantho_aggro or tanthu_aggro) then
		local tanthi_hp		= 100;
		local tantho_hp		= 100;
		local tanthu_hp		= 100;
		local tanthi_diff	= 0;
		local tantho_diff	= 0;
		local tanthu_diff	= 0;
		local tanthi_alive	= false;
		local tantho_alive	= false;
		local tanthu_alive	= false;
		local lowest_hp		= 100;
		local highest_hp	= 0;
		local hp_difference	= 0;

		lowest_npc			= 0;

		--if alive get hp and see who is lowest
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(317099) then
			tanthi_alive	= true;
			tanthi_hp		= eq.get_entity_list():GetNPCByNPCTypeID(317099):GetHPRatio();
			lowest_hp		= tanthi_hp;
			highest_hp		= tanthi_hp;
			lowest_npc		= 317099;
		end

		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(317100) then
			tantho_alive	= true;
			tantho_hp		= eq.get_entity_list():GetNPCByNPCTypeID(317100):GetHPRatio();
			if tantho_hp < lowest_hp then
				lowest_hp	= tantho_hp;
				lowest_npc	= 317100;
			end

			if tantho_hp > highest_hp then
				highest_hp	= tantho_hp;
			end
		end

		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(317101) then
			tanthu_alive	= true;
			tanthu_hp		= eq.get_entity_list():GetNPCByNPCTypeID(317101):GetHPRatio();
			if tanthu_hp < lowest_hp then
				lowest_hp	= tanthu_hp;
				lowest_npc	= 317101;
			end

			if tanthu_hp > highest_hp then
				highest_hp	= tanthu_hp;
			end
		end

		hp_difference = math.abs(highest_hp - lowest_hp);

		if hp_difference >= 20 then -- No Blessing and all 3 AOES
			if not suppression_spell then
				suppression_spell = true;
				eq.set_timer("suppression_spell", 60 * 1000);
			end
		else
			suppression_spell = false;
			eq.stop_timer("suppression_spell");
		end

		if hp_difference >= 15 then -- No Blessing and 2 AOES
			if not torment_spell then
				torment_spell = true;
				eq.set_timer("torment_spell", 60 * 1000);
			end
		else
			torment_spell = false;
			eq.stop_timer("torment_spell");
		end

		if hp_difference >= 11 then -- No Bless and 1 AOE
			if not relinquish_spell then
				relinquish_spell = true;
				eq.set_timer("relinquish_spell", 60 * 1000);
			end
		else
			relinquish_spell = false
			eq.stop_timer("relinquish_spell");
		end

		if hp_difference >= 6 then -- No Blessing and No AOES
			if blessing_spell then
				blessing_spell = false;
				e.self:Shout("My power is theirs...I'm sorry, I cannot... fight... them...");
			end
		else  -- Blessing and No AoEs
			blessing_spell = true;
		end
	elseif e.timer == "blessing_check" then
		if blessing_spell then -- In Balance
			e.self:CastSpell(5674,eq.get_entity_list():GetNPCByNPCTypeID(317099):GetTarget():GetID(),0,1); -- Spell: Blessing of Jelvan
			e.self:CastSpell(5674,eq.get_entity_list():GetNPCByNPCTypeID(317100):GetTarget():GetID(),0,1); -- Spell: Blessing of Jelvan
			e.self:CastSpell(5674,eq.get_entity_list():GetNPCByNPCTypeID(317101):GetTarget():GetID(),0,1); -- Spell: Blessing of Jelvan
			e.self:Shout("Here you go! This should help!");
		else -- Out of balance, just emote as spells are sep timers
			local npc = eq.get_entity_list():GetNPCByNPCTypeID(lowest_npc);
			if npc.valid then
				npc:Emote("calls for Jelvan's assistance as the balance tips.");
			end
		end
	elseif e.timer == "suppression_spell" then
		eq.signal(lowest_npc, 10);
	elseif e.timer == "torment_spell" then
		eq.signal(lowest_npc, 11);
	elseif e.timer == "relinquish_spell" then
		eq.signal(lowest_npc, 12);
	end
end

function Tormentor_Combat(e)
	local myid = e.self:GetNPCTypeID();
	if e.joined then
		eq.set_timer("cast", 	math.random(10,45) * 1000);

		if myid == 317099 then
			tanthi_aggro = true;
		elseif myid == 317100 then
			tantho_aggro = true;
		elseif myid == 317101 then
			tanthu_aggro = true;
		end

		Aggro_Tormentor(e);
	else
		eq.stop_all_timers();

		if myid == 317099 then
			tanthi_aggro = false;
		elseif myid == 317100 then
			tantho_aggro = false;
		elseif myid == 317101 then
			tanthu_aggro = false;
		end
	end
end

function Aggro_Tormentor(e)
	eq.get_entity_list():GetNPCByNPCTypeID(317099):AddToHateList(e.self:GetHateTop(),1)
	eq.get_entity_list():GetNPCByNPCTypeID(317100):AddToHateList(e.self:GetHateTop(),1)
	eq.get_entity_list():GetNPCByNPCTypeID(317101):AddToHateList(e.self:GetHateTop(),1)
end

function Tormentor_Timer(e)
	local myid = e.self:GetNPCTypeID(); 
	if myid == 317099 and e.timer == "cast" then		
		e.self:CastSpell(5678, e.self:GetTarget():GetID()); -- Spell: Wail of Anguish
		eq.set_timer("cast", 45 * 1000);
	elseif myid == 317100 and e.timer == "cast" then
		e.self:CastSpell(5679, e.self:GetTarget():GetID()); -- Spell: Touch of Anguish
		eq.set_timer("cast", 45 * 1000);
	elseif myid == 317101 and e.timer == "cast" then
		e.self:CastSpell(5680, e.self:GetTarget():GetID()); -- Spell: Gaze of Anguish
		eq.set_timer("cast", 45 * 1000);		
	elseif e.timer == "check_leash" then	
		if e.self:CalculateDistance( -256, 2100, -120.9) > 140 or e.self:GetZ() > -130 or e.self:GetZ() < -160 then
			Leash_Tormentors(e);		
		end
	elseif e.timer == "unleash" then
		eq.stop_timer("leasing");
	end
end

function Tormentor_Signal(e)
	if e.signal == 1 then
		local instance_id = eq.get_zone_instance_id();
		eq.get_entity_list():GetNPCByNPCTypeID(317099):CastSpell(16234,0,0,1);
		eq.get_entity_list():GetNPCByNPCTypeID(317100):CastSpell(16234,0,0,1);
		eq.get_entity_list():GetNPCByNPCTypeID(317101):CastSpell(16234,0,0,1);
		e.self:ForeachHateList(
			function(ent, hate, damage, frenzy)
				if ent:IsClient() then
					local currclient = ent:CastToClient();
					currclient:MovePCInstance(317,instance_id, e.self:GetSpawnPointX(),e.self:GetSpawnPointY(),e.self:GetSpawnPointZ(),0); -- Zone: anguish
				end
			end
		);	
	elseif e.signal == 10 then -- Spell: Void of Suppression
		e.self:CastSpell(5677, e.self:GetTarget():GetID()); -- Spell: Void of Suppression
	elseif e.signal == 11 then -- Spell: Torment of Body
		e.self:CastSpell(5676, e.self:GetTarget():GetID()); -- Spell: Torment of Body
	elseif e.signal == 12 then -- Spell: Relinquish Spirit
		e.self:CastSpell(5675, e.self:GetTarget():GetID()); -- Spell: Relinquish Spirit
	end
end

function Leash_Tormentors()
	local tanthi_l = eq.get_entity_list():GetNPCByNPCTypeID(317099);
	local tantho_o = eq.get_entity_list():GetNPCByNPCTypeID(317100);
	local tanthu_u = eq.get_entity_list():GetNPCByNPCTypeID(317101);
	
	if tanthi_l.valid then
		if tanthi_l:CalculateDistance( -256, 2100, -120.9) > 140 or tanthi_l:GetZ() > -130 or tanthi_l:GetZ() < -160 then
			eq.signal(317099,1); -- NPC: Tanthi_the_Tormentor
		end
	elseif tantho_o.valid then
		if tantho_o:CalculateDistance( -256, 2100, -120.9) > 140 or tantho_o:GetZ() > -130 or tantho_o:GetZ() < -160 then
			eq.signal(317100,1); -- NPC: Tantho_the_Tormentor
		end
	elseif tanthu_u.valid then
		if tanthu_u:CalculateDistance( -256, 2100, -120.9) > 140 or tanthu_u:GetZ() > -130 or tanthu_u:GetZ() < -160 then
			eq.signal(317101,1); -- NPC: Tanthu_the_Tormentor
		end
	end
end

function event_encounter_load(e)
	eq.register_npc_event('jelvan', Event.spawn,	317004, Jelvan_Spawn);
	eq.register_npc_event('jelvan', Event.say,		317004, Jelvan_Say);
	eq.register_npc_event('jelvan', Event.timer,	317004, Jelvan_Timer);

	eq.register_npc_event('jelvan', Event.combat,	317099, Tormentor_Combat);
	eq.register_npc_event('jelvan', Event.timer,	317099, Tormentor_Timer);  
	eq.register_npc_event('jelvan', Event.combat,	317100, Tormentor_Combat);
	eq.register_npc_event('jelvan', Event.timer,	317100, Tormentor_Timer);
	eq.register_npc_event('jelvan', Event.combat,	317101, Tormentor_Combat);
	eq.register_npc_event('jelvan', Event.timer,	317101, Tormentor_Timer);

	eq.register_npc_event('jelvan', Event.signal,	317099, Tormentor_Signal);
	eq.register_npc_event('jelvan', Event.signal,	317100, Tormentor_Signal);
	eq.register_npc_event('jelvan', Event.signal,	317101, Tormentor_Signal);
end

function event_encounter_unload(e)
end
