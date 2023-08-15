local Ukun_Inactive = "19,1^20,1^21,1^24,1^25,1"; 
local Ukun_Active = "7,1^13,1^14,1^17,1^21,1";

local lp_mob = nil;
local tunat_id = nil;
local tunat_heal = nil;
local tunat_hp = nil;
local lp_list = {};

local zmkp_min = nil;
local zmkp_max = nil;

function Tunat_Second_Spawn()
	eq.set_next_hp_event(90);
end

function Tunat_Second_Death(e)
	eq.signal(298223, 298055); -- NPC: zone_status
	eq.signal(298223,2); -- Unlock Doors
end

function Tunat_Second_HP(e)
	if e.hp_event == 90 then
		eq.signal(298223,1); -- Lock Doors

		-- 90%: Pixtt Xxeric Kex (flurries; immediately spawns four ukun adds - stunnable, but not mezzable)

		-- Stop Previous Spell Timers
		eq.stop_timer("Spell_Tunat_Haste");

		-- Transition and set mob variables
		e.self:Emote("shimmers and changes before your eyes.");
		e.self:SetSpecialAbility(SpecialAbility.flurry, 1);
		eq.modify_npc_stat("min_hit", "1262");
		eq.modify_npc_stat("max_hit", "4500");
		e.self:SendIllusionPacket({race=393,gender=2,texture=11});
		e.self:TempName("Pixtt Xxeric Kex");

		-- Spawn Adds
		eq.spawn2(298044, 0, 0, 334, -117, 21, 280); -- NPC: an_ukun_juxtapincer
		eq.spawn2(298043, 0, 0, 356, -154, 21, 356); -- NPC: an_ukun_lifebleeder
		eq.spawn2(298042, 0, 0, 353, -201, 21, 434); -- NPC: an_ukun_manasipper
		eq.spawn2(298041, 0, 0, 322, -215, 21, 496); -- NPC: an_ukun_ragehound

		-- Phase Spells
		eq.set_timer("Spell_PXK_SC", 2 * 1000); -- 2s Start Timer
		eq.set_timer("Spell_PXK_WOR", 60 * 1000); -- 60s Timer

		-- Set next phase
		eq.set_next_hp_event(80);

	elseif e.hp_event == 80 then
		-- 80%: Pixtt Kretv Krakxt (mitigated AE rampage; spawns 4x "an ikaav hatchling" adds if you take too long)

		-- Stop Previous Spell Timers
		eq.stop_timer("Spell_PXK_SC");
		eq.stop_timer("Spell_PXK_WOR");

		-- Transition and set mob variables
		e.self:Emote("shimmers and changes before your eyes.");
		e.self:SetSpecialAbility(SpecialAbility.flurry, 0);
		e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
		e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 2, 25); -- 75% mitigated aoe ramp dmg
		eq.modify_npc_stat("min_hit", "1262");
		eq.modify_npc_stat("max_hit", "4432");
		e.self:SendIllusionPacket({race=394,gender=2,texture=11});
		e.self:TempName("Pixtt Kretv Kakxt");

		-- Add timer
		eq.set_timer("pkk_adds", 30 * 1000);

		-- Phase Spells
		eq.set_timer("Spell_PKK_DV", 2 * 1000);	-- 2s Start Timer
		eq.set_timer("Spell_PKK_SC", 5 * 1000);	-- 5s Start Timer
		eq.set_timer("Spell_PKK_WOTI", 10 * 1000);	-- 10s Start Timer

		-- Set next phase
		eq.set_next_hp_event(70);

	elseif e.hp_event == 70 then
		-- 70%: Pixtt Riel Tavas (unstable construct adds if you take too long)

		-- Stop Previous Spell Timers
		eq.stop_timer("Spell_PKK_DV");
		eq.stop_timer("Spell_PKK_SC");
		eq.stop_timer("Spell_PKK_WOTI");

		-- Transition and set mob variables
		e.self:Emote("shimmers and changes before your eyes.");
		e.self:SetSpecialAbility(SpecialAbility.area_rampage, 0);
		eq.modify_npc_stat("min_hit", "1552");
		eq.modify_npc_stat("max_hit", "4600");
		e.self:SendIllusionPacket({race=394,gender=2,texture=11});
		e.self:TempName("Pixtt Riel Tavas");

		-- Add timer
		eq.stop_timer("pkk_adds");
		eq.set_timer("prt_adds", 30 * 1000);

		-- Phase Spells
		eq.set_timer("Spell_PRT_DV", 2 * 1000);	-- 2s Start Timer
		eq.set_timer("Spell_PRT_WOTI", math.random(10,20) * 1000);	-- 10s-20 Start Timer

		-- Set next phase
		eq.set_next_hp_event(60);

	elseif e.hp_event == 60 then
		-- 60%: Zun`Muram Kvxe Pirik (single-target rampage; Powers Up 30s; straight melee)

		-- Stop Previous Spell Timers
		eq.stop_timer("Spell_PRT_DV");
		eq.stop_timer("Spell_PRT_WOTI");

		-- Transition and set mob variables
		e.self:Emote("shimmers and changes before your eyes.");
		e.self:SendIllusionPacket({race=400,gender=2,texture=11});
		e.self:TempName("Zun`Muram Kvxe Pirik");
		e.self:ModifyNPCStat("attack_delay","9");
		eq.modify_npc_stat("min_hit", "1424");
		zmkp_min = 1424;
		eq.modify_npc_stat("max_hit", "3900");
		zmkp_max = 3900;

		-- Add timer
		eq.stop_timer("prt_adds");

		-- Power Up timer
		eq.set_timer("zmkp_powerup_first", 35 * 1000);

		-- Set next phase
		eq.set_next_hp_event(50);

	elseif e.hp_event == 50 then
		-- 50%: Zun`Muram Yihst Vor (mitigated AE rampage; Flurry; straight melee)

		-- End power up cycle
		eq.stop_timer("zmkp_powerup_repeat");

		-- Transition and set mob variables
		e.self:Emote("shimmers and changes before your eyes.");
		e.self:ModifyNPCStat("attack_delay","15");
		eq.modify_npc_stat("min_hit", "1643");
		eq.modify_npc_stat("max_hit", "4500");
		e.self:SetSpecialAbility(SpecialAbility.rampage, 0);
		e.self:SetSpecialAbility(SpecialAbility.flurry, 1);
		e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
		e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 2, 25); -- 75% mitigated aoe ramp dmg		
		e.self:SendIllusionPacket({race=400,gender=2,texture=11});
		e.self:TempName("Zun`Muram Yihst Vor");
		
		-- Phase Spells
		eq.set_timer("Spell_ZMYV_AOH", 60 * 1000); -- 60s Timer

		-- Set next phase
		eq.set_next_hp_event(40);

	elseif e.hp_event == 40 then
		-- 40%: Zun`Muram Mordl Delt (single-target rampage; flurries; spawns 2x "Zun`Muram Mordl Delt" adds)

		-- Stop Previous Spell Timers
		eq.stop_timer("Spell_ZMYV_AOH");

		-- Transition and set mob variables
		e.self:Emote("shimmers and changes before your eyes.");
		e.self:SetSpecialAbility(SpecialAbility.area_rampage, 0);
		e.self:SetSpecialAbility(SpecialAbility.rampage, 1);
		e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 2, 25); -- 75% mitigated ramp dmg
		eq.modify_npc_stat("min_hit", "1343");
		eq.modify_npc_stat("max_hit", "4200");
		e.self:SendIllusionPacket({race=400,gender=2,texture=11});
		e.self:TempName("Zun`Muram Mordl Delt");

		-- Spawn Adds
		eq.set_timer("ZMMD_Adds",20 * 1000); -- Spawn Adds 20s after phase start
		
		-- Set next phase
		eq.set_next_hp_event(30);

	elseif e.hp_event == 30 then
		-- 30%: Zun`Muram Shaldn Boc (single-target rampage; Rages; straight melee)

		-- Transition and set mob variables
		e.self:Emote("shimmers and changes before your eyes.");
		e.self:SetSpecialAbility(SpecialAbility.flurry, 0);
		eq.modify_npc_stat("min_hit", "1462");
		eq.modify_npc_stat("max_hit", "4700");
		e.self:SendIllusionPacket({race=400,gender=2,texture=11});
		e.self:TempName("Zun`Muram Shaldn Boc");

		-- Rage Timer
		eq.set_timer("zmsb_rage", 30 * 1000);
		
		-- Set next phase
		eq.set_next_hp_event(20);

	elseif e.hp_event == 20 then
		-- 20%: he reforms as Tunat`Muram Cuu Vauax once again...

		-- Stop previous rage
		eq.stop_timer("zmsb_rage");
		eq.stop_timer("zmsb_rage_over");

		-- Transition and set mob variables
		e.self:Emote("shimmers and changes before your eyes.");
		e.self:Say("You are stronger than I anticipated. While you have exhausted the fleeting spirit of my underlings, you have yet to face my true fury!");
		eq.modify_npc_stat("min_hit", "1450");
		eq.modify_npc_stat("max_hit", "4300");
		e.self:SetSpecialAbility(SpecialAbility.rampage, 1);
		e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 2, 25); -- 75% mitigated ramp dmg
		e.self:SetSpecialAbility(SpecialAbility.flurry, 1);
		e.self:SendIllusionPacket({race=399,gender=2,texture=11});
		e.self:TempName("Tunat`Muram Cuu Vauax");

		-- Rage Timer
		eq.set_timer("tunat_rage", 30 * 1000);
		eq.set_timer("Spell_Tunat_Haste",2 * 1000); -- 2s Start Timer

		-- Phase Spells
		e.self:CastSpell(4740, e.self:GetID());	-- Spell: Haste of the Tunat`Muram
		eq.set_timer("Spells_Tunat_Final1", 20 * 1000); -- 20s Start Timer
		eq.set_timer("Spells_Tunat_Final2", 35 * 1000); -- 35s Start Timer

		eq.set_next_hp_event(15);
	end
end

function Tunat_First_Death(e)
	eq.zone_emote(MT.White, "Tunat`Muram Cuu Vauax says, 'In an explosion of energy, Tunat'Muram Cuu Vauax disappears while ancient pebbles pelt against your armor.'");
	eq.zone_emote(MT.Yellow,"The room is filled with an eerie laugh. 'You have done well to defeat my doppelganger and have shown great strength by making it this far, but I'm afraid I must end your struggle here. Your days have been numbered since you first set foot upon this continent and your time is up. Kneel before me and I will grant you a quick death, but resist and you will suffer in ways that will be spoken about in hushed tones for eons to come.");
	eq.spawn2(298055,0,0, 309, -170.8, 21.3, 118.8); -- NPC: #Tunat`Muram_Cuu_Vauax
	eq.depop_all(298113);
	eq.depop_all(298209);
