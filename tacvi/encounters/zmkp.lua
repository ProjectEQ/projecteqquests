local ZMKP_Active = "1,1^2,1^3,1^5,1^7,1^13,1^14,1^15,1^16,1^17,1^21,1^42,1";
local ZMKP_Inactive = "19,1^20,1^21,1^24,1^25,1";

local ZMKP_AC     = 568; -- Defense
local ZMKP_MaxHit = 3900; -- Fury
local ZMKP_MinHit = 1430;
local ZMKP_AtkHit = 400; -- Rage
local ZMKP_Delay  = 20;

-- Time out on Balancing seemed to be about 70 seconds
local ZMKP_Balance_Timer = 70 * 1000;
local ZMKP_Fury = 100;
local ZMKP_Rage = 100;
local ZMKP_Speed = 100;
local ZMKP_Defense = 100;
local target_hp = 90;
local defense_balanced = false;
local fury_balanced = false;
local rage_balanced = false;
local speed_balanced = false;

function ZMKP_Spawn(e)
	eq.spawn2(298125, 0, 0, 412.0, -714.0, -4.125, 454); -- NPC: #Balance_of_Speed
	eq.spawn2(298126, 0, 0, 339.0, -714.0, -4.125, 88); -- NPC: #Balance_of_Defense
	eq.spawn2(298127, 0, 0, 412.0, -646.0, -4.125, 318); -- NPC: #Balance_of_Fury
	eq.spawn2(298128, 0, 0, 339.0, -646.0, -4.125, 190); -- NPC: #Balance_of_Rage

	ZMKP_AC     = 568; -- Defense
	ZMKP_MaxHit = 3900; -- Fury
	ZMKP_MinHit = 1430;
	ZMKP_AtkHit = 400; -- Rage
	ZMKP_Delay  = 20;

	e.self:ModifyNPCStat("ac",            tostring(ZMKP_AC));
	e.self:ModifyNPCStat("max_hit",       tostring(ZMKP_MaxHit));
	e.self:ModifyNPCStat("min_hit",       tostring(ZMKP_MinHit));
	e.self:ModifyNPCStat("atk",           tostring(ZMKP_AtkHit));
	e.self:ModifyNPCStat("attack_delay",  tostring(ZMKP_Delay));
	eq.set_next_hp_event(90);
	target_hp = 90;
end

function ZMKP_Combat(e)
	if e.joined then
		e.self:Emote("Come you fools! Show me your strongest warrior and I will show you my first victim.");
	else
		eq.set_timer("wipecheck", 1 * 1000);
	end
end

