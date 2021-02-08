function Craftmaster_Spawn(e)
	eq.set_timer("depop",30*60*1000);
end

function Craftmaster_Combat(e)
	if e.joined==true then		
		eq.set_next_hp_event(70);
		eq.stop_timer("depop");
	else
		eq.set_timer("depop",5*60*1000);
	end
end

function Craftmaster_HP(e)
	if (e.hp_event == 70) then
		e.self:Emote("produces a bright red crystal and tosses it to the ground near her feet. The crystal shatters and a fire elemental surges forth and attacks.");
		e.self:Shout("Meet Flamegore the Destroyer! Eliminate them, my servant.");
		eq.set_next_hp_event(45);
		eq.spawn2(334089, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); -- NPC: #Flamegore
	elseif (e.hp_event == 45) then
		e.self:Emote("produces a bright red crystal and tosses it to the ground near her feet. The crystal shatters and a fire elemental surges forth and attacks.");
		e.self:Shout("If Flamegore was not enough to destroy you, then I shall unleash Sizzle! His heat is extravagant and even he can barely control it!");	
		eq.set_next_hp_event(20);
		eq.spawn2(334090, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); -- NPC: #Sizzle
	elseif (e.hp_event == 20) then
		e.self:Emote("produces a bright red crystal and tosses it to the ground near her feet. The crystal shatters and a fire elemental surges forth and attacks.");
		e.self:Shout("You leave me no choice! Come forth, Hotspot!");
		eq.set_next_hp_event(10);
		eq.spawn2(334091, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); -- NPC: #Hotspot
	elseif (e.hp_event == 10) then
		local npc_list = eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 334097 or npc:GetNPCTypeID() == 334098 or npc:GetNPCTypeID() == 334099 or npc:GetNPCTypeID() == 334100 or npc:GetNPCTypeID() == 334101)) then
				npc:Damage(e.self, 1000000, 0, 1);					
				new_hp= e.self:GetHP()+e.self:GetMaxHP()/10;
				e.self:SetHP(new_hp);
				eq.set_next_hp_event(10);
				break;
			end
		end		
	end
end


function Craftmaster_Timer(e)
	if e.timer=="depop" then
		eq.depop_all(334089);
		eq.depop_all(334091);
		eq.depop_all(334097);
		eq.depop_all(334098);
		eq.depop_all(334099);
		eq.depop_all(334100);
		eq.depop_all(334101);
		eq.depop();
	end
end

function ElementalCombat(e)
	if e.joined ==true then
		eq.set_timer("blameless",math.random(1, 15)*1000); --3230
		eq.set_timer("heatwave",math.random(3, 7)*1000); --5816
	else
		eq.stop_timer("blameless");
		eq.stop_timer("heatwave");
	end
end

function ElementalTimer(e)
	if e.timer=="blameless" then
		e.self:CastSpell(3230, e.self:GetTarget():GetID()); -- Spell: Balance of the Nameless
		eq.set_timer("blameless",10*1000);
	elseif e.timer=="heatwave" then
		e.self:CastSpell(5816, e.self:GetTarget():GetID()); -- Spell: Heatwave
		eq.set_timer("heatwave",20*1000);
	end
end

function HotspotDeath(e)
	e.self:Emote("flares up and then dies out completely. Where he was there are five small elementals.");
	eq.spawn2(334097, 0, 0, e.self:GetX()+5, e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #Flareup
	eq.spawn2(334098, 0, 0, e.self:GetX()-5, e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #Flametop
	eq.spawn2(334099, 0, 0, e.self:GetX(), e.self:GetY()+5, e.self:GetZ(), e.self:GetHeading()); -- NPC: #Cinder
	eq.spawn2(334100, 0, 0, e.self:GetX(), e.self:GetY()-5, e.self:GetZ(), e.self:GetHeading()); -- NPC: #Coal
	eq.spawn2(334101, 0, 0, e.self:GetX()-5, e.self:GetY()-5, e.self:GetZ(), e.self:GetHeading()); -- NPC: #Burnscar
end

function event_encounter_load(e)
--#Craftmaster_Tieranu (334087)
--#Hotspot (334091) --20
--#Burnscar (334101)
--#Cinder (334099)
--#Coal (334100)
--#Flamegore (334089) --70
--#Flametop (334098)
--#Flareup (334097)
--#Sizzle (334090) --45

	eq.register_npc_event("ranger_2_0", Event.timer, 334089, ElementalTimer);
	eq.register_npc_event("ranger_2_0", Event.timer, 334090, ElementalTimer);
	eq.register_npc_event("ranger_2_0", Event.timer, 334091, ElementalTimer);
    eq.register_npc_event("ranger_2_0", Event.timer, 334097, ElementalTimer);
	eq.register_npc_event("ranger_2_0", Event.timer, 334098, ElementalTimer);
	eq.register_npc_event("ranger_2_0", Event.timer, 334099, ElementalTimer);
	eq.register_npc_event("ranger_2_0", Event.timer, 334100, ElementalTimer);
	eq.register_npc_event("ranger_2_0", Event.timer, 334101, ElementalTimer);
	eq.register_npc_event("ranger_2_0", Event.combat, 334089, ElementalCombat);
	eq.register_npc_event("ranger_2_0", Event.combat, 334090, ElementalCombat);
	eq.register_npc_event("ranger_2_0", Event.combat, 334091, ElementalCombat);
    eq.register_npc_event("ranger_2_0", Event.combat, 334097, ElementalCombat);
	eq.register_npc_event("ranger_2_0", Event.combat, 334098, ElementalCombat);
	eq.register_npc_event("ranger_2_0", Event.combat, 334099, ElementalCombat);
	eq.register_npc_event("ranger_2_0", Event.combat, 334100, ElementalCombat);
	eq.register_npc_event("ranger_2_0", Event.combat, 334101, ElementalCombat);
	
    eq.register_npc_event("ranger_2_0", Event.death_complete, 334091, HotspotDeath)

    eq.register_npc_event("ranger_2_0", Event.spawn,	334087, Craftmaster_Spawn)
	eq.register_npc_event("ranger_2_0", Event.combat,	334087, Craftmaster_Combat)
    eq.register_npc_event("ranger_2_0", Event.hp,		334087, Craftmaster_HP)
    eq.register_npc_event("ranger_2_0", Event.timer,	334087, Craftmaster_Timer)
end

function event_encounter_unload(e)
end