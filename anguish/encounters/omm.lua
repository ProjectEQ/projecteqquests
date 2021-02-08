--[[
Overlord_Mata_Muram (317109)
Coerced_Lieutenant  (317114)
Frenzied_Lasher (317117)
a_languished_convert (317122)  new NPC 317122 to prevent double scaling #drogerin

#Vyishe (317118)
#Anishy (317119)
#Piraand (317120)
#Garishi (317121)

60% 55-60 sec
20% 25-55 sec
20% 08-25 sec

162	646	<Gaze of Anguish>
170	680	<Relinquish Spirit>
120	479	<Touch of Anguish>
248	994	<Void of Suppression>
179	718	<Wail of Anguish>
--]]

local event_started =0;
local banished_raid=0;
local banished_hp=30;
local reenable_summon = false;
local reset_countdown=0;
local gaze_client=nil;
local buzz_client=nil;
local convert_min_hit=278;
local convert_max_hit=1855;

local box = require("aa_box");

local room_box = box();
room_box:add(522.11, 5163.37);
room_box:add(700.66, 4958.69);
room_box:add(501.94, 4725.47);
room_box:add(309.39, 4976.69);

function OMM_Spawn(e)
	if (banished_raid==0) then
		eq.debug("spawn, banished == 0");
		--e.self:SetHP(e.self:GetMaxHP());
		event_started=0;
		reset_countdown=0;
		banished_hp=30;
		e.self:SetAppearance(1); --sitting
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
	else		
		eq.debug("spawn, banished != 0");
		eq.set_timer("reset",60*60*1000);
		eq.set_timer("banish_phase2", 1000); -- banish anyone that wasn't up here correctly
		e.self:SetAppearance(1);
		e.self:SetOOCRegen(0);
		e.self:ModifyNPCStat("hp_regen", "0");
		e.self:SetHP(banished_hp);
		e.self:SetSpecialAbility(SpecialAbility.summon, 0); -- he doesn't summon off the bat
		-- just in case somehow someone gets up there (we're seeing issues with him summoning ...)
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
		reenable_summon = true;
	end
end

function OMM_Say(e)
  if event_started==0 then
	if(e.message:findi("hail")) then
		e.self:Say("So. You are the mighty god killers. I am not surprised you managed to make it this far. I did expect there to be more of you, do you really think so little of me? I have destroyed [" .. eq.say_link("worlds") .. "] where animals roam with power that would cause your gods to tremble.");
	elseif(e.message:findi("worlds")) then
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(317107)==false) then -- if amv is up, ignore hails
			e.self:Say("You would have made fine additions to my army, were you not so willful. Prepare yourself for power beyond your greatest nightmares.");
			event_started=1;
			reset_countdown=0;
			banished_raid=0;
			banished_hp=30;
			eq.set_next_hp_event(80);
			e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
			e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
			e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
			e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
			e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
			e.self:AddToHateList(e.other,1);
			local dz = eq.get_expedition()
			if dz.valid then
				dz:SetLocked(true)
				eq.debug("Locked expedition")
			end
		end
	end
  end
end

