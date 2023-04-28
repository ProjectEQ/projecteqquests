-- #noqufiel_trigger (296075)
-- ##Noqufiel (296074)
-- #Mirror_Image_of_Noqufiel (296066)
-- #True_Image_of_Noqufiel (296065)

--[[

Event Details:

Damage:
"Noq" Form are identical and same as True Form:
- Both: Summon
- Both: 496-1788 damage range
- Both: Snare/Rootable in any form
- In Ghost Form until reveal
- No Procs or Spells in Noq form (knockback or Lifetab)
- Same Health Pool Size (Different than PEQ)
- 5% to reveal them each independent
- 1% Regen per tick Out of Combat

True Form:
-Same as Noq form but adds Lifetap and Knockback
- 5% after Reveal resets both spawns to Noq Form
- 1% Regen per tick Out of Combat

Mirror Form: 
- 220-600 damage range
- Does not Summon and is innately rooted
- Any damage 2s after reveal causes him to explode
- 1% Regen per tick Out of Combat

Door:
- Opens from inside cause no damage and instantly open with an emote.
- Open from inside seems to set a 10s timer where people outside can open with no possible damage
- Clean opens from outside has a change to open or do damage only

Cursebearers:
- Very random on when/how many are spawned. (0-2)
- Do not spawn when mobs are not engaged 

]]--

local hp_ratio			= 100;
local spawn_phase		= 0;
local event_started		= false;
local mirror_shake_hp	= 0;
local hp_event_table	= {	-- Next HP Event, Previous HP Event, Current HP Chunk
	[1]  = {95,100,100},	-- Next 95%, Previous 100%, Current 100%
	[2]  = {90,100,95},		-- Next 90%, Previous 100%, Current 95%
	[3]  = {85,100,90},		-- Next 85%, Previous 100%, Current 90%
	[4]  = {80,90,85},		-- Next 80%, Previous 90%, Current 85%
	[5]  = {75,90,80},		-- Next 75%, Previous 90%, Current 80%
	[6]  = {70,80,75},		-- Next 70%, Previous 80%, Current 75%
	[7]  = {65,80,70},		-- Next 65%, Previous 80%, Current 70%
	[8]  = {60,70,65},		-- Next 60%, Previous 70%, Current 65%
	[9]	 = {55,70,60},		-- Next 55%, Previous 70%, Current 60%
	[10] = {50,60,55},		-- Next 50%, Previous 60%, Current 55%
	[11] = {45,60,50},		-- Next 45%, Previous 60%, Current 50%
	[12] = {40,50,45},		-- Next 40%, Previous 50%, Current 45%
	[13] = {35,50,40},		-- Next 35%, Previous 50%, Current 40%
	[14] = {30,40,35},		-- Next 30%, Previous 40%, Current 35%
	[15] = {25,40,30},		-- Next 25%, Previous 40%, Current 30%
	[16] = {20,30,25},		-- Next 20%, Previous 30%, Current 25%
	[17] = {15,30,20},		-- Next 15%, Previous 30%, Current 20%
	[18] = {10,20,15},		-- Next 10%, Previous 20%, Current 15%
	[19] = {5,20,10},		-- Next 5%, Previous 20%, Current 10%
	[20] = {0,10,5}			-- Next 0%, Previous 10%, Current 5%
}

-- Door functions handled in player.lua

function TriggerSpawn(e)
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(296065) then
		Spawn_Noqu();
		event_started = false;
	end
end

function TrueSpawn(e)
	if not event_started and spawn_phase == 0 then
		spawn_phase = 1;
	end
	e.self:TempName("Noqufiel");
	e.self:SetHP(e.self:GetMaxHP() * (hp_ratio / 100)); -- Set to %
	e.self:SendIllusionPacket({race=385,gender=0,texture=4,helmtexture=255,beard=255,face=0}); -- Verify this is ghost form
	eq.set_next_hp_event(hp_event_table[spawn_phase][1]); -- Next HP Event
	eq.set_next_inc_hp_event(hp_event_table[spawn_phase][2]); -- Previous HP Event
end

function MirrorSpawn(e)
	if not event_started and spawn_phase == 0 then
		spawn_phase = 1;
	end
	e.self:TempName("Noqufiel");
	e.self:SetHP(e.self:GetMaxHP() * (hp_ratio / 100)); -- Set to %
	e.self:SendIllusionPacket({race=385,gender=0,texture=4,helmtexture=255,beard=255,face=0}); -- Verify this is ghost form
	eq.set_next_hp_event(hp_event_table[spawn_phase][1]); -- Next HP Event
end