end

function Tunat_First_Spawn(e)
	eq.signal(298223,2); -- Unlock Doors
	eq.set_next_hp_event(90);

	-- Spawn the Dogs
	eq.spawn2(298209, 0, 0, 445, -203, 25, 34); -- NPC: an_ukun_biledrinker
	eq.spawn2(298209, 0, 0, 447, -139, 25, 198); -- NPC: an_ukun_biledrinker

	-- Spawn the Living
	lp_list[1] = eq.spawn2(298113, 0, 0,500.00, -152.00, 23.75, 112); -- NPC: Living_Phylactery
	lp_list[2] = eq.spawn2(298113, 0, 0,507.00, -172.00, 23.75, 112); -- NPC: Living_Phylactery
	lp_list[3] = eq.spawn2(298113, 0, 0,498.00, -193.00, 23.75, 112); -- NPC: Living_Phylactery
	lp_list[4] = eq.spawn2(298113, 0, 0,476.00, -242.00, 23.75, 246); -- NPC: Living_Phylactery
	lp_list[5] = eq.spawn2(298113, 0, 0,428.00, -242.00, 23.75, 246); -- NPC: Living_Phylactery
	lp_list[6] = eq.spawn2(298113, 0, 0,454.00, -242.00, 23.75, 246); -- NPC: Living_Phylactery
	lp_list[7] = eq.spawn2(298113, 0, 0,478.00, -100.00, 23.75, 28); -- NPC: Living_Phylactery
	lp_list[8] = eq.spawn2(298113, 0, 0,454.00, -100.00, 23.75, 28); -- NPC: Living_Phylactery
	lp_list[9] = eq.spawn2(298113, 0, 0,431.00, -100.00, 23.75, 28); -- NPC: Living_Phylactery