function OMM_HP(e)
	if (e.hp_event == 80) then
        eq.zone_emote(13, "Roaring laughter fills the room, 'Is this what you've come here to show me?  You hope to defeat an ancient warrior with this miserable display of force?");
        eq.set_next_hp_event(70);
		e.self:CameraEffect(1000,4);
	elseif (e.hp_event == 70) then
        eq.zone_emote(13, "Mata Muram shouts, 'I can taste your fear.  You know the hand of death approaches.'");
        eq.set_next_hp_event(50);
		e.self:CameraEffect(1000,4);
		local num_hit=0;
		while( num_hit <10 )
		do
			local client = eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),1000000);
			if client.valid then
				e.self:SendBeginCast(5684, 0);
				e.self:SpellFinished(5684, client:CastToMob());
				client:Message(15,"You feel the cold grip of death looming over you.");
				eq.debug("mark on: " .. client:GetName());
				num_hit=num_hit+1;
			end
		end
		eq.set_timer("check_mark",15*1000); --omm mark of death triggers after 15s
	elseif (e.hp_event == 50) then
		eq.zone_emote(13, "Mata Muram shouts, 'I will adorn the Gates of Anguish with the corpses of your dead.'");
		eq.set_next_hp_event(30);
		eq.spawn2(317122,0,0,331, 4961, 278, 128):AddToHateList(e.self:GetHateRandom(),1);
		eq.spawn2(317122,0,0,505, 4792, 278, 384):AddToHateList(e.self:GetHateRandom(),1);		
	elseif (e.hp_event == 30) then
		e.self:CameraEffect(2000,3);
		e.self:SetOOCRegen(0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:WipeHateList();
		e.self:SetAppearance(1);		
		--e.self:GotoBind();	
		--e.self:MoveTo(507, 4969, 296.53, 127.6,true);
		e.self:Stun(60*1000);
		eq.spawn2(317118,0,0,504, 4840, 280, 0); --#Vyishe (317118) south
		eq.spawn2(317119,0,0,619, 4968, 280, 384); --#Anishy (317119) west
		eq.spawn2(317120,0,0,393, 4968, 280, 128); --#Piraand (317120) east
		eq.spawn2(317121,0,0,504, 5081, 280, 256); --#Garishi (317121) north
		eq.signal(317118,1); -- NPC: #Vyishe
		eq.signal(317119,2); -- NPC: #Anishy
		eq.depop_all(317114); --Coerced_Lieutenant
		eq.depop_all(317117); --Frenzied_Lasher
		eq.stop_timer("torment");
		eq.stop_timer("pick6");
		eq.stop_timer("buzz");
		eq.stop_timer("buzz_spawn");
		eq.stop_timer("mmgaze");
		eq.set_timer("banish",60*1000);
		eq.set_timer("banish_hp_watch", 1000);
		eq.debug("banish start: " .. os.date("!%c"));
	end		
end

function OMM_Combat(e)
	if (e.joined == true) then
		e.self:SetAppearance(0);
		e.self:ModifyNPCStat("hp_regen", "10000");
		eq.stop_timer("reset");
		eq.set_timer("buzz",    math.random(25,55)  * 1000);
		eq.set_timer("mmgaze",  math.random(45,75)  * 1000);
		eq.set_timer("torment", math.random(10,20)  * 1000);
		eq.set_timer("pick6", 50 * 1000);		
		eq.spawn2(317114,0,0,378, 4969, 279, 128); -- NPC: Coerced_Lieutenant
		eq.spawn2(317114,0,0,618, 4969, 279, 384); -- NPC: Coerced_Lieutenant
		if (reenable_summon == true) then
			eq.set_timer("enable_summon", 10 * 1000); -- need to parse timer
		end
	else
		eq.set_timer("reset", 65 * 1000);
		eq.stop_timer("buzz");
		eq.stop_timer("torment");
		eq.stop_timer("pick6");
		eq.stop_timer("mmgaze");
	end
end

function OMM_Timer(e)
	if (e.timer == "torment") then		
		e.self:CastSpell(5676,e.self:GetHateRandom():GetID()); --Torment of Body
		eq.set_timer("torment",   math.random(60,66)* 1000);
	elseif (e.timer == "pick6") then
	--5680 Gaze of Anguish, 5679 Touch of Anguish, 5678 Wail of Anguish, 5677 Void of Suppression, 5676 Torment of Body, 5675 Relinquish Spirit
		e.self:CastSpell(eq.ChooseRandom(5680,5679,5678,5677,5676,5675),e.self:GetTarget():GetID());
	elseif (e.timer == "check_mark") then				
		local now_clients = eq.get_entity_list():GetClientList();
		for client in now_clients.entries do
			if (client.valid and client:FindBuff(5684)) then	
				e.self:SendBeginCast(982, 0);
				e.self:SpellFinished(982, client:CastToMob());	
				eq.debug("cazic touch: " .. client:GetName());
			end
		end
		eq.stop_timer("check_mark");		
	elseif (e.timer == "mmgaze") then
		eq.set_timer("mmgaze",70*1000);
		gaze_client=eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),1000000);
		if gaze_client.valid then
			eq.zone_emote(15, "Mata Muram fixes his gaze on one of your companions.");
			gaze_client:Message(6,"You feel a gaze of deadly power focusing on you.");
			eq.set_timer("mmgaze_cast",10*1000);
		else
			eq.debug("Invalud MMGaze Client: " .. os.date("!%c"));
		end
	elseif (e.timer == "mmgaze_cast") then
		eq.stop_timer("mmgaze_cast");		
		if (gaze_client.valid) then		
			e.self:Emote("fixes his gaze on " .. gaze_client:GetName());
			e.self:CastSpell(5685, gaze_client:GetID());--Mata Muram's Gaze
		else
			eq.debug("Invalud MMGaze Cast Client: " .. os.date("!%c"));
		end
	elseif (e.timer == "buzz") then
		eq.set_timer("buzz",55*1000);
		eq.set_timer("buzz_spawn",6*1000);
		buzz_client=eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),1000000);
		eq.zone_emote(15, "You hear a buzzing in the distance.");
		buzz_client:Message(6,"You hear a strange buzzing around your head, and feel as though something is creeping toward you.");
	elseif (e.timer == "buzz_spawn") then
		eq.stop_timer("buzz_spawn");
		if (buzz_client.valid) then
			local clientx=buzz_client:GetX()
			local clienty=buzz_client:GetY()
			local clientz=buzz_client:GetZ()
			local clienth=buzz_client:GetHeading()
			eq.spawn2(317117,0,0,clientx,clienty,clientz,clienth)
			eq.spawn2(317117,0,0,clientx,clienty,clientz,clienth)
			eq.spawn2(317117,0,0,clientx,clienty,clientz,clienth)
			eq.spawn2(317117,0,0,clientx,clienty,clientz,clienth)
			eq.spawn2(317117,0,0,clientx,clienty,clientz,clienth)			
		else
			eq.debug("Invalud Buzz Client: " .. os.date("!%c"));		
		end
	elseif (e.timer == "banish") then
		eq.debug("banish end: " .. os.date("!%c"));
		eq.stop_timer("banish");
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		eq.depop_all(317118);
		eq.depop_all(317119);
		eq.depop_all(317120);
		eq.depop_all(317121);
		eq.depop_all(317122);
		eq.zone_emote(13,"Mata Muram breaks free of his bonds, killing the Riftseekers with the magic. 'You dare betray me! When I am done with them I shall see that all of your kind meet the same fate.");
		eq.zone_emote(13,"The world shifts around you as the riftseeker's are consumed by their magic.");
		local now_clients = eq.get_entity_list():GetClientList();
		local instance_id = eq.get_zone_instance_id();
		for client in now_clients.entries do
			if (client.valid) then
				client:WipeHateList();
				client:MovePCInstance(317,instance_id, 641,3285,-10,0); -- Zone: anguish
				client:SetEntityVariable("clicked_up", "0"); -- set to 0, they're no longer up here correctly
			end
		end
		banished_raid=1;
		banished_hp=math.ceil(e.self:GetMaxHP()*e.self:GetHPRatio()/100);
		e.self:WipeHateList(); -- let's wipe ours too, it should be empty, maybe fix bards being instantly killed for some reason
		eq.spawn2(317109,0,0,e.self:GetSpawnPointX(),e.self:GetSpawnPointY(),e.self:GetSpawnPointZ(),e.self:GetSpawnPointH()); -- NPC: Overlord_Mata_Muram
		eq.depop();
	elseif (e.timer == "banish_hp_watch") then
		--if hp is less than 20% then banish after 3 sec
		if(e.self:GetHPRatio() < 20) then	
			eq.set_timer("banish",3000);
			eq.stop_timer("banish_hp_watch");
		end;
	elseif (e.timer == "reset") then
		eq.debug("resetting event: " .. os.date("!%c"));
		event_started=0;
		banished_raid=0;
		reenable_summon = false;
		eq.stop_timer("banish_phase2");
		eq.stop_timer("enable_summon");
		eq.depop_all(317122);
		eq.depop_all(317114);
		eq.depop_all(317117);
		eq.spawn2(317109,0,0,e.self:GetSpawnPointX(),e.self:GetSpawnPointY(),e.self:GetSpawnPointZ(),e.self:GetSpawnPointH()); -- NPC: Overlord_Mata_Muram
		eq.depop();
	elseif (e.timer == "enable_summon") then
		eq.debug("re-enabling summon: " .. os.date("!%c"));
		e.self:SetSpecialAbility(SpecialAbility.summon, 1);
		reenable_summon = false;
		eq.stop_timer("enable_summon");
	elseif (e.timer == "banish_phase2") then
		-- so we need to banish people who are up here incorrectly (warp, logged and relogged, etc)
		-- we set the entity variable when PCs click up which we check here to
		-- prevent any sort of race condition with the signal
		local now_clients = eq.get_entity_list():GetClientList();
		local instance_id = eq.get_zone_instance_id();
		for client in now_clients.entries do
			if (client.valid) then
				local var = client:GetEntityVariable("clicked_up");
				if ((var == nil or var == "0") and room_box:contains(client:GetX(), client:GetY())) then
					eq.debug(client:GetName() .. " shouldn't be up here yet: " .. os.date("!%c"));
					client:MovePCInstance(317,instance_id, 641,3285,-10,0); -- Zone: anguish
				end
			end
		end
	end