function ZMKP_Timer(e)
	if e.timer == 'balance' then
		eq.stop_timer(e.timer);
		eq.stop_timer("wipecheck");
		eq.signal(298125, 1); -- NPC: #Balance_of_Speed
		eq.signal(298126, 1); -- NPC: #Balance_of_Defense
		eq.signal(298127, 1); -- NPC: #Balance_of_Fury
		eq.signal(298128, 1); -- NPC: #Balance_of_Rage

		local failed = false;

		if not speed_balanced then
			-- Reduce ZMKP's Attack Delay by 10% each time the Speed mob is out of Balance.
			ZMKP_Delay = ZMKP_Delay * 0.90;
			e.self:ModifyNPCStat("attack_delay",  tostring(ZMKP_Delay));
			failed = true;
		end
		if not defense_balanced then
			ZMKP_AC = ZMKP_AC + 100;
			e.self:ModifyNPCStat("ac",            tostring(ZMKP_AC));
			failed = true;
		end
		if not fury_balanced then
			ZMKP_MaxHit = ZMKP_MaxHit + 585;
			ZMKP_MinHit = ZMKP_MinHit + 215;
			e.self:ModifyNPCStat("max_hit",       tostring(ZMKP_MaxHit));
			e.self:ModifyNPCStat("min_hit",       tostring(ZMKP_MinHit));
			failed = true;
		end
		if not rage_balanced then
			ZMKP_AtkHit = ZMKP_AtkHit + 200;
			e.self:ModifyNPCStat("atk",           tostring(ZMKP_AtkHit));
			failed = true;
		end

		if failed then
			eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, "Your failure to balance the scales has added to Kvxe's already impressive skills.");
		else
			eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, "Kvxe's body trembles as he fails to gather power from the balanced scales.");
		end

		-- so dots will oddly still hurt him, with enough necros it is possible to skip an event if we just used HP events (live doesn't skip, probably does if you manage to kill him though)
		-- So instead of just using straight HP events, we gotta do some checking here!
		if math.floor(e.self:GetHPRatio()) <= (target_hp - 10) then
				-- we'll we gotta skip an active phase basically, to next balance!
				eq.set_timer("balance", ZMKP_Balance_Timer);
				eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, "Kvxe enters a state of battle meditation.");
				e.self:SetOOCRegen(0);
				target_hp = target_hp - 10;

				eq.signal(298125, 2); -- NPC: #Balance_of_Speed
				eq.signal(298126, 2); -- NPC: #Balance_of_Defense
				eq.signal(298127, 2); -- NPC: #Balance_of_Fury
				eq.signal(298128, 2); -- NPC: #Balance_of_Rage
		else
				e.self:ProcessSpecialAbilities(ZMKP_Active);
				target_hp = target_hp - 10;
				eq.set_next_hp_event(target_hp);
		end
	elseif e.timer == "wipecheck" then
		-- Check to see if there are any Clients in the room with ZMKP
		local client = eq.get_entity_list():GetRandomClient(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 9000);
		if not client:IsClient() then
			-- Clean up after a wipe
			eq.depop_all(298125);
			eq.depop_all(298126);
			eq.depop_all(298127);
			eq.depop_all(298128);

			eq.spawn2(298029, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: Zun`Muram_Kvxe_Pirik
			eq.depop();

			eq.signal(298223,2); -- Unlock Doors
		end
	end
end

function ZMKP_Hp(e)
	if e.hp_event == 90 then
		eq.signal(298223,1); -- Lock Doors

		eq.set_timer("balance", ZMKP_Balance_Timer);
		eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, "Kvxe enters a state of battle meditation.");
		e.self:ProcessSpecialAbilities(ZMKP_Inactive);
		e.self:SetOOCRegen(0);
		e.self:WipeHateList();

		eq.signal(298125, 2); -- NPC: #Balance_of_Speed
		eq.signal(298126, 2); -- NPC: #Balance_of_Defense
		eq.signal(298127, 2); -- NPC: #Balance_of_Fury
		eq.signal(298128, 2); -- NPC: #Balance_of_Rage
	elseif e.hp_event == 80 then
		eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, "Kvxe enters a state of battle meditation.");
		eq.set_timer("balance", ZMKP_Balance_Timer);
		e.self:ProcessSpecialAbilities(ZMKP_Inactive);
		e.self:SetOOCRegen(0);
		e.self:WipeHateList();

		eq.signal(298125, 2); -- NPC: #Balance_of_Speed
		eq.signal(298126, 2); -- NPC: #Balance_of_Defense
		eq.signal(298127, 2); -- NPC: #Balance_of_Fury
		eq.signal(298128, 2); -- NPC: #Balance_of_Rage
	elseif e.hp_event == 70 then
		eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, "Kvxe enters a state of battle meditation.");
		eq.set_timer("balance", ZMKP_Balance_Timer);
		e.self:ProcessSpecialAbilities(ZMKP_Inactive);
		e.self:SetOOCRegen(0);
		e.self:WipeHateList();

		eq.signal(298125, 2); -- NPC: #Balance_of_Speed
		eq.signal(298126, 2); -- NPC: #Balance_of_Defense
		eq.signal(298127, 2); -- NPC: #Balance_of_Fury
		eq.signal(298128, 2); -- NPC: #Balance_of_Rage
	elseif e.hp_event == 60 then
		eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, "Kvxe enters a state of battle meditation.");
		eq.set_timer("balance", ZMKP_Balance_Timer);
		e.self:ProcessSpecialAbilities(ZMKP_Inactive);
		e.self:SetOOCRegen(0);
		e.self:WipeHateList();

		eq.signal(298125, 2); -- NPC: #Balance_of_Speed
		eq.signal(298126, 2); -- NPC: #Balance_of_Defense
		eq.signal(298127, 2); -- NPC: #Balance_of_Fury
		eq.signal(298128, 2); -- NPC: #Balance_of_Rage
	elseif e.hp_event == 50 then
		eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, "Kvxe enters a state of battle meditation.");
		eq.set_timer("balance", ZMKP_Balance_Timer);
		e.self:ProcessSpecialAbilities(ZMKP_Inactive);
		e.self:SetOOCRegen(0);
		e.self:WipeHateList();

		eq.signal(298125, 2); -- NPC: #Balance_of_Speed
		eq.signal(298126, 2); -- NPC: #Balance_of_Defense
		eq.signal(298127, 2); -- NPC: #Balance_of_Fury
		eq.signal(298128, 2); -- NPC: #Balance_of_Rage
	elseif e.hp_event == 40 then
		eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, "Kvxe enters a state of battle meditation.");
		eq.set_timer("balance", ZMKP_Balance_Timer);
		e.self:ProcessSpecialAbilities(ZMKP_Inactive);
		e.self:SetOOCRegen(0);
		e.self:WipeHateList();

		eq.signal(298125, 2); -- NPC: #Balance_of_Speed
		eq.signal(298126, 2); -- NPC: #Balance_of_Defense
		eq.signal(298127, 2); -- NPC: #Balance_of_Fury
		eq.signal(298128, 2); -- NPC: #Balance_of_Rage
	elseif e.hp_event == 30 then
		eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, "Kvxe enters a state of battle meditation.");
		eq.set_timer("balance", ZMKP_Balance_Timer);
		e.self:ProcessSpecialAbilities(ZMKP_Inactive);
		e.self:SetOOCRegen(0);
		e.self:WipeHateList();

		eq.signal(298125, 2); -- NPC: #Balance_of_Speed
		eq.signal(298126, 2); -- NPC: #Balance_of_Defense
		eq.signal(298127, 2); -- NPC: #Balance_of_Fury
		eq.signal(298128, 2); -- NPC: #Balance_of_Rage
	elseif e.hp_event == 20 then
		eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, "Kvxe enters a state of seething rage as he accelerates his combat speed.");
		ZMKP_Delay = ZMKP_Delay * 0.90;
		e.self:ModifyNPCStat("attack_delay",  tostring(ZMKP_Delay));
	end
end

function ZMKP_Signal(e)
end

function ZMKP_Death(e)
	eq.signal(298223, 298029); -- NPC: zone_status

	eq.depop_all(298125);
	eq.depop_all(298126);
	eq.depop_all(298127);
	eq.depop_all(298128);
	eq.signal(298223,2,1000); -- Unlock Doors
end

function ZMKP_Spawn_Speed(e)
	e.self:SetOOCRegen(0);
end

function ZMKP_Spawn_Defense(e)
	e.self:SetOOCRegen(0);
end

function ZMKP_Spawn_Fury(e)
	e.self:SetOOCRegen(0);
end

function ZMKP_Spawn_Rage(e)
	e.self:SetOOCRegen(0);
end

function ZMKP_Signal_Balance(e)
	if e.signal == 1 then
		e.self:ProcessSpecialAbilities(ZMKP_Inactive);
		e.self:SetHP(e.self:GetMaxHP());
		e.self:WipeHateList();

		-- lets double check
		if e.self:GetHPRatio() <= (target_hp - 3) then
			local id = e.self:GetNPCTypeID();
			if id == 298125 then
				speed_balanced = false;
			elseif id == 298126 then
				defense_balanced = false;
			elseif id == 298127 then
				fury_balanced = false;
			elseif id == 298128 then
				rage_balanced = false;
			end
			eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, e.self:GetCleanName() .. " is falling out of balance.");
		end
	elseif e.signal == 2 then
		defense_balanced = false;
		fury_balanced = false;
		rage_balanced = false;
		speed_balanced = false;

		eq.set_next_hp_event(target_hp + 3);
		e.self:ProcessSpecialAbilities("42,1")
		e.self:SetHP(e.self:GetMaxHP());
		e.self:WipeHateList();
	end
end

function ZMKP_Hp_Balance(e)
	if e.hp_event == (target_hp + 3) then
		local id = e.self:GetNPCTypeID();
		if id == 298125 then
			speed_balanced = true;
		elseif id == 298126 then
			defense_balanced = true;
		elseif id == 298127 then
			fury_balanced = true;
		elseif id == 298128 then
			rage_balanced = true;
		end
		eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, e.self:GetCleanName() .. " seems to be tipping in your favor.");
		eq.set_next_hp_event(target_hp - 3)
	elseif e.hp_event == (target_hp - 3) then
		local id = e.self:GetNPCTypeID();
		if id == 298125 then
			speed_balanced = false;
		elseif id == 298126 then
			defense_balanced = false;
		elseif id == 298127 then
			fury_balanced = false;
		elseif id == 298128 then
			rage_balanced = false;
		end
		eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, e.self:GetCleanName() .. " is falling out of balance.");
	end
end

function event_encounter_load(e)
	eq.register_npc_event('zmkp', Event.spawn,          298029, ZMKP_Spawn);
	eq.register_npc_event('zmkp', Event.combat,         298029, ZMKP_Combat);
	eq.register_npc_event('zmkp', Event.timer,          298029, ZMKP_Timer);
	eq.register_npc_event('zmkp', Event.hp,             298029, ZMKP_Hp);
	eq.register_npc_event('zmkp', Event.signal,         298029, ZMKP_Signal);
	eq.register_npc_event('zmkp', Event.death_complete, 298029, ZMKP_Death);

	eq.register_npc_event('zmkp', Event.spawn,          298125, ZMKP_Spawn_Speed);
	eq.register_npc_event('zmkp', Event.spawn,          298126, ZMKP_Spawn_Defense);
	eq.register_npc_event('zmkp', Event.spawn,          298127, ZMKP_Spawn_Fury);
	eq.register_npc_event('zmkp', Event.spawn,          298128, ZMKP_Spawn_Rage);

	eq.register_npc_event('zmkp', Event.signal,         298125, ZMKP_Signal_Balance);
	eq.register_npc_event('zmkp', Event.signal,         298126, ZMKP_Signal_Balance);
	eq.register_npc_event('zmkp', Event.signal,         298127, ZMKP_Signal_Balance);
	eq.register_npc_event('zmkp', Event.signal,         298128, ZMKP_Signal_Balance);

	eq.register_npc_event('zmkp', Event.hp,             298125, ZMKP_Hp_Balance);
	eq.register_npc_event('zmkp', Event.hp,             298126, ZMKP_Hp_Balance);
	eq.register_npc_event('zmkp', Event.hp,             298127, ZMKP_Hp_Balance);
	eq.register_npc_event('zmkp', Event.hp,             298128, ZMKP_Hp_Balance);
end