function TrueHP(e)
	if e.hp_event == 95 or e.hp_event == 85 or e.hp_event == 75 or e.hp_event == 65 or e.hp_event == 55 or e.hp_event == 45 or e.hp_event == 35 or e.hp_event == 25 or e.hp_event == 15 or e.hp_event == 5 then
		if spawn_phase > 0 then
			spawn_phase = spawn_phase + 1
		end
		eq.set_next_hp_event(hp_event_table[spawn_phase][1]); -- Next HP Event
		eq.set_next_inc_hp_event(hp_event_table[spawn_phase][2]); -- Previous HP Event
		reveal(e,true);
	elseif e.hp_event == 90 or e.hp_event == 80 or e.hp_event == 70 or e.hp_event == 60 or e.hp_event == 50 or e.hp_event == 40 or e.hp_event == 30 or e.hp_event == 20 or e.hp_event == 10 then
		hp_ratio = hp_event_table[spawn_phase][1];
		if spawn_phase > 0 then
			spawn_phase = spawn_phase + 1
		end
		Spawn_Noqu();
	end

	if e.inc_hp_event == 90 or e.inc_hp_event == 80 or e.inc_hp_event == 70 or e.inc_hp_event == 60 or e.inc_hp_event == 50 or e.inc_hp_event == 40 or e.inc_hp_event == 30 or e.inc_hp_event == 20 or e.inc_hp_event == 10 then -- True regened back up
		if spawn_phase > 0 then
			spawn_phase = spawn_phase - 1
		end
		Spawn_Noqu();
	end
end

function MirrorHP(e)
	if e.hp_event == 95 or e.hp_event == 85 or e.hp_event == 75 or e.hp_event == 65 or e.hp_event == 55 or e.hp_event == 45 or e.hp_event == 35 or e.hp_event == 25 or e.hp_event == 15 or e.hp_event == 5 then
		reveal(e,false);
	elseif e.hp_event == 90 or e.hp_event == 80 or e.hp_event == 70 or e.hp_event == 60 or e.hp_event == 50 or e.hp_event == 40 or e.hp_event == 30 or e.hp_event == 20 or e.hp_event == 10 then
		Spawn_Noqu();
	end
end

function reveal(e,realnoq)
	if realnoq then
		e.self:TempName("True Image of Noqufiel");
		e.self:SendIllusionPacket({race=385,gender=0,texture=0,helmtexture=47,beard=255,face=255});
		eq.stop_timer("banish");
		e.self:AddAISpell(0, 2376, 64, -1, 2, -150); -- Spell: Spectral Quintessence
	else -- Mirror Noq
		e.self:TempName("Mirror Image of Noqufiel");
		e.self:SendIllusionPacket({race=385,gender=0,texture=0,helmtexture=47,beard=255,face=255});
		eq.stop_timer("banish");
		eq.set_timer("set_hp", 2 * 1000);
		e.self:SetPseudoRoot(true);
		e.self:ModifyNPCStat("max_hit", "600");
		e.self:ModifyNPCStat("min_hit", "220");
		e.self:SetSpecialAbility(SpecialAbility.summon,0); -- Stop Summoning
		e.self:RemoveAISpell(905); -- Spell: Avatar Knockback
	end
end

function TrueCombat(e)
	if e.joined then
		if not event_started then
			event_started = true;
		end
		eq.set_timer("leash",1*1000);
		eq.set_timer("banish",(15 + math.random(15)) * 1000); -- 15-30s banish while in Noq Form
		eq.set_timer("cursecallers",(15 + math.random(15)) * 1000); -- 15-30s Cursecallers
	else
		eq.stop_timer("banish");
		eq.stop_timer("leash");
		eq.stop_timer("cursecallers");
	end
end

function MirrorCombat(e)
	if e.joined then
		eq.set_timer("leash",1*1000);
		eq.set_timer("banish",(15 + math.random(15)) * 1000); -- 15-30s banish while in Noq Form
		eq.set_timer("cursecallers",(15 + math.random(15)) * 1000); -- 15-30s Cursecallers
	else
		eq.stop_timer("banish");
		eq.stop_timer("leash");
		eq.stop_timer("cursecallers");
	end
end

function TrueTimer(e)
	if e.timer == "leash" then
		if e.self:GetY() < -800 then
			e.self:GotoBind();
			e.self:WipeHateList();
		end
	elseif e.timer == "banish" then
		eq.stop_timer(e.timer);
		local top_hate = e.self:GetHateTop()
		if top_hate.valid and top_hate:IsClient() then
			local top_hate_v = top_hate:CastToClient()
			if top_hate_v.valid then
				e.self:Say("I will deal with you later.")
				e.self:SetHate(top_hate_v, 1, 1)
				top_hate_v:MovePCInstance(296, eq.get_zone_instance_id(), -117, -912, -127, 128)
			end
		end
		eq.set_timer("banish",(15 + math.random(15)) * 1000); -- 15-30s banish while in Noq Form
	elseif e.timer == "cursecallers" then
		eq.stop_timer(e.timer);
		if math.random(100) > 75 then -- 25% chance to spawn cursecaller, these were very sporadic on live which leads me to believe low chance to spawn.
			eq.spawn2(eq.ChooseRandom(296059,296060,296061,296062,296063,296064), 0, 0,-238,-657,-126,242):AddToHateList(eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),500*500)); -- NPC(s): #a_brainless_cursebearer (296059), #a_deadened_cursebearer (296060), #a_mindless_cursebearer (296061), #a_numbed_cursebearer (296062), #a_vacuous_cursebearer (296063), #an_unfeeling_cursebearer (296064)
		end
		eq.set_timer("cursecallers",(15 + math.random(15)) * 1000); -- 15-30s Cursecallers
	end