end

function OMM_Death(e)
	eq.zone_emote(13,"The walls of Anguish tremble, you can feel the world shaking your bones. For a brief moment you think you see a smile flash across Mata Muram's face, and as the last breath escapes his lungs you hear a faint voice, 'There are worlds other than these...");
	e.self:CameraEffect(1000,8);	
	eq.signal(317116 , 317109); -- NPC: zone_status
	eq.depop_all(317122);
	eq.depop_all(317114);
	eq.depop_all(317117);
end

function OMM_Signal(e)
	--30 sec reset timer on first click up after raid is banished 
	if (e.signal==1) then
		if (reset_countdown==0 and banished_raid==1) then
			eq.set_timer("reset",30*1000);
			eq.stop_timer("banish_phase2");
			e.self:ModifyNPCStat("hp_regen", "10000");
			reset_countdown=1;
			eq.debug("someone clicked up after banish, starting reset countdown: 30s " .. os.date("!%c") );
			-- we turned these on for phase 2 to prevent him magically aggroing for some reason
			e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
			e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
			e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
			e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
			e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
		end
	end
end

function Riftseeker_Signal(e)
	if (e.signal==1) then
		eq.zone_emote(13,"Rifts open in Mata Muram's Chamber.");
		e.self:Shout("Come! They have weakened him.  Now is our chance to strike.");
	elseif (e.signal==2) then
		eq.set_timer("shout",5000);
	end
