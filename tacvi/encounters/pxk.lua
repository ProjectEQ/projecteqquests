local entity_list = eq.get_entity_list();
local juxtapincer = 4;
local lifebleeder = 4;
local manasipper  = 4;
local ragehound   = 4;

function PXK_Spawn(e)
	e.self:SetPseudoRoot(true);
	eq.set_next_hp_event(90);
	eq.signal(298223,2);
end

function PXK_Death(e)
	eq.signal(298223, 298039); -- NPC: zone_status
	eq.signal(298223,2,1000); -- Unlock Doors
end

function PXK_Combat(e)
	if e.joined then
		e.self:Say("Have at you intruder. This is the domain of the commander and only those strong enough to beat me shall pass.");
	else 
		-- Wipe mechanics
		-- Depop adds, repop myself
		eq.stop_timer("cleaver");
		eq.stop_timer("rage");
		eq.stop_timer("check");
		eq.depop_all(298044);
		eq.depop_all(298043);
		eq.depop_all(298042);
		eq.depop_all(298041);
		eq.spawn2(298039,0,0,151,-162,-6,385); -- NPC: Pixtt_Xxeric_Kex
		eq.depop();

		-- reset the pet event counters in case of a wipe.
		juxtapincer = 0;
		lifebleeder = 0;
		manasipper  = 0;
		ragehound   = 0;

		eq.signal(298223,2); -- Unlock Doors
	end
end

function PXK_Hp(e)
	--90pct unroot
	if e.hp_event == 90 then
		--locks door leading into her chamber
		eq.signal(298223,1); -- Lock Doors
		eq.zone_emote(MT.Red,"Xxeric begins to froth at the mouth as her skin becomes more rigid and her rage begins to grow. You feel a force from behind you as the door is once again sealed.");
		e.self:SetPseudoRoot(false);
		e.self:CastedSpellFinished(4729, e.self:GetHateRandom()); -- Spell: Spirit Cleaver
		eq.set_timer("cleaver", 120 * 1000);
		eq.set_timer("check", 1 * 1000);
		eq.modify_npc_stat("ac", "1150");
		eq.modify_npc_stat("min_hit", "595");
		eq.modify_npc_stat("max_hit", "4500");
		eq.set_next_hp_event(70);
		juxtapincer = 0;
		lifebleeder = 0;
		manasipper  = 0;
		ragehound   = 0;
	elseif e.hp_event == 70 then
		eq.zone_emote(MT.Red,"The froth around her mouth thickens as she channels the force of her growing rage into each attack, sacrificing her thickened skin.");
		eq.modify_npc_stat("ac", "604");
		eq.modify_npc_stat("min_hit", "1300");
		eq.modify_npc_stat("max_hit", "5945");
		e.self:SetSpecialAbility(SpecialAbility.flurry, 0);
		e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
		e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 2, 85); -- 15 % mitigated dmg
		eq.set_timer("cleaver", 90 * 1000);
		eq.set_next_hp_event(50);
	elseif e.hp_event == 50 then
		eq.zone_emote(MT.Red,"Raising her head to the sky, Xxeric lets out a battle cry that shakes the walls and calls forth a pack of raging ukun hounds. 'Prepare yourself for the afterlife this is the reality of the Mata Muram army.");
		-- she begins casting  Wave of Rage
		e.self:CastedSpellFinished(4728, e.self:GetHateRandom()); -- Spell: Wave of Rage
		eq.set_timer("cleaver", 60 * 1000);
		eq.set_timer("rage", 60 * 1000);
		eq.modify_npc_stat("ac", "900");
		-- Spawn the Pets
		eq.spawn2(298044,0,0, 151, -113, -6.87, 314); -- NPC: an_ukun_juxtapincer
		eq.spawn2(298043,0,0, 151, -218, -6.87, 450); -- NPC: an_ukun_lifebleeder
		eq.spawn2(298042,0,0,  81, -113, -6.87,  194); -- NPC: an_ukun_manasipper
		eq.spawn2(298041,0,0,  81, -218, -6.87,  40); -- NPC: an_ukun_ragehound
		eq.set_next_hp_event(30);
	elseif e.hp_event == 30 then
		eq.modify_npc_stat("min_hit", "1275");
		eq.modify_npc_stat("max_hit", "5185");
		eq.modify_npc_stat("ac", "700");
		e.self:Say("I commend you on your tenacity, infidels. However I am through playing games. Witness the true fighting power of an Ixt Berserker.");
		-- should this be red zone emote?
		eq.set_timer("cleaver", 30 * 1000);
		eq.set_next_hp_event(10);
	elseif e.hp_event == 10 then
		-- When she hits 10%, she will regenerate to 40% health and strip her debuffs
		-- Balance of the nameless, strip self debuffs
		e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
		e.self:SetHP(e.self:GetMaxHP()*0.40)
		eq.modify_npc_stat("min_hit", "1245");
		eq.modify_npc_stat("max_hit", "4665");
		eq.zone_emote(MT.Red,"You may yet have the strength to defeat me but I am not through with you yet. Xxeric's eyes turn blood red as she enters an uncontrollable rage. Focusing on her wounds, she begins to recover some health.");
	end
