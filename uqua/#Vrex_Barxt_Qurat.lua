local max_hp				= 1526854;
local hp_one_percent		= 15268;
local abilities_inactive	= "19,1^20,1^21,1^24,1^25,1^35,1";
local abilities_active		= "1,1^2,1^4,1,10,0,7^5,1^7,1^12,1^13,1^14,1^15,1^16,1^17,1^21,1^31,1";
local guardian_alive		= 1;
local mob_count				= 0;


function event_spawn(e)
	eq.set_timer("add_phase_1", 1 * 60 * 1000) -- 1 Minute Timer
	eq.set_timer("tether", 3 * 1000) -- 3s Check on tether
	eq.set_next_hp_event(40)
	eq.spawn2(292074,0,0,-748,16,60,382); -- NPC: #a_destructive_channeler
	eq.spawn2(292075,0,0,-985,15,60,124); -- NPC: #a_destructive_channeler_
end

function event_timer(e)
	if e.timer == "tether" then
		if e.self:GetY() < -184 then
			e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
			e.self:GotoBind();
			e.self:WipeHateList();
		end	
	elseif e.timer == "add_phase_1" then
		eq.stop_timer("add_phase_1");
		eq.set_timer("add_phase_2", 1 * 60 * 1000) -- 1 Minute Timer

		-- Signal summoners to lay down
		eq.signal(292086, 1);

		-- Spawn
		eq.spawn2(eq.ChooseRandom(292072,292083),0,0,-813,-74,59,472):AddToHateList(e.self:GetHateRandom());	-- SW 1st
		eq.spawn2(eq.ChooseRandom(292072,292083),0,0,-902,-83,59,26):AddToHateList(e.self:GetHateRandom());		-- SE 1st
		eq.spawn2(eq.ChooseRandom(292072,292083),0,0,-904,109,59,226):AddToHateList(e.self:GetHateRandom());	-- NE 1st
		eq.spawn2(eq.ChooseRandom(292072,292083),0,0,-827,110,59,270):AddToHateList(e.self:GetHateRandom());	-- NW 1st
	elseif e.timer == "add_phase_2" then
		eq.stop_timer("add_phase_2");
		eq.set_timer("add_phase_3", 1 * 60 * 1000) -- 1 Minute Timer

		-- Signal summoners to lay down
		eq.signal(292087, 1);

		-- Spawn
		eq.spawn2(eq.ChooseRandom(292072,292083),0,0,-822,-77,59,474):AddToHateList(e.self:GetHateRandom());	-- SW 2nd
		eq.spawn2(eq.ChooseRandom(292072,292083),0,0,-911,-79,59,22):AddToHateList(e.self:GetHateRandom());		-- SE 2nd
		eq.spawn2(eq.ChooseRandom(292072,292083),0,0,-895,112,59,228):AddToHateList(e.self:GetHateRandom());	-- NE 2nd
		eq.spawn2(eq.ChooseRandom(292072,292083),0,0,-817,106,59,282):AddToHateList(e.self:GetHateRandom());	-- NW 2nd
	elseif e.timer == "add_phase_3" then
		eq.stop_timer("add_phase_3");

		-- Signal summoners to lay down
		eq.signal(292088, 1);

		-- Spawn
		eq.spawn2(eq.ChooseRandom(292072,292083),0,0,-830,-83,59,478):AddToHateList(e.self:GetHateRandom());	-- SW 3rd
		eq.spawn2(eq.ChooseRandom(292072,292083),0,0,-921,-76,59,32):AddToHateList(e.self:GetHateRandom());		-- SE 3rd
		eq.spawn2(eq.ChooseRandom(292072,292083),0,0,-886,117,59,226):AddToHateList(e.self:GetHateRandom());	-- NE 3rd
		eq.spawn2(eq.ChooseRandom(292072,292083),0,0,-808,102,59,290):AddToHateList(e.self:GetHateRandom());	-- NW 3rd
		
		mob_count = 12;

		e.self:ModifyNPCStat("special_abilities",abilities_inactive);
		e.self:SetOOCRegen(0);
		e.self:WipeHateList();

		eq.signal(292067, 2); -- #Guardian_of_Destruction (292067) go to sleep

		-- wake up anchorite and disciples
		eq.signal(292072,1);
		eq.signal(292083,1);

		eq.zone_emote(MT.Yellow,"Completing their chant of power, some of the trusik collapse to the floor. A destructive spirit appears in their place.");
	elseif e.timer == "anim" then
		e.self:SetAppearance(3); -- Dead
		eq.stop_timer("anim");
	end
end

