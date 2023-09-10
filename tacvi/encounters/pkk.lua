local hatchlings_spawned = 0;
local hatchlings_killed = 0;
local PKK_hitpoints = 100; -- Also reset to 100 on wipe

function PKK_Spawn(e)
	e.self:ModSkillDmgTaken(3, -30); -- 2h slashing
	e.self:ModSkillDmgTaken(1, -30); -- 1h slashing
	e.self:ModSkillDmgTaken(7, -25); -- archery
	if PKK_hitpoints == 100 then -- First spawn/wipe!
		eq.set_next_hp_event(90);
		hatchlings_spawned = 0;
		hatchlings_killed = 0;
		eq.signal(298223,2); -- Unlock Doors
	else -- Respawning because all hatchlings are dead
		eq.depop_all(298047); -- husk
		e.self:SetHP(e.self:GetMaxHP() * (PKK_hitpoints / 100.0));
		if PKK_hitpoints == 90 then
			 eq.set_next_hp_event(70);
		elseif PKK_hitpoints == 70 then
			 eq.set_next_hp_event(50);
		elseif PKK_hitpoints == 50 then
			 eq.set_next_hp_event(30);
		elseif PKK_hitpoints == 30 then
			 eq.set_next_hp_event(10);
		end
	end
end

function PKK_Death(e)
	eq.signal(298223, 298201); -- NPC: zone_status
	eq.signal(298223,2,1000); -- Unlock Doors
end

function PKK_Combat(e)
	if e.joined then
		e.self:Say("You shall regret trespassing into my chambers. The might of our kind shall smother the flames of life in this world, starting with you.");
		e.self:Say("Do you really think your paltry skills will be enough to best a being as powerful as I? ");
			if (e.self:GetHPRatio() < 92) then
				eq.set_timer("check", 1 * 1000); -- set scorpion timer on future phases
			end
	elseif not e.joined then
		eq.set_timer("wipecheck", 5000);
		eq.stop_timer("check");
	end
end

function PKK_Husk_Spawn(e)
	eq.set_timer("wipecheck", 1500);
end

