--#noqufiel_trigger (296075)
--##Noqufiel (296074)
--#Mirror_Image_of_Noqufiel (296066)
--#True_Image_of_Noqufiel (296065)
local true_hp=2054874;
local mirr_hpratio=100;
local true_max_hp=2054874;
local mirr_max_hp=326854;
local mirr_spawned_hp=326854;
local event_started=false;
local mirr_shakes=false;
local inst_id=0;

function TriggerSpawn(e)
	if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(296065) == false) then
		Spawn_Noqu();
		true_hp=true_max_hp;
		mirr_hp=mirr_max_hp;
		event_started=false;
	end
end

function TrueSpawn(e)
	e.self:TempName("Noqufiel");
	e.self:SetHP(true_hp);
	e.self:SendIllusionPacket({race=385,gender=0,texture=4,helmtexture=255,beard=255,face=0});
	eq.debug("true hp: " .. true_hp);
end

function MirrorSpawn(e)
	e.self:TempName("Noqufiel");
	e.self:SetHP(math.ceil(mirr_max_hp*mirr_hpratio/100));
	e.self:SendIllusionPacket({race=385,gender=0,texture=4,helmtexture=255,beard=255,face=0});
	mirr_spawned_hp=e.self:GetHP();
	eq.debug("mirr hp: " .. mirr_spawned_hp);
end

function TrueCombat(e)
	if e.joined==true then
		if event_started==false then
			event_started=true
			eq.signal(296075,1); --start CC
			eq.debug("event started");
		end
		eq.set_timer("leash",1*1000);
		eq.set_timer("random_change",15*1000);
		eq.signal(296075,4);  --refresh reset timer
		if event_started==true then
			eq.set_timer("name",5*1000);
		end	
	end
end

function MirrorCombat(e)
	if (e.joined==true) then
		eq.set_timer("leash",1*1000);
		eq.set_timer("check_hp",250);
		mirr_shakes=false
		if event_started==true then
			eq.set_timer("name",5*1000);
		end
	end
end

function MirrorTimer(e)
	if e.timer=="leash" then
		if (e.self:GetY() < -800) then
			Spawn_Noqu();
		end
	elseif e.timer=="check_hp" then
		if (e.self:GetHP()< mirr_spawned_hp-10 and mirr_shakes==false) then
			e.self:Emote("shivers violently, as if about to explode!");
			mirr_shakes=true
		elseif (e.self:GetHP()< mirr_spawned_hp-1000) then
			e.self:CastSpell(2490,e.self:GetHateRandom():GetID()); -- Spell: Detonation
			e.self:Emote("shudders and explodes!");
			eq.depop();
		end
	elseif e.timer=="name" then
		e.self:TempName("Mirror Image of Noqufiel");
		e.self:SendIllusionPacket({race=385,gender=0,texture=0,helmtexture=47,beard=255,face=255});
		eq.stop_timer("name");
	end
end

function TrueTimer(e)
	if e.timer=="leash" then
		if (e.self:GetY() < -800) then
			Spawn_Noqu();
		end
	elseif e.timer=="random_change" then 
		true_hp=e.self:GetHP();
		mirr_hpratio=e.self:GetHPRatio();
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(296066) == false then
			Spawn_Noqu();
		else		
			local roll=eq.ChooseRandom(1,2)
			eq.debug("random_change: " .. roll);
			if roll==1 then
				Spawn_Noqu();
			elseif roll==2 then
				local truenoq=eq.get_entity_list():GetMobByNpcTypeID(296065);
				local mirrnoq=eq.get_entity_list():GetMobByNpcTypeID(296066);
				local mX=mirrnoq:GetX();
				local mY=mirrnoq:GetY();
				local mZ=mirrnoq:GetZ();
				eq.depop_all(296066);
				eq.spawn2(296066, 0, 0,mX,mY,mZ,384); -- NPC: #Mirror_Image_of_Noqufiel
				eq.spawn2(296065, 0, 0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),192); -- NPC: #True_Image_of_Noqufiel
				eq.depop();
			end
		end
	elseif e.timer=="name" then
		eq.debug("true name");
		e.self:TempName("True Image of Noqufiel");
		e.self:SendIllusionPacket({race=385,gender=0,texture=0,helmtexture=47,beard=255,face=255});
		eq.stop_timer("name");
	end
end