end

function MirrorTimer(e)
	if e.timer == "leash" then
		if e.self:GetY() < -800 then
			e.self:GotoBind();
			e.self:WipeHateList();
		end
	elseif e.timer == "banish" then
		eq.stop_timer(e.timer);
		local top_hate = e.self:GetHateTop()
		if top_hate.valid and top_hate:IsClient() then
			local top_hate_v = top_hate:CastToClient()
			if top_hate_v.valid then
				e.self:Say("I will deal with you later.")
				e.self:SetHate(top_hate_v, 1, 1)
				top_hate_v:MovePCInstance(296, eq.get_zone_instance_id(), -117, -912, -127, 128)
			end
		end
		eq.set_timer("banish",(15 + math.random(15)) * 1000); -- 15-30s banish while in Noq Form
	elseif e.timer == "set_hp" then
		eq.stop_timer(e.timer);
		mirror_shake_hp = e.self:GetHP();
		eq.set_timer("check_hp", 500); -- 500ms check to explode
	elseif e.timer == "check_hp" then
		if e.self:GetHP() < mirror_shake_hp - 100 then
			eq.stop_timer(e.timer);
			e.self:CastSpell(2490,e.self:GetHateRandom():GetID()); -- Spell: Detonation
			e.self:Emote("shudders and explodes!");
			eq.depop();
		end
	end
end

function TriggerTimer(e)
	if e.timer == "unlock_doors" then
		local entity_list = eq.get_entity_list();
		entity_list:FindDoor(42):SetLockPick(0);
		entity_list:FindDoor(43):SetLockPick(0);	
	end
end

function TriggerSignal(e)
	if e.signal == 5 then
		local dz = eq.get_expedition()
		if dz.valid then
			dz:SetLocked(true); -- Lock DZ so no additional people can join.
			eq.zone_emote(MT.Yellow, "Your expedition is nearing its close. You cannot bring any additional people into your expedition at this time");
		end

		if event_started then
			local entity_list = eq.get_entity_list();
			entity_list:FindDoor(42):SetLockPick(1);
			entity_list:FindDoor(43):SetLockPick(1);
		end
	end
end

function Spawn_Noqu()
	eq.depop_all(296065);
	eq.depop_all(296066);
	if eq.ChooseRandom(1,2) == 1 then		
		eq.spawn2(296066, 0, 0,20,-706,-126,384); -- NPC: #Mirror_Image_of_Noqufiel
		eq.spawn2(296065, 0, 0,20,-633,-126,384); -- NPC: #True_Image_of_Noqufiel
	else
		eq.spawn2(296065, 0, 0,20,-706,-126,384); -- NPC: #True_Image_of_Noqufiel
		eq.spawn2(296066, 0, 0,20,-633,-126,384); -- NPC: #Mirror_Image_of_Noqufiel
	end
end

function TrueDeath(e)
	e.self:Say("This is but a temporary setback. I will return.");
	eq.signal(296070,296065); -- NPC: zone_status
	eq.depop_all(296059);
	eq.depop_all(296060);
	eq.depop_all(296061);
	eq.depop_all(296062);
	eq.depop_all(296063);
	eq.depop_all(296064);
end

function event_encounter_load(e)

	-- Trigger
	eq.register_npc_event("noqufiel", Event.spawn, 296075, TriggerSpawn)
	eq.register_npc_event("noqufiel", Event.signal, 296075, TriggerSignal)
	eq.register_npc_event("noqufiel", Event.timer, 296075, TriggerTimer)

	-- True NPC
	eq.register_npc_event("noqufiel", Event.signal, 296065, TrueSignal)	
	eq.register_npc_event("noqufiel", Event.combat, 296065, TrueCombat)
	eq.register_npc_event("noqufiel", Event.timer, 296065, TrueTimer)
	eq.register_npc_event("noqufiel", Event.spawn, 296065, TrueSpawn)
	eq.register_npc_event("noqufiel", Event.death_complete, 296065, TrueDeath)
	eq.register_npc_event('noqufiel', Event.hp, 296065, TrueHP);

	-- Mirror NPC
	eq.register_npc_event("noqufiel", Event.combat, 296066, MirrorCombat)
	eq.register_npc_event("noqufiel", Event.timer, 296066, MirrorTimer)
	eq.register_npc_event("noqufiel", Event.spawn, 296066, MirrorSpawn)
	eq.register_npc_event('noqufiel', Event.hp, 296066, MirrorHP);
end
