function Controller_Spawn(e)
	eq.set_timer("spawnevent", 3 * 1000);
	reset = 0;
end

function Controller_Timer(e)
	if (e.timer == "spawnevent") then
		eq.stop_timer("spawnevent");
		eq.unique_spawn(301034, 0, 0, 677,-419,-816.125,0):SetAppearance(3);
		--a_slumbering_beast (301034) X: 677.000000	Y: -419.000000	Z: -816.125000	Heading: 0.000000 lying down

		eq.spawn2(301031, 0, 0, 632,-328,-821.125,128);
		-- Ikaav_Dreamweaver (301031) X: 632.000000	Y: -328.000000	Z: -821.125000	Heading: 128.000000

		eq.spawn2(301031, 0, 0, 748,-352,-819.5,256);
		-- Ikaav_Dreamweaver (301031)  X: 748.000000	Y: -352.000000	Z: -819.500000	Heading: 256.000000

		eq.spawn2(301031, 0, 0, 681,-476,-827.75,462);
		-- Ikaav_Dreamweaver (301031)  X: 681.000000	Y: -476.000000	Z: -827.750000	Heading: 462.000000
		reset = 0;
		
	elseif (e.timer == "respawn") then
		eq.stop_timer("respawn");
		eq.unique_spawn(301034, 0, 0, 677,-419,-816.125,0):SetAppearance(3);
		--a_slumbering_beast (301034) X: 677.000000	Y: -419.000000	Z: -816.125000	Heading: 0.000000 lying down

		eq.spawn2(301031, 0, 0, 632,-328,-821.125,128);
		-- Ikaav_Dreamweaver (301031) X: 632.000000	Y: -328.000000	Z: -821.125000	Heading: 128.000000

		eq.spawn2(301031, 0, 0, 748,-352,-819.5,256);
		-- Ikaav_Dreamweaver (301031)  X: 748.000000	Y: -352.000000	Z: -819.500000	Heading: 256.000000

		eq.spawn2(301031, 0, 0, 681,-476,-827.75,462);
		-- Ikaav_Dreamweaver (301031)  X: 681.000000	Y: -476.000000	Z: -827.750000	Heading: 462.000000
		reset = 0;
	end
end

function Controller_Signal(e)
	local reset = 0;
	if(e.signal == 1) then
		--eq.debug("signal received to reset");
		if (reset == 0) then
			
			reset = 1;
			--eq.debug("reset status " .. reset);
			eq.depop_all(301031); --ikaav
			eq.depop_all(301034); --slumbering beast
			eq.depop_all(301062); --gaz
		
			eq.set_timer("respawn", 1800 * 1000); --30 min respawn event
			
		end
	end
end

function Dream_Combat(e)
  if e.joined then
    eq.set_timer("aggrolink", 3 * 1000);
  else
    eq.stop_timer("aggrolink");
  end
end

function Dream_Timer(e)
  if (e.timer == "aggrolink") then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 301031)) then
			npc:AddToHateList(e.self:GetHateRandom(),1); -- add Ikaav_Dreamweaver (301031) to aggro list if alive
		end
		end
  end
end

function Dream_Death(e)
  local el = eq.get_entity_list();
  if not el:IsMobSpawnedByNpcTypeID(301031) and el:IsMobSpawnedByNpcTypeID(301034) then
    -- Depop the 'a slumbering beast' 301034
    eq.depop_all(301034);
    
    -- Spawn Gaz the Gargantuan 301062
    eq.spawn2(301062, 0, 0, 677, -419, -816, 0); -- NPC: #Gazz_the_Gargantuan
eq.zone_emote(MT.White,"The earth beneath your feet shakes as the gargantuan beast awakens.");
  end
end

function Gaz_Death(e)
  eq.depop_with_timer(301084); --gaz_controller (301084)
end

function Gaz_Combat(e)
  if e.joined then
    eq.stop_timer('reset');
    eq.set_timer('aeramp', 30 * 1000);
  else 
    eq.set_timer('reset', 1200 * 1000);
    eq.stop_timer('aeramp');
    eq.stop_timer('reflect');
    eq.stop_timer('detonate');
  end
end

function Gaz_Timer(e)
  if (e.timer == 'reset') then
    eq.signal(301084,1); --gaz_controller (301084) initiate respawn sequence
  elseif(e.timer=='aeramp') then
    eq.stop_timer('aeramp');
    eq.set_timer('detonate', 5 * 1000);
    eq.set_timer('reflect', 30 * 1000);
    e.self:RemoveAISpell(5822);
    eq.zone_emote(MT.Red,"Gazz the Gargantuan slows its gait and begins flailing muscular arms in all directions.");
    
    e.self:SetSpecialAbility(SpecialAbility.immune_ranged_attacks, 0);
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
    e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 2, 200);
    
    e.self:ModifyNPCStat("runspeed", "1");
  elseif(e.timer=='reflect') then
    eq.stop_timer('reflect');
    eq.stop_timer('detonate');
    eq.set_timer('aeramp', 30 * 1000);
    
    e.self:CastSpell(5822, 0); -- Spell: Reflective Sheen
    
    e.self:RemoveAISpell(2490);
    
    eq.zone_emote(MT.Red,"Gazz the Gargantuan unleashes an earth shattering roar and picks up speed.");
    
    e.self:SetSpecialAbility(SpecialAbility.immune_ranged_attacks, 1);
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 0);
    
    e.self:ModifyNPCStat("runspeed", "2");
  elseif(e.timer=='detonate') then
    e.self:CastSpell(2490, 0); -- Spell: Detonation
  end
end

function event_encounter_load(e)
  eq.register_npc_event('gaz', Event.death_complete, 301031, Dream_Death);
  eq.register_npc_event('gaz', Event.combat, 301031, Dream_Combat);
  eq.register_npc_event('gaz', Event.timer, 301031, Dream_Timer);
  
  
  eq.register_npc_event('gaz', Event.death_complete, 301062, Gaz_Death);
  eq.register_npc_event('gaz', Event.combat,         301062, Gaz_Combat);
  eq.register_npc_event('gaz', Event.timer,          301062, Gaz_Timer);
	
eq.register_npc_event('gaz', Event.timer,          301084, Controller_Timer);
eq.register_npc_event('gaz', Event.spawn,          301084, Controller_Spawn);
eq.register_npc_event('gaz', Event.signal,          301084, Controller_Signal);
end
