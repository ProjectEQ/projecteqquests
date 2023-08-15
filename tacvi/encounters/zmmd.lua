local ZMMD_Active = "1,1^2,1^3,1^5,1^7,1^13,1^14,1^15,1^16,1^17,1^21,1^42,1"; 
local ZMMD_Inactive = "18,1^19,1^20,1^21,1^24,1^25,1";
local hp_event = 0;
local adds_killed = 0;
local hp_array = {
	[90] = {0.81, 0.71},
	[70] = {0.65, 0.58, 0.51},
	[50] = {0.47, 0.42, 0.37, 0.31}
}

local kite_time = 180;

function ZMMD_Spawn(e)
	eq.set_next_hp_event(90);
end

function ZMMD_Combat(e)
	if e.joined then
		e.self:Say("Come you fools! Show me your strongest warrior and I will show you my first victim.");
	else
		eq.set_timer("wipecheck", 1 * 1000);
	end
end

function ZMMD_Activate(e)
	-- Damage ZMMD based on adds killed out of adds spawned.
	if adds_killed > 0 and hp_event > 0 then
		e.self:SetHP(e.self:GetMaxHP() * tonumber(hp_array[hp_event][adds_killed]));
	end

	e.self:Emote("'s body begins to glow as the images before you merge back into one. The wounds upon Mordl's body quickly heal as he's infused by the energy, but new wounds appear where his other forms were injured. ");
	e.self:ProcessSpecialAbilities(ZMMD_Active);
	e.self:SetAppearance(0);
	eq.stop_timer("wipecheck");
end

function ZMMD_Inactivate(e)
	e.self:ProcessSpecialAbilities(ZMMD_Inactive);
	e.self:SetAppearance(3);
	e.self:WipeHateList();
	e.self:SetOOCRegen(0);
end

function ZMMD_Timer(e)
	if e.timer == "zmmd_kite" then
		eq.stop_timer(e.timer);
			eq.depop_all(298050);
			eq.depop_all(298051);
			eq.depop_all(298052);
		ZMMD_Activate(e);
	elseif e.timer == "wipecheck" then
		-- Check to see if there are any Clients in the room with ZMKP
		local client = eq.get_entity_list():GetRandomClient(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 8000);
		if not client:IsClient() then
			-- Wipe Mechanics
			eq.signal(298223,2); -- Unlock Doors
			eq.depop_all(298050);
			eq.depop_all(298051);
			eq.depop_all(298052);
			eq.depop_all(298053);
			eq.spawn2(298020, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: Zun`Muram_Mordl_Delt
			eq.depop();
		end
	end
end

function ZMMD_Hp(e)
	hp_event = e.hp_event;
	if e.hp_event == 90 then
		eq.signal(298223,1); -- Lock Doors

		eq.zone_emote(MT.Yellow,"Zun`Muram Mordl Delt's skin begins to bulge and split open, releasing a wave of energy. As his body falls to the floor, two smaller images of the massive creature appear before you.");
		eq.set_next_hp_event(70);

		ZMMD_Inactivate(e);
		adds_killed = 0;
		eq.spawn2(298050,0,0, 367, 130, -6.7, 370); -- NPC: Zun`Muram_Mordl_Delt
		eq.spawn2(298050,0,0, 367, 151, -6.7, 394); -- NPC: Zun`Muram_Mordl_Delt

		eq.set_timer("zmmd_kite", kite_time * 1000);

	elseif e.hp_event == 70 then
		eq.set_next_hp_event(50);

		eq.zone_emote(MT.Yellow,"Zun`Muram Mordl Delt's skin begins to bulge and split open, releasing another wave of energy. Three smaller images of the massive creature appear before you as the previous form fades away.");
		
		ZMMD_Inactivate(e);
		adds_killed = 0;
		eq.spawn2(298051,0,0, 367, 130, -6.7, 370); -- NPC: Zun`Muram_Mordl_Delt
		eq.spawn2(298051,0,0, 367, 151, -6.7, 394); -- NPC: Zun`Muram_Mordl_Delt
		eq.spawn2(298051,0,0, 367, 171, -6.7, 394); -- NPC: Zun`Muram_Mordl_Delt
		eq.set_timer("zmmd_kite", kite_time * 1000);

	elseif e.hp_event == 50 then
		eq.set_next_hp_event(30);

		eq.zone_emote(MT.Yellow,"Zun`Muram Mordl Delt's skin begins to bulge and split open, releasing another wave of energy. Four smaller images of the massive creature appear before you as the previous form fades away.");
		
		ZMMD_Inactivate(e);
		adds_killed = 0;
		eq.spawn2(298052,0,0, 367, 130, -6.7, 370); -- NPC: Zun`Muram_Mordl_Delt
		eq.spawn2(298052,0,0, 367, 151, -6.7, 394); -- NPC: Zun`Muram_Mordl_Delt
		eq.spawn2(298052,0,0, 367, 170, -6.7, 394); -- NPC: Zun`Muram_Mordl_Delt
		eq.spawn2(298052,0,0, 367, 110, -6.7, 394); -- NPC: Zun`Muram_Mordl_Delt
		eq.set_timer("zmmd_kite", kite_time * 1000);

	elseif e.hp_event == 30 then
		eq.zone_emote(MT.Yellow,"Zun`Muram Mordl Delt's body begins to glow as the images before you merge back into one. The wounds upon Mordl's body quickly heal as he's infused by the energy, but new wounds appear where his other forms were injured.");
		eq.zone_emote(MT.Yellow,"In a final act of desperation, Mordl splits two smaller forms off from himself but looks visibly drained from the effort.");
		
		adds_killed = 0;
		eq.modify_npc_stat("min_hit", "1670");
		eq.modify_npc_stat("max_hit", "4900");
		eq.spawn2(298053,0,0, 367, 151, -6.7, 394); -- NPC: Zun`Muram_Mordl_Delt
		eq.spawn2(298053,0,0, 367, 171, -6.7, 394); -- NPC: Zun`Muram_Mordl_Delt
	end
end

function ZMMD_Signal(e)
	if e.signal == 1 then
		ZMMD_Activate(e);
	end
end

function ZMMD_Death(e)
	eq.signal(298223, 298020); -- NPC: zone_status
	eq.signal(298223,2,1000); -- Unlock Doors
end

function ZMMD_Add_Death(e)
	adds_killed = adds_killed + 1;
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(298050)
		and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(298051)
		and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(298052) then

		-- Wake ZMMD Main Mob back up.
		eq.signal(298020,1); -- NPC: Zun`Muram_Mordl_Delt
	end
end

function event_encounter_load(e)
	eq.register_npc_event('zmmd', Event.spawn,          298020, ZMMD_Spawn);
	eq.register_npc_event('zmmd', Event.combat,         298020, ZMMD_Combat);
	eq.register_npc_event('zmmd', Event.timer,          298020, ZMMD_Timer);
	eq.register_npc_event('zmmd', Event.hp,             298020, ZMMD_Hp);
	eq.register_npc_event('zmmd', Event.signal,         298020, ZMMD_Signal);
	eq.register_npc_event('zmmd', Event.death_complete, 298020, ZMMD_Death);

	eq.register_npc_event('zmmd', Event.death_complete, 298050, ZMMD_Add_Death);
	eq.register_npc_event('zmmd', Event.death_complete, 298051, ZMMD_Add_Death);
	eq.register_npc_event('zmmd', Event.death_complete, 298052, ZMMD_Add_Death);
end