function TrueSignal(e)
	if e.signal==1 then
		local rand_hate = e.self:GetHateRandom()
		eq.debug("banish selected: " ..rand_hate:GetName());
		if (rand_hate.valid and rand_hate:IsClient()) then
			local rand_hate_v = rand_hate:CastToClient()
			if (rand_hate_v.valid) then
				eq.debug(rand_hate_v:GetName());
				e.self:Say("begone " .. rand_hate_v:GetName())
				e.self:SetHate(rand_hate_v, 1, 1)
				rand_hate_v:MovePCInstance(296, inst_id, -117, -912, -127, 128)
			end
		end
	end
end

function TriggerTimer(e)
	if e.timer=="cursecallers" then
		eq.spawn2(eq.ChooseRandom(296059,296060,296061,296062,296063,296064), 0, 0,-238,-657,-126,242); -- NPC(s): #a_brainless_cursebearer (296059), #a_deadened_cursebearer (296060), #a_mindless_cursebearer (296061), #a_numbed_cursebearer (296062), #a_vacuous_cursebearer (296063), #an_unfeeling_cursebearer (296064)
		eq.get_entity_list():GetMobByNpcTypeID(296065):Emote("rejoices. 'May find strength in your passing, as I have'");
		eq.debug("spawn cc");
	elseif e.timer=="banish" then
		eq.signal(296065,1); -- NPC: #True_Image_of_Noqufiel
	elseif e.timer=="unlock_doors" then
		local entity_list = eq.get_entity_list();
		entity_list:FindDoor(42):SetLockPick(0);
		entity_list:FindDoor(43):SetLockPick(0);
	elseif e.timer=="reset" then
		eq.debug("reset");
		eq.stop_timer("cursecallers");
		eq.stop_timer("banish");
		eq.stop_timer("reset");
		true_hp=2054874;
		mirr_hpratio=100;
		event_started=false;
		current_hp=max_hp;		
		local entity_list = eq.get_entity_list();
		entity_list:FindDoor(42):SetLockPick(0);
		entity_list:FindDoor(43):SetLockPick(0);
		eq.depop_all(296059);
		eq.depop_all(296060);
		eq.depop_all(296061);
		eq.depop_all(296062);
		eq.depop_all(296063);
		eq.depop_all(296064);
		Spawn_Noqu();		
	end
end

function TriggerSignal(e)
	if e.signal==1 then
		eq.debug("start cc ban timer");
		eq.set_timer("cursecallers",30*1000)
		eq.set_timer("banish",45*1000)			
	elseif e.signal==2 then
		eq.stop_timer("cursecallers")
		eq.stop_timer("banish")
		eq.debug("stop cc ban timer");
	elseif e.signal==4 then
		eq.debug("reset timer restarted");
		eq.set_timer("reset",60*1000);
	elseif e.signal==5 then
		eq.debug("door lock signal");
		if event_started == true then
			local entity_list = eq.get_entity_list();
			entity_list:FindDoor(42):SetLockPick(1);
			entity_list:FindDoor(43):SetLockPick(1);
			eq.set_timer("unlock_doors",40*1000);
		end
	end
end

function Spawn_Noqu(loc)
	eq.debug("spawn noqu");
	eq.depop_all(296065);
	eq.depop_all(296066);
	if (eq.ChooseRandom(1,2)==1) then		
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
	inst_id = eq.get_zone_instance_id()
	eq.register_npc_event("noqufiel", Event.spawn, 296075, TriggerSpawn)
	eq.register_npc_event("noqufiel", Event.signal, 296075, TriggerSignal)
	eq.register_npc_event("noqufiel", Event.timer, 296075, TriggerTimer)
	eq.register_npc_event("noqufiel", Event.signal, 296065, TrueSignal)	
	eq.register_npc_event("noqufiel", Event.combat, 296065, TrueCombat)
	eq.register_npc_event("noqufiel", Event.combat, 296066, MirrorCombat)
	eq.register_npc_event("noqufiel", Event.timer, 296065, TrueTimer)
	eq.register_npc_event("noqufiel", Event.timer, 296066, MirrorTimer)
	eq.register_npc_event("noqufiel", Event.spawn, 296065, TrueSpawn)
	eq.register_npc_event("noqufiel", Event.spawn, 296066, MirrorSpawn)
	eq.register_npc_event("noqufiel", Event.death_complete, 296065, TrueDeath)	
end

function event_encounter_unload(e)
  eq.stop_all_timers();
end