function PKK_Timer(e)
	if (e.timer == "wipecheck") then
		-- Check to see if there are any Clients in the room with PKK
		local client = eq.get_entity_list():GetRandomClient(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 5000);
		if not client:IsClient() then
			PKK_hitpoints = 100;
			eq.depop_all(298203); -- Reflection 1
			eq.depop_all(298204); -- Reflection 2
			eq.depop_all(298046); -- Reflection 3
			eq.depop_all(298146); -- Reflection 4
			eq.depop_all(298048); -- Hatchling
			eq.depop(); -- will depop either husk or PKK
			eq.spawn2(298201, 0, 0, 161.0, 242.0, -4.125, 378); -- NPC: Pixtt_Kretv_Krakxt
			eq.signal(298223,2); -- Unlock Doors
		end
	elseif (e.timer == "tenae") then
		e.self:CastSpell(eq.ChooseRandom(889, 887, 751, 888),e.self:GetTarget():GetID());
	elseif (e.timer == "check") then
		local instance_id = eq.get_zone_instance_id();
		e.self:ForeachHateList(
			function(ent, hate, damage, frenzy)
				if(ent:IsClient() and ent:GetX() < 99 or ent:GetX() > 245 or ent:GetY() < 192 or ent:GetY() > 297) then
					local currclient=ent:CastToClient();
					--e.self:Shout("You will not evade me " .. currclient:GetName())
					currclient:MovePCInstance(298,instance_id, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- Zone: tacvi
					currclient:Message(MT.Magenta,"Pixtt Kretv Krakxt says, 'You dare enter my chambers and then try to leave? Your punishment will be quite severe.");
				end
			end
		);
	end
end

function Spawn_Hatchlings(number, x, y, z, h)
	hatchlings_spawned = number;
	hatchlings_killed = 0;

	eq.spawn2(298048,0,0,x+15, y+15, z, h); -- NPC: an_ikaav_hatchling
	eq.spawn2(298048,0,0,x+15, y-15, z, h); -- NPC: an_ikaav_hatchling
	eq.spawn2(298048,0,0,x-15, y-15, z, h); -- NPC: an_ikaav_hatchling

	if (number >= 4) then
		eq.spawn2(298048,0,0,x-15, y+15, z, h); -- NPC: an_ikaav_hatchling
	end
	if (number >= 5) then
		eq.spawn2(298048,0,0,x+7, y+15, z, h); -- NPC: an_ikaav_hatchling
	end
	if (number >= 6) then
		eq.spawn2(298048,0,0,x+7, y+7, z, h); -- NPC: an_ikaav_hatchling
	end
	if (number >= 7) then
		eq.spawn2(298048,0,0,x, y, z, h); -- NPC: an_ikaav_hatchling
	end
end

function PKK_Hp(e)
	PKK_hitpoints = e.hp_event;
	if (e.hp_event == 90) then
		eq.zone_emote(MT.Red,"Ha ha ha, you fools thought you could overpower me. You are nothing but food for my offspring. Come my children, strike them down and suck the marrow from their bones. Kretv's body falls to the ground -- a lifeless husk freeing the hatchlings within.");
		eq.set_timer("check", 1 * 1000);
		eq.signal(298223,1); -- Lock Doors
		eq.depop();
		eq.spawn2(298204, 93, 0, 120.0, 279.0, -7.0, 332); -- reflection
		eq.spawn2(298047, 0, 0, 161.0, 242.0, -7.0, 378):SetAppearance(3); -- husk
		Spawn_Hatchlings(4, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 189.1);
	elseif (e.hp_event == 70) then
		eq.zone_emote(MT.Red,"Your efforts shall fail no matter how great. This is a reality you shall soon see as your vile existence ceases and my brood consumes your remains.");
		eq.depop();
		Spawn_Hatchlings(5, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 189.1);
		eq.spawn2(298047, 0, 0, 161.0, 242.0, -7.0, 378):SetAppearance(3); -- husk
		eq.spawn2(298204, 93, 0, 120.0, 279.0, -7.0, 332); -- reflection
		eq.spawn2(298203, 94, 0, 228.0, 221.0, -7.0, 427.0); -- needs_heading_validation
	elseif (e.hp_event == 50) then
		eq.zone_emote(MT.Red,"You show surprising strength and conviction, but you will not get any further. The time has come for you to be destroyed.");
		eq.depop();
		Spawn_Hatchlings(6, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 189.1);
		eq.spawn2(298047, 0, 0, 161.0, 242.0, -7.0, 378):SetAppearance(3); -- husk
		eq.spawn2(298204, 93, 0, 120.0, 279.0, -7.0, 332); -- reflection
		eq.spawn2(298046, 95, 0, 116.0, 206.0, -7.0, 162); -- NPC: Reflection_of_Kretv_Krakxt
		eq.spawn2(298203, 94, 0, 228.0, 221.0, -7.0, 427.0); -- needs_heading_validation
	elseif (e.hp_event == 30) then
		eq.zone_emote(MT.Red,"My resolve is waning but I shall fight you to the very last breath. The commander looks down upon weaklings in his ranks and the ikaav are not ones to indulge in it.");
		eq.depop();
		Spawn_Hatchlings(7, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 189.1);
		eq.spawn2(298047, 0, 0, 161.0, 242.0, -7.0, 378):SetAppearance(3); -- husk
		eq.spawn2(298204, 93, 0, 120.0, 279.0, -7.0, 332); -- reflection
		eq.spawn2(298046, 95, 0, 116.0, 206.0, -7.0, 162); -- NPC: Reflection_of_Kretv_Krakxt
		eq.spawn2(298203, 94, 0, 228.0, 221.0, -7.0, 427.0); -- needs_heading_validation
		eq.spawn2(298146, 96, 0, 227.0, 284.0, -6.0, 315.0); -- needs_heading_validation
	elseif (e.hp_event == 10) then
		eq.zone_emote(MT.Red,"The end is inevitable, but if I must be defeated, some of you will join me in the afterlife.");
		Spawn_Hatchlings(3, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 189.1);
		e.self:SetSpecialAbility(SpecialAbility.rampage, 0); -- turn off single rampage
		e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1); -- turn aoe ramp on
		e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 2, 50); -- 50% mitigated aoe ramp dmg
		e.self:CastSpell(eq.ChooseRandom(889, 887, 751, 888),e.self:GetTarget():GetID());
		eq.set_timer("tenae", 12 * 1000);
	end
end

function PKK_Hatchling_Death(e)
	hatchlings_killed = hatchlings_killed + 1;
	-- the events at 10 don't want to do extra hatchling stuff
	if ( hatchlings_killed >= hatchlings_spawned and PKK_hitpoints ~= 10 ) then
		eq.spawn2(298201, 0, 0, 161.0, 242.0, -4.125, 378); -- NPC: Pixtt_Kretv_Krakxt
		eq.signal(298203, 1); -- NPC: Reflection_of_Kretv_Krakxt
		eq.signal(298204, 1); -- NPC: Reflection_of_Kretv_Krakxt
		eq.signal(298203, 1); -- NPC: Reflection_of_Kretv_Krakxt
		eq.signal(298046, 1); -- NPC: Reflection_of_Kretv_Krakxt
		eq.signal(298146, 1); -- NPC: Reflection_of_Kretv_Krakxt
	end
	e.self:Emote("black blood spills on the floor");