end

function Tunat_First_HP(e)
	if (e.hp_event == 90) then
		eq.signal(298223,1); -- Lock Doors
		eq.set_next_hp_event(40);
	elseif (e.hp_event == 40) then
		-- Wake up the dogs.
		eq.signal(298209, 1); -- NPC: an_ukun_biledrinker
	end
end

function Tunat_Second_Timer(e)
	if e.timer == "pkk_adds" then
		eq.spawn2(298013, 0, 0, 334, -117, 21, 280); -- NPC: an_ikaav_hatchling --change these so they dont trigger PKK Script.
		eq.spawn2(298013, 0, 0, 356, -154, 21, 356); -- NPC: an_ikaav_hatchling
		eq.spawn2(298013, 0, 0, 353, -201, 21, 434); -- NPC: an_ikaav_hatchling
		eq.spawn2(298013, 0, 0, 322, -215, 21, 496); -- NPC: an_ikaav_hatchling

	elseif e.timer == "prt_adds" then
		eq.spawn2(298045, 0, 0, 334, -117, 21, 280); -- NPC: an_unstable_construct
		eq.spawn2(298045, 0, 0, 356, -154, 21, 356); -- NPC: an_unstable_construct
		eq.spawn2(298045, 0, 0, 353, -201, 21, 434); -- NPC: an_unstable_construct
		eq.spawn2(298045, 0, 0, 322, -215, 21, 496); -- NPC: an_unstable_construct
		eq.spawn2(298045, 0, 0, 322, -225, 21, 496); -- NPC: an_unstable_construct
	elseif e.timer == "zmkp_powerup_first" then
		eq.stop_timer("zmkp_powerup_first");

		-- Set Ramp - Observed 25%
		e.self:SetSpecialAbility(SpecialAbility.rampage, 1);
		e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 2, 25); -- 75% mitigated ramp dmg

		e.self:ModifyNPCStat("attack_delay","28");

		-- Scale up each cycle - +700  max hit / +188 min hit
		zmkp_min = zmkp_min + 188;
		eq.modify_npc_stat("min_hit", tostring(zmkp_min));
		zmkp_max = zmkp_max + 700;
		eq.modify_npc_stat("max_hit", tostring(zmkp_max));
		-- Start cycle
		eq.set_timer("zmkp_powerup_repeat", 35 * 1000);		
	elseif e.timer == "zmkp_powerup_repeat" then
		-- Scale up each cycle - +700  max hit / +188 min hit
		eq.zone_emote(MT.Yellow,"Zun`Muram Kvxe Pirik focuses his will and grows stronger.");
		zmkp_min = zmkp_min + 188;
		eq.modify_npc_stat("min_hit", tostring(zmkp_min));
		zmkp_max = zmkp_max + 700;
		eq.modify_npc_stat("max_hit", tostring(zmkp_max));
	elseif e.timer == "ZMMD_Adds" then
		eq.stop_timer("ZMMD_Adds");
		eq.spawn2(298050, 0, 0, 334, -117, 21, 280); -- NPC: Zun`Muram_Mordl_Delt
		eq.spawn2(298050, 0, 0, 356, -154, 21, 356); -- NPC: Zun`Muram_Mordl_Delt
	elseif e.timer == "zmsb_rage" then
		eq.zone_emote(MT.Yellow,"Zun`Muram Shaldn Boc starts to foam at the mouth as he enters a blind rage.");
		eq.stop_timer("zmsb_rage");
		e.self:ModifyNPCStat("attack_delay","9");
		eq.modify_npc_stat("min_hit", "2010");
		eq.modify_npc_stat("max_hit", "6200");
		eq.set_timer("zmsb_rage_over", 25 * 1000);
	elseif e.timer == "zmsb_rage_over" then
		eq.zone_emote(MT.Yellow,"Zun`Muram Shaldn Boc looks weakened as the rage ends.");
		eq.stop_timer("zmsb_rage_over");
		e.self:ModifyNPCStat("attack_delay","15");
		eq.modify_npc_stat("min_hit", "1462");
		eq.modify_npc_stat("max_hit", "4700");
		eq.set_timer("zmsb_rage", 30 * 1000);
	elseif e.timer == "tunat_rage" then
		eq.zone_emote(MT.Yellow,"Tunat`Muram Cuu Vuaux starts to foam at the mouth as he enters a blind rage.");
		eq.stop_timer("tunat_rage");
		e.self:ModifyNPCStat("attack_delay","9");
		eq.modify_npc_stat("min_hit", "1990");
		eq.modify_npc_stat("max_hit", "5800");
		eq.set_timer("tunat_rage_over", 25 * 1000);
	elseif e.timer == "tunat_rage_over" then
		eq.zone_emote(MT.Yellow,"Tunat`Muram Cuu Vuaux looks weakened as the rage ends.");
		eq.stop_timer("tunat_rage_over");
		e.self:ModifyNPCStat("attack_delay","15");
		eq.modify_npc_stat("min_hit", "1450");
		eq.modify_npc_stat("max_hit", "4300");
		eq.set_timer("tunat_rage", 30 * 1000);
	elseif e.timer == "wipe_check2" then
		eq.stop_all_timers();
		eq.signal(298223,2); -- Unlock Doors
		eq.depop_all(298044);
		eq.depop_all(298043);
		eq.depop_all(298042);
		eq.depop_all(298041);
		eq.depop_all(298048);
		eq.depop_all(298045);
		eq.depop_all(298209);
		eq.depop_all(298050);
		eq.depop_all(298013);
		eq.spawn2(298055,0,0, 309, -170.8, 21.3, 118.8); -- NPC: #Tunat`Muram_Cuu_Vauax
		eq.depop();

	--
	-- Spells
	--

	-- Tunat 100%
	elseif e.timer == "Spell_Tunat_Haste" then
		eq.stop_timer("Spell_Tunat_Haste");
		if (e.self:GetHPRatio() > 90 or e.self:GetHPRatio() < 20) then
			e.self:CastSpell(4740, e.self:GetID()); -- Spell: Haste of the Tunat`Muram
		end
		eq.set_timer("Spell_Tunat_Haste",30 * 1000); -- 30s Timer

	-- PXK 90%	
	elseif e.timer == "Spell_PXK_SC" then
		eq.stop_timer("Spell_PXK_SC");
		e.self:CastedSpellFinished(4729, e.self:GetHateTop());	-- Spell: Spirit Cleaver: Single Target, Prismatic (-350)
		eq.set_timer("Spell_PXK_SC",math.random(45,60) * 1000); -- Random 45-60s Timer

	elseif e.timer == "Spell_PXK_WOR" then
		e.self:CastedSpellFinished(4728, e.self:GetHateTop());	-- Spell: Wave of Rage: PB AE 100', Prismatic (-350)

	-- PKK 80%	
	elseif e.timer == "Spell_PKK_DV" then
		eq.stop_timer("Spell_PKK_DV");
		e.self:CastedSpellFinished(889, e.self:GetHateTop());	-- Spell: Delusional Visions: Single Target, Chromatic (-350)
		eq.set_timer("Spell_PKK_DV",30 * 1000); -- 30s Timer

	elseif e.timer == "Spell_PKK_SC" then
		eq.stop_timer("Spell_PKK_SC");
		e.self:CastedSpellFinished(852, e.self:GetHateTop());	-- Spell: Soul Consumption: Single Target, Prismatic (-350)
		eq.set_timer("Spell_PKK_SC",math.random(35,45) * 1000); -- Random 35-45s Timer

	elseif e.timer == "Spell_PKK_WOTI" then
		eq.stop_timer("Spell_PKK_WOTI");
		e.self:CastedSpellFinished(888, e.self:GetHateTop());	-- Spell: Wrath of the Ikaav: Single Target, Unresistable
		eq.set_timer("Spell_PKK_WOTI",math.random(30,60) * 1000); -- Random 30-60s Timer

	-- PRT 70%	
	elseif e.timer == "Spell_PRT_DV" then
		eq.stop_timer("Spell_PRT_DV");
		e.self:CastedSpellFinished(889, e.self:GetHateTop());	-- Spell: Delusional Visions: Single Target, Chromatic (-350)
		eq.set_timer("Spell_PRT_DV",math.random(30,60) * 1000); -- Random 30-60s Timer

	elseif e.timer == "Spell_PRT_WOTI" then
		eq.stop_timer("Spell_PRT_WOTI");
		e.self:CastedSpellFinished(888, e.self:GetHateTop());	-- Spell: Wrath of the Ikaav: Single Target, Unresistable
		eq.set_timer("Spell_PRT_WOTI",math.random(60,180) * 1000); -- Random 60-180s Timer

	-- PRT 50%
	elseif e.timer == "Spell_ZMYV_AOH" then
		eq.stop_timer("Spell_ZMYV_AOH");
		
		for i=1,2 do -- Two Casts
			local target = e.self:GetHateRandom();
			if target:IsPet() then
				target = target:GetOwner();
			end

			if target.valid and not target:FindBuff(4441) then
				e.self:SpellFinished(4441, target); -- Spell: Allure of Hatred
			end
		end

		e.self:WipeHateList();
		eq.set_timer("Spell_ZMYV_AOH",60 * 1000); -- 60s Timer

	-- Tunat 20%
	elseif e.timer == "Spells_Tunat_Final1" then
		--spear of discord [20s interval ]
		--spirit cleaver [20s interval ]
		--soul consumption [20s interval ]
		e.self:CastedSpellFinished(eq.ChooseRandom(4727, 4729, 852), e.self:GetHateRandom());
		
	elseif e.timer == "Spells_Tunat_Final2" then
		--ikaavs venom [35s interval ]
		--wave of rage [35s interval ]
		--discords rebuke [35s interval ]
		e.self:CastedSpellFinished(eq.ChooseRandom(751, 4739, 4728), e.self:GetHateRandom());
	end
end

function Tunat_Second_Combat(e)
	if e.joined then
		eq.stop_timer("wipe_check2");
		eq.set_timer("Spell_Tunat_Haste", 2 * 1000); -- 2s Start Timer
	else
		eq.set_timer("wipe_check2", 300 * 1000);
	end
end

function Tunat_First_Combat(e)
	if e.joined then
		e.self:Say("You have defiled my chambers and destroyed my officers. I will crush your soul and suck the marrow from your bones.");
		eq.set_timer("lp_store", eq.ChooseRandom(40, 49, 50, 65, 111) * 1000);
		eq.stop_timer("wipe_check1");
	else
		eq.set_timer("wipe_check1", 300 * 1000);
	end
end

function Tunat_First_Timer(e)
	if e.timer == "lp_store" then
		eq.stop_timer("lp_store");
		e.self:Emote("pauses for a moment as a portion of his spirit is transferred into one of the phylacteries. ");

		lp_mob = lp_list[ eq.ChooseRandom(1,2,3,4,5,6,7,8,9)]; 
		tunat_heal = e.self:GetMaxHP() * 0.10;

		e.self:FaceTarget(lp_mob);
		e.self:CastSpell(4448, lp_mob:GetID(), 1, 2); -- Spell: ShieldSP

		eq.set_timer("lp_heal", 30 * 1000 );
	elseif e.timer == "lp_heal" then
		eq.stop_timer("lp_heal");
		eq.set_timer("lp_store", eq.ChooseRandom(40, 49, 50, 65, 111) * 1000);
		
		tunat_id = e.self:GetID();
		tunat_hp = e.self:GetHP();

		lp_mob:FaceTarget(e.self);
		lp_mob:CastSpell(4448, e.self:GetID(), 1, 3 ); -- Spell: ShieldSP
		e.self:SetHP( tunat_hp + tunat_heal );
		e.self:Emote("staggers as the portion of his spirit that was stored in the phylactery flows back into him.");

	elseif e.timer == "wipe_check1" then
		-- Reset to the 1st Tunat 
		eq.signal(298223,2); -- Unlock Doors
		eq.depop();
		eq.depop_all(298113);
		eq.depop_all(298209);
		eq.spawn2(298014, 0, 0, 462, -171, 32, 16); -- NPC: #Tunat`Muram_Cuu_Vauax

	end
