local box = require("aa_box")
local tether_box = box(-480,-810,-1290,-1160);

local abilities_inactive = "19,1^20,1^21,1^24,1^25,1^35,1";
local abilities_active = "1,1^2,1^5,1^7,1^13,1^14,1^15,1^16,1^17,1^21,1";
local abilities_enraged = "1,1^2,1^5,1^7,1^13,1^14,1^15,1^16,1^17,1^21,1";

local twin_absorbed = false;


function event_spawn(e)
	eq.set_timer("tether", 3 * 1000) -- 3s Check on tether
	e.self:ModifyNPCStat("special_abilities",abilities_inactive);
end

function event_timer(e)
	if e.timer == "tether" then
		if not tether_box:contains(e.self:GetX(), e.self:GetY()) then
			e.self:GotoBind();
		end	
	elseif e.timer == "fail" then
		e.self:ModifyNPCStat("special_abilities",abilities_inactive);
		e.self:WipeHateList();
		eq.spawn2(292018,0,0,-1252,-911,8,134); -- NPC: a_construct_of_fury
		eq.spawn2(292018,0,0,-1250,-878,8,128); -- NPC: a_construct_of_fury
		eq.spawn2(292018,0,0,-1193,-911,8,378); -- NPC: a_construct_of_fury
		eq.spawn2(292018,0,0,-1190,-878,8,386); -- NPC: a_construct_of_fury
		eq.stop_timer("fail");
	elseif e.timer == "absorb_twin" then
		twin_absorbed = true;
		eq.zone_emote(MT.Yellow,"Sensing Araxt the Enraged's death, Qukret the Furious bristles with anger and the forces of fury and rage become one. You have inadvertently made him even stronger.");
		e.self:AddAISpell(0, 5115, 1, -1, -1, -350);
		e.self:AddAISpell(0, 5116, 1, -1, -1, -250);
		e.self:AddAISpell(0, 5119, 1, -1, -1, -350);
		e.self:ModifyNPCStat("special_abilities",abilities_enraged);
		e.self:ModifyNPCStat("max_hit","2049");
		e.self:ModifyNPCStat("min_hit","548");
		e.self:ModifyNPCStat("max_hp","700000");
		e.self:ModifyNPCStat("accuracy","1500");
		e.self:ModifyNPCStat("mr", "250"); --gained a lot of resists
		e.self:ModifyNPCStat("fr", "250");
		e.self:ModifyNPCStat("cr", "250");
		e.self:ModifyNPCStat("pr", "250");
		e.self:ModifyNPCStat("dr", "250");
		e.self:ModSkillDmgTaken(36, -50);	-- piercing
		e.self:ModSkillDmgTaken(77, -50);	-- 2h piercing
		e.self:ModSkillDmgTaken(2, -50);	-- 2h blunt
		e.self:ModSkillDmgTaken(51, -50);	-- throwing
		e.self:ModSkillDmgTaken(28, -50);	-- hand to hand
		e.self:ModSkillDmgTaken(1, -50);	-- 1h slashing
		e.self:ModSkillDmgTaken(3, -50);	-- 2h slashing
		--e.self:ModSkillDmgTaken(7, -50);	-- archery(omitted via live testing)
		e.self:ModSkillDmgTaken(0, -50);	-- 1h blunt
		e.self:SetHP(e.self:GetMaxHP());
		eq.stop_timer("absorb_twin");
	end
end

function event_signal(e)
	if e.signal == 1 then
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(292018) then -- NPC: #Construct_of_Fury
			if not twin_absorbed then
				e.self:ModifyNPCStat("special_abilities",abilities_active);
			elseif twin_absorbed then
				e.self:ModifyNPCStat("special_abilities",abilities_enraged);
			end
			eq.set_timer("fail", 30 * 60 * 1000) -- 30 Minute Failure
		end
	elseif e.signal == 3 then -- Twin is dead
		eq.set_timer("absorb_twin", 30 * 1000) -- 30s from twin death to enrage
	end
end

function event_death_complete(e)
	eq.create_ground_object(67706,-1227,-628,-5,0,3600000); -- Item: Orb of Fury
	eq.signal(292022,3); -- NPC: #Tqiv_Araxt_the_Enraged
	eq.signal(292079, 1); -- NPC: lockout_uqua
end

function event_slay(e)
	if e.other:IsClient() or e.other:IsPet() then -- not sure why this is necessary, but otherwise will occasionally spawn adds when an event mob dies
		local x,y,z,h = e.other:GetX(), e.other:GetY(), e.other:GetZ(), e.other:GetHeading();
		eq.spawn2(eq.ChooseRandom(292043,292044,292045,292046,292047,292048,292049,292050),0,0,x,y,z,h); -- NPC(s): #a_coercing_spirit (292043), #a_malevolent_spirit (292044), #a_slighted_spirit (292045), #a_spiteful_spirit (292046), #a_vengeful_spirit (292047), #a_vindictive_spirit (292048), #an_avenging_spirit (292049), #an_infuriated_spirit (292050)
	end
end