end

function PKK_Hatchling_Spawn(e)
	e.self:ModSkillDmgTaken(3, -20); -- 2h slashing
	e.self:ModSkillDmgTaken(1, -20); -- 1h slashing
	e.self:ModSkillDmgTaken(7, 10); -- archery
end

function PKK_Roaming_Caster_One_Spawn(e)
	eq.start(93);
	CastOnRandom(e.self, 889); -- Delusional Visions
	eq.set_timer('snake1', 30000);
end

function PKK_Roaming_Caster_Two_Spawn(e)
	eq.start(94);
	CastOnRandom(e.self, 887); -- Aura of Fatigue
	eq.set_timer('snake1', 30000);
end

function PKK_Roaming_Caster_Three_Spawn(e)
	eq.start(95);
	CastOnRandom(e.self, 751); -- Ikaav's Venom
	eq.set_timer('snake1', 30000);
end

function PKK_Roaming_Caster_Four_Spawn(e)
	eq.start(96);
	CastOnRandom(e.self, 888); -- Wrath of the Ikaav
	eq.set_timer('snake1', 30000);
end

function CastOnRandom(caster, spell)
	local client = eq.get_entity_list():GetRandomClient(162, 241, -7, 5000);
	caster:DoAnim(44);

	caster:CastSpell(spell, client:GetID());
end

function PKK_Roaming_Caster_One_Timer(e)
	CastOnRandom(e.self, 889); -- Delusional Visions
end

function PKK_Roaming_Caster_Two_Timer(e)
	CastOnRandom(e.self, 887); -- Aura of Fatigue
end

function PKK_Roaming_Caster_Three_Timer(e)
	CastOnRandom(e.self, 751); -- Ikaav's Venom
end

function PKK_Roaming_Caster_Four_Timer(e)
	CastOnRandom(e.self, 888); -- Wrath of the Ikaav
end

function PKK_Roaming_Caster_Signal(e)
	eq.depop();
end

function event_encounter_load(e)
	eq.register_npc_event('pkk', Event.spawn,          298201, PKK_Spawn);
	eq.register_npc_event('pkk', Event.combat,         298201, PKK_Combat);
	eq.register_npc_event('pkk', Event.hp,             298201, PKK_Hp);
	eq.register_npc_event('pkk', Event.timer,          298201, PKK_Timer);
	eq.register_npc_event('pkk', Event.death_complete, 298201, PKK_Death);

	eq.register_npc_event('pkk', Event.death_complete, 298048, PKK_Hatchling_Death);
	eq.register_npc_event('pkk', Event.spawn, 298048, PKK_Hatchling_Spawn);

	eq.register_npc_event('pkk', Event.spawn,          298047, PKK_Husk_Spawn);
	eq.register_npc_event('pkk', Event.timer,          298047, PKK_Timer); -- Reusing PKK Timer function, should be safe

	eq.register_npc_event('pkk', Event.spawn,          298204, PKK_Roaming_Caster_One_Spawn);
	eq.register_npc_event('pkk', Event.timer,          298204, PKK_Roaming_Caster_One_Timer);
	eq.register_npc_event('pkk', Event.signal,         298204, PKK_Roaming_Caster_Signal);

	eq.register_npc_event('pkk', Event.spawn,          298203, PKK_Roaming_Caster_Two_Spawn);
	eq.register_npc_event('pkk', Event.timer,          298203, PKK_Roaming_Caster_Two_Timer);
	eq.register_npc_event('pkk', Event.signal,         298203, PKK_Roaming_Caster_Signal);

	eq.register_npc_event('pkk', Event.spawn,          298046, PKK_Roaming_Caster_Three_Spawn);
	eq.register_npc_event('pkk', Event.timer,          298046, PKK_Roaming_Caster_Three_Timer);
	eq.register_npc_event('pkk', Event.signal,         298046, PKK_Roaming_Caster_Signal);

	eq.register_npc_event('pkk', Event.spawn,          298146, PKK_Roaming_Caster_Four_Spawn);
	eq.register_npc_event('pkk', Event.timer,          298146, PKK_Roaming_Caster_Four_Timer);
	eq.register_npc_event('pkk', Event.signal,         298146, PKK_Roaming_Caster_Signal);
end