end

function LP_Combat(e)
	if e.joined then
		eq.set_timer("lp_ae", 30 * 1000);
	end
end

function LP_Death(e)
	e.self:SpellFinished(6495, e.self:GetID()); -- Spell: Spiritual Wake
end

function LP_Timer(e)
	if e.timer == "lp_ae" then
		e.self:CastSpell(5546, e.self:GetTarget():GetID()); -- Spell: Gaze of the Tunat`Muram
	end
end

function Ukun_Spawn(e)
	-- When the Dogs spawn set the inactive
	e.self:ProcessSpecialAbilities(Ukun_Inactive);
	eq.signal(298209, 2, 2 * 1000); -- NPC: an_ukun_biledrinker
end

function Ukun_Signal(e)
	if e.signal == 1 then
 		-- When we get a signal fromt he controller wake the dogs up.
		e.self:ProcessSpecialAbilities(Ukun_Active);
	elseif e.signal == 2 then
		e.self:SetAppearance(3); -- Dead
	end
end

function event_encounter_load(e)
	eq.register_npc_event("tmcv", Event.spawn,          298014, Tunat_First_Spawn);
	eq.register_npc_event("tmcv", Event.death_complete, 298014, Tunat_First_Death);
	eq.register_npc_event("tmcv", Event.hp,             298014, Tunat_First_HP);
	eq.register_npc_event("tmcv", Event.timer,          298014, Tunat_First_Timer);
	eq.register_npc_event("tmcv", Event.combat,         298014, Tunat_First_Combat);

	eq.register_npc_event("tmcv", Event.spawn,          298055, Tunat_Second_Spawn);
	eq.register_npc_event("tmcv", Event.combat,         298055, Tunat_Second_Combat);
	eq.register_npc_event("tmcv", Event.death_complete, 298055, Tunat_Second_Death);
	eq.register_npc_event("tmcv", Event.hp,             298055, Tunat_Second_HP);
	eq.register_npc_event("tmcv", Event.timer,          298055, Tunat_Second_Timer);

	eq.register_npc_event("tmcv", Event.combat,         298113, LP_Combat);
	eq.register_npc_event("tmcv", Event.death,          298113, LP_Death);
	eq.register_npc_event("tmcv", Event.timer,          298113, LP_Timer);

	eq.register_npc_event("tmcv", Event.spawn,          298209, Ukun_Spawn);
	eq.register_npc_event("tmcv", Event.signal,         298209, Ukun_Signal);
end