end

function PXK_Timer(e)
	if e.timer == "cleaver" then
		e.self:CastedSpellFinished(4729, e.self:GetHateRandom()); -- Spell: Spirit Cleaver
	elseif e.timer == "rage" then
		e.self:CastedSpellFinished(4728, e.self:GetHateRandom()); -- Spell: Wave of Rage
	elseif e.timer == "check" then
		--local rand = math.random(1,100);
		--if (rand >= 85) then -- 15 % to cast throw
		local instance_id = eq.get_zone_instance_id();
		e.self:ForeachHateList(
			function(ent, hate, damage, frenzy)
				if(ent:IsClient() and ent:GetX() < 49 or ent:GetY() < -243 or ent:GetY() > -86 or ent:GetX() > 195) then
					local currclient=ent:CastToClient();
					--e.self:Shout("You will not evade me " .. currclient:GetName())
					currclient:MovePCInstance(298,instance_id, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- Zone: tacvi
					currclient:Message(MT.Magenta,"Pixtt Xxeric Kex says, 'Did you think I would let you enter these halls without consequence?");
				end
			end
		);
	end
end

function PXK_Juxtapincer_Death(e)
	if juxtapincer < 3 then
		juxtapincer = juxtapincer + 1;
		eq.spawn2(298044,0,0, 151, -113, -6.87, 314); -- NPC: an_ukun_juxtapincer
		e.self:Emote("flesh and bones are reformed by dark magic");
	end
end

function PXK_Lifebleeder_Death(e)
	if lifebleeder < 3 then
		lifebleeder = lifebleeder + 1;
		eq.spawn2(298043,0,0, 151, -218, -6.87, 450); -- NPC: an_ukun_lifebleeder
		e.self:Emote("flesh and bones are reformed by dark magic");
	end
end

function PXK_Manasipper_Death(e)
	if manasipper < 3 then
		manasipper = manasipper + 1;
		eq.spawn2(298042,0,0,  81, -113, -6.87,  194); -- NPC: an_ukun_manasipper
		e.self:Emote("flesh and bones are reformed by dark magic");
	end
end

function PXK_Ragehound_Death(e)
	if ragehound < 3 then
		ragehound = ragehound + 1;
		eq.spawn2(298041,0,0,  81, -218, -6.87,  40); -- NPC: an_ukun_ragehound
		e.self:Emote("flesh and bones are reformed by dark magic");
	end
end

function event_encounter_load(e)
	eq.register_npc_event('pxk', Event.spawn,  298039, PXK_Spawn);
	eq.register_npc_event('pxk', Event.combat, 298039, PXK_Combat);
	eq.register_npc_event('pxk', Event.hp,     298039, PXK_Hp);
	eq.register_npc_event('pxk', Event.timer,     298039, PXK_Timer);

	eq.register_npc_event('pxk', Event.death_complete, 298044, PXK_Juxtapincer_Death);
	eq.register_npc_event('pxk', Event.death_complete, 298043, PXK_Lifebleeder_Death);
	eq.register_npc_event('pxk', Event.death_complete, 298042, PXK_Manasipper_Death);
	eq.register_npc_event('pxk', Event.death_complete, 298041, PXK_Ragehound_Death);

	eq.register_npc_event('pxk', Event.death_complete, 298039, PXK_Death);
end

function event_encounter_unload(e)
	eq.depop_all(298044);
	eq.depop_all(298043);
	eq.depop_all(298042);
	eq.depop_all(298041);
	eq.depop_all(298039);
end