function event_hp(e)
    if e.hp_event == 40 then
		eq.zone_emote(MT.Yellow,"Barxt's bond with the Guardian of Destruction causes his skin to harden like rock, giving his lithe body an onyx sheen.  He cracks a devilish smile and beckons you to continue.");
		e.self:ModSkillDmgTaken(0, -70);	-- 1h blunt
		e.self:ModSkillDmgTaken(1, -70);	-- 1h slashing
		e.self:ModSkillDmgTaken(2, -70);	-- 2h blunt
		e.self:ModSkillDmgTaken(3, -70);	-- 2h slashing
		e.self:ModSkillDmgTaken(28, -70);	-- hand to hand
		e.self:ModSkillDmgTaken(36, -70);	-- piercing
		e.self:ModSkillDmgTaken(51, -70);	-- throwing
		e.self:ModSkillDmgTaken(77, -70);	-- 2h piercing
		eq.set_next_hp_event(10);
		eq.stop_timer("add_phase_1");
		eq.stop_timer("add_phase_2");
		eq.stop_timer("add_phase_3");
		
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if npc.valid and (npc:GetNPCTypeID() == 292074 or npc:GetNPCTypeID() == 292075) then
				npc:SetSpecialAbility(24, 0);
				npc:SetSpecialAbility(35, 0);
				npc:SetSpecialAbility(25, 0);
				npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end	
	elseif e.hp_event == 10 then
		eq.zone_emote(MT.Yellow,"Barxt's cronies focus their attention to his defense, causing tendrils of dark magic to wrap around his slender frame.  He laughs, reveling in his newfound resistance to offensive spells.");
		e.self:ModifyNPCStat("mr","400");
		e.self:ModifyNPCStat("pr","400");
		e.self:ModifyNPCStat("fr","400");
		e.self:ModifyNPCStat("cr","400");
		e.self:ModifyNPCStat("dr","400");
		-- remove dmg taken mods
		e.self:ModSkillDmgTaken(0, 0);	-- 1h blunt
		e.self:ModSkillDmgTaken(1, 0);	-- 1h slashing
		e.self:ModSkillDmgTaken(2, 0);	-- 2h blunt
		e.self:ModSkillDmgTaken(3, 0);	-- 2h slashing
		e.self:ModSkillDmgTaken(28, 0);	-- hand to hand
		e.self:ModSkillDmgTaken(36, 0);	-- piercing
		e.self:ModSkillDmgTaken(51, 0);	-- throwing
		e.self:ModSkillDmgTaken(77, 0);	-- 2h piercing
		
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(292073) then -- NPC: #Guardian_of_Destruction_
			eq.zone_emote(MT.Yellow,"The voice of Preshna the Lost rings in your ears, 'You MUST destroy the golem first to free Barxt's spirit from this world!'");
		end
    end
end

function event_signal(e)
	if e.signal == 1 then
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(292070) then 
			eq.depop(292070)
			eq.spawn2(292073,0,0,-866,-43,61,260); -- NPC: #Guardian_of_Destruction_
		end

		if mob_count > 0 then
			mob_count = mob_count -1
		end

		if e.self:GetHP() > hp_one_percent then 
			e.self:SetHP(e.self:GetHP() - hp_one_percent) 
		end

		if mob_count == 0 then 
			e.self:ModifyNPCStat("special_abilities",abilities_active);
			eq.set_timer("add_phase_1", 1 * 60 * 1000) -- 1 Minute Timer
			eq.signal(292067, 3); -- #Guardian_of_Destruction (292067) wake up

			-- Make summoners stand up
			eq.signal(292086, 2);
			eq.signal(292087, 2);
			eq.signal(292088, 2);
		end
	elseif e.signal == 2 then
		local npc_list = eq.get_entity_list():GetNPCList();
		if npc_list ~= nil then
			-- loop through the list entries
			for npc in npc_list.entries do
			
				if npc:GetNPCTypeID() == 292074 or npc:GetNPCTypeID() == 292075 then
					-- for each destructive channeler, add 7500 hp
					if e.self:GetHPRatio() <= 99 then 
						e.self:SetHP( e.self:GetHP() + 7500 );
					end
				end
			end
		end
	end
end

function event_death_complete(e)
	local instance_id = eq.get_zone_instance_id();
	local x,y,z,h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();

	-- Depop summoners
	eq.depop_all(292086);
	eq.depop_all(292087);
	eq.depop_all(292088);

	-- Depop Aura
	eq.depop_all(292028);

	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(292073) then -- Failure
		eq.set_global(instance_id.."_vrexguardianfail","1",3,"H6");
		e.self:RemoveItem(68740);
		e.self:RemoveItem(68741);
		e.self:RemoveItem(68742);
		e.self:RemoveItem(68743);
		e.self:RemoveItem(68748);
		e.self:RemoveItem(68749);
		e.self:RemoveItem(68750);
		e.self:RemoveItem(68751);
		e.self:RemoveItem(68752);
		e.self:RemoveItem(68753);
		e.self:RemoveItem(68754);
		e.self:RemoveItem(68755);
		e.self:RemoveItem(68756);
		e.self:RemoveItem(68757);
		eq.zone_emote(MT.Yellow,"You done messed up now boys! I award you no loot and may god have mercy on your soul!");
	end
	eq.spawn2(292076,0,0,x,y,z,h); -- NPC: #Specter_of_Barxt
	eq.signal(292079, 3); -- NPC: lockout_uqua
	eq.get_entity_list():FindDoor(5):SetLockPick(0); --unlock barxt door
end