end

function Riftseeker_Timer(e)
	if (e.timer=="shout") then
		eq.zone_emote(13,"Tendrils of energy shoot from the fingertips of the Riftseekers, turning Mata Muram's magic inward.");
		e.self:Shout("Now fools. Strike while we hold him, we cannot hold this seal for long.");
		eq.stop_timer("shout");		
	end
end

function Coerced_Death(e)
	eq.set_timer("respawn",2*1000);
end

function Coerced_Timer(e)
	if (e.timer=="respawn") then
		eq.spawn2(317114,0,0,e.self:GetSpawnPointX(),e.self:GetSpawnPointY(),e.self:GetSpawnPointZ(),e.self:GetSpawnPointH()); -- NPC: Coerced_Lieutenant
		eq.stop_timer("respawn");
	end
end

function Convert_Spawn(e)
	eq.set_timer("grow_stronger",10*1000);  
end

--damage is multiplied by 1.2 every 10 sec
function Convert_Timer(e)
	if (e.timer == "grow_stronger") then
		convert_min_hit=math.ceil(convert_min_hit*1.2);
		convert_max_hit=math.ceil(convert_max_hit*1.2); 
		e.self:ModifyNPCStat("min_hit", tostring(convert_min_hit));
		e.self:ModifyNPCStat("max_hit", tostring(convert_max_hit));
	end
end

function event_encounter_load(e)
	eq.register_npc_event('omm', Event.say,         	317109, OMM_Say);
	eq.register_npc_event('omm', Event.spawn,         	317109, OMM_Spawn); 
	eq.register_npc_event('omm', Event.combat,        	317109, OMM_Combat); 
	eq.register_npc_event('omm', Event.timer,         	317109, OMM_Timer);
	eq.register_npc_event('omm', Event.hp,         		317109, OMM_HP);
	eq.register_npc_event('omm', Event.death_complete,	317109, OMM_Death);
	eq.register_npc_event('omm', Event.signal,			317109, OMM_Signal);	    
	eq.register_npc_event('omm', Event.death_complete,	317114, Coerced_Death);
	eq.register_npc_event('omm', Event.timer,			317114, Coerced_Timer);	
	eq.register_npc_event('omm', Event.spawn, 			317122, Convert_Spawn);
	eq.register_npc_event('omm', Event.timer, 			317122, Convert_Timer); 	
	eq.register_npc_event('omm', Event.signal,			317118, Riftseeker_Signal);
	eq.register_npc_event('omm', Event.signal,			317119, Riftseeker_Signal);	
	eq.register_npc_event('omm', Event.timer,			317119, Riftseeker_Timer);	
end

function event_encounter_unload(e)
end
