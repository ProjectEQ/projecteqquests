--[[
Overlord_Mata_Muram (317109)
Coerced_Lieutenant  (317114/317123)
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

local event_started		= false;
local banished_raid		= false;
local banished_hp		= 30;
local reenable_summon	= false;
local reset_countdown	= false;
local gaze_client		= nil;
local buzz_client		= nil;
local convert_min_hit	= 278;
local convert_max_hit	= 1855;
local CL1				= nil;
local CL2				= nil;

local box = require("aa_box");

local room_box = box();
room_box:add(522.11, 5163.37);
room_box:add(700.66, 4958.69);
room_box:add(501.94, 4725.47);
room_box:add(309.39, 4976.69);

function OMM_Spawn(e)
	if banished_raid then
		eq.set_timer("reset", 60 * 60 * 1000);
		eq.set_timer("banish_phase2", 1000); -- banish anyone that wasn't up here correctly
		e.self:SetAppearance(1);
		e.self:SetOOCRegen(0);
		e.self:ModifyNPCStat("hp_regen", "0");
		e.self:SetHP(banished_hp);
		e.self:SetSpecialAbility(SpecialAbility.summon, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
		reenable_summon = true;
	else
		event_started	= false;
		reset_countdown	= false;
		banished_hp		= 30;
		e.self:SetAppearance(1); -- sitting
		e.self:SetOOCRegen(0);
		e.self:ModifyNPCStat("hp_regen", "0");
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
	end
end

function OMM_Say(e)
	if not event_started then
		if e.message:findi("hail") then
			e.self:Say("So. You are the mighty god killers. I am not surprised you managed to make it this far. I did expect there to be more of you, do you really think so little of me? I have destroyed [worlds] where animals roam with power that would cause your gods to tremble.");
		elseif e.message:findi("worlds") then
			if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(317107) then -- if amv is up, ignore hails
				e.self:Say("You would have made fine additions to my army, were you not so willful. Prepare yourself for power beyond your greatest nightmares.");
				event_started		= true;
				reset_countdown		= false;
				banished_raid		= false;
				banished_hp			= 30;
				eq.set_next_hp_event(80);
				e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
				e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
				e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
				e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
				e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
				e.self:AddToHateList(e.other,1);
				e.self:ModifyNPCStat("hp_regen", "10000");
				local dz = eq.get_expedition()
				if dz.valid then
					dz:SetLocked(true)
				end
			end
		end
	elseif event_started and banished_raid then
		e.self:Say("So. You are the mighty god killers. I am not surprised you managed to make it this far. I did expect there to be more of you, do you really think so little of me? I have destroyed [worlds] where animals roam with power that would cause your gods to tremble.");
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
		e.self:ModifyNPCStat("hp_regen", "10000");
	end
end

function OMM_HP(e)
	if e.hp_event == 80 then
        eq.zone_emote(MT.Yellow, "Roaring laughter fills the room, 'Is this what you've come here to show me?  You hope to defeat an ancient warrior with this miserable display of force?");
        eq.set_next_hp_event(70);
		e.self:CameraEffect(1000,4);
	elseif e.hp_event == 70 then
        eq.zone_emote(MT.Red, "Mata Muram shouts, 'I can taste your fear.  You know the hand of death approaches.'");
        eq.set_next_hp_event(50);
		e.self:CameraEffect(1000,4);
		local num_hit = 0;
		while num_hit < 10  do
			local client = eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),1000000);
			if client.valid then
				e.self:SendBeginCast(5684, 0);
				e.self:SpellFinished(5684, client:CastToMob());
				client:Message(MT.Yellow,"You feel the cold grip of death looming over you.");
				-- eq.debug("mark on: " .. client:GetName());
				num_hit = num_hit + 1;
			end
		end
		eq.set_timer("check_mark",15*1000); -- omm mark of death triggers after 15s
	elseif e.hp_event == 50 then
		eq.zone_emote(MT.Red, "Mata Muram shouts, 'I will adorn the Gates of Anguish with the corpses of your dead.'");
		eq.set_next_hp_event(30);
		eq.spawn2(317122,0,0,331, 4961, 278, 128):AddToHateList(e.self:GetHateRandom(),1);
		eq.spawn2(317122,0,0,505, 4792, 278, 384):AddToHateList(e.self:GetHateRandom(),1);		
	elseif e.hp_event == 30 then
		e.self:CameraEffect(2000,3);
		e.self:SetOOCRegen(0);
		e.self:ModifyNPCStat("hp_regen", "0");
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:WipeHateList();
		e.self:SetAppearance(1);		
		-- e.self:GotoBind();	
		-- e.self:MoveTo(507, 4969, 296.53, 127.6,true);
		e.self:Stun(60*1000);
		eq.spawn2(317118,0,0,504, 4840, 280, 0);	-- NPC: #Vyishe (317118) south
		eq.spawn2(317119,0,0,619, 4968, 280, 384);	-- NPC: #Anishy (317119) west
		eq.spawn2(317120,0,0,393, 4968, 280, 128);	-- NPC: #Piraand (317120) east
		eq.spawn2(317121,0,0,504, 5081, 280, 256);	-- NPC: #Garishi (317121) north
		eq.signal(317118,1); 						-- NPC: #Vyishe
		eq.signal(317119,2); 						-- NPC: #Anishy
		eq.depop_all(317114); 						-- NPC: Coerced_Lieutenant
		eq.depop_all(317123);						-- NPC: Coerced_Lieutenant
		eq.depop_all(317117);						-- NPC: Frenzied_Lasher
		eq.stop_timer("respawn_coerced");
		eq.stop_timer("torment");
		eq.stop_timer("pick6");
		eq.stop_timer("buzz");
		eq.stop_timer("buzz_spawn");
		eq.stop_timer("mmgaze");
		eq.set_timer("banish",60*1000);
		eq.set_timer("banish_hp_watch", 1000);
	end		
end

function OMM_Combat(e)
	if e.joined then
		e.self:SetAppearance(0);
		e.self:ModifyNPCStat("hp_regen", "10000");
		eq.stop_timer("reset");
		eq.set_timer("buzz",    math.random(25,55)  * 1000);
		eq.set_timer("mmgaze",  math.random(45,75)  * 1000);
		eq.set_timer("torment", math.random(10,20)  * 1000);
		eq.set_timer("pick6", 50 * 1000);
		eq.set_timer("charm_mem_wipe", 10 * 1000);

		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(317114) then
			CL1 = eq.spawn2(317114,0,0,378, 4969, 279, 128); -- NPC: Coerced_Lieutenant
		end

		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(317123) then
			CL2 = eq.spawn2(317123,0,0,618, 4969, 279, 384); -- NPC: Coerced_Lieutenant
		end

		if reenable_summon then
			eq.set_timer("enable_summon", 10 * 1000); -- need to parse timer
		end
	else
		eq.set_timer("reset", 65 * 1000);
		eq.stop_timer("buzz");
		eq.stop_timer("torment");
		eq.stop_timer("pick6");
		eq.stop_timer("mmgaze");
		eq.stop_timer("charm_mem_wipe");
	end
end

function OMM_Timer(e)
	if e.timer == "torment" then		
		e.self:CastSpell(5676,e.self:GetHateRandom():GetID()); --Torment of Body
		eq.set_timer("torment",   math.random(60,66)* 1000);
	elseif e.timer == "pick6" then
		--5680 Gaze of Anguish, 5679 Touch of Anguish, 5678 Wail of Anguish, 5677 Void of Suppression, 5676 Torment of Body, 5675 Relinquish Spirit
		e.self:CastSpell(eq.ChooseRandom(5680,5679,5678,5677,5676,5675),e.self:GetTarget():GetID());
	elseif e.timer == "check_mark" then				
		local now_clients = eq.get_entity_list():GetClientList();
		for client in now_clients.entries do
			if client.valid and client:Admin() < 80 and client:FindBuff(5684) then -- No GM
				e.self:SendBeginCast(982, 0);
				e.self:SpellFinished(982, client:CastToMob());	
				-- eq.debug("cazic touch: " .. client:GetName());
			end
		end
		eq.stop_timer("check_mark");
	elseif e.timer == "mmgaze" then
		eq.set_timer("mmgaze",70*1000);
		gaze_client = eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),1000000);
		if gaze_client.valid and gaze_client:Admin() < 80 then -- No GM
			eq.zone_emote(MT.Yellow, "Mata Muram fixes his gaze on one of your companions.");
			gaze_client:Message(MT.Yellow,"You feel a gaze of deadly power focusing on you.");
			eq.set_timer("mmgaze_cast",10*1000);
		else
			eq.debug("Invalid MMGaze Client: " .. os.date("!%c"));
		end
	elseif e.timer == "mmgaze_cast" then
		eq.stop_timer("mmgaze_cast");		
		if gaze_client.valid and gaze_client:Admin() < 80 then -- No GM
			eq.zone_emote(MT.Yellow,"Mata Muram fixes his gaze on " .. gaze_client:GetCleanName());
			if gaze_client:FindBuff(6494) then -- Clicked Mask and Found buff -- Spell: Reflective Skin
				eq.zone_emote(MT.Yellow, "Mata Muram grows weak as he is afflicted with his own magic.");
				make_attackable(e.self, false);
				e.self:WipeHateList();
				eq.set_timer("reengage", 18 * 1000);
			else -- Did not click mask and get buff
				e.self:CastSpell(5685, gaze_client:GetID()); -- Mata Muram's Gaze
			end
		else
			eq.debug("Invalid MMGaze Cast Client: " .. os.date("!%c"));
		end
	elseif e.timer == "reengage" then
		eq.zone_emote(MT.Yellow, "Mata Muram roars in anger,'You dare use my own magic against me!'");
		make_attackable(e.self, true);
		eq.set_timer("debuff_off", 10 * 1000);
	elseif e.timer == "debuff_off" then
		eq.zone_emote(MT.Yellow, "Mata Muram shakes off the effects of his affliction.");
	elseif e.timer == "buzz" then
		eq.set_timer("buzz",55*1000);
		eq.set_timer("buzz_spawn",6*1000);
		buzz_client = eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),1000000);
		eq.zone_emote(MT.Yellow, "You hear a buzzing in the distance.");
		buzz_client:Message(MT.Yellow,"You hear a strange buzzing around your head, and feel as though something is creeping toward you.");
	elseif e.timer == "buzz_spawn" then
		eq.stop_timer("buzz_spawn");
		if buzz_client.valid and buzz_client:Admin() < 80 then -- No GM
			local clientx=buzz_client:GetX()
			local clienty=buzz_client:GetY()
			local clientz=buzz_client:GetZ()
			local clienth=buzz_client:GetHeading()
			eq.spawn2(317117,0,0,clientx,clienty,clientz,clienth):AddToHateList(buzz_client,1);
			eq.spawn2(317117,0,0,clientx,clienty,clientz,clienth):AddToHateList(buzz_client,1);
			eq.spawn2(317117,0,0,clientx,clienty,clientz,clienth):AddToHateList(buzz_client,1);
			eq.spawn2(317117,0,0,clientx,clienty,clientz,clienth):AddToHateList(buzz_client,1);
			eq.spawn2(317117,0,0,clientx,clienty,clientz,clienth):AddToHateList(buzz_client,1);		
		else
			eq.debug("Invalud Buzz Client: " .. os.date("!%c"));		
		end
	elseif e.timer == "banish" then
		-- eq.debug("banish end: " .. os.date("!%c"));
		eq.stop_timer("banish");
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		eq.depop_all(317114);
		eq.depop_all(317117);
		eq.depop_all(317118);
		eq.depop_all(317119);
		eq.depop_all(317120);
		eq.depop_all(317121);
		eq.depop_all(317122);
		eq.depop_all(317123);
		eq.stop_timer("respawn_coerced");
		eq.stop_timer("buzz");
		eq.stop_timer("torment");
		eq.stop_timer("pick6");
		eq.stop_timer("mmgaze");
		eq.zone_emote(MT.Yellow,"Mata Muram breaks free of his bonds, killing the Riftseekers with the magic. 'You dare betray me! When I am done with them I shall see that all of your kind meet the same fate.");
		eq.zone_emote(MT.Yellow,"The world shifts around you as the riftseeker's are consumed by their magic.");
		local now_clients = eq.get_entity_list():GetClientList();
		local instance_id = eq.get_zone_instance_id();
		local npc_list = eq.get_entity_list():GetNPCList();
		if npc_list ~= nil then
			for npc in npc_list.entries do
				if npc:IsPet() then
					eq.depop(); -- Uhh buh bye
				end
			end
		end

		for client in now_clients.entries do
			if client.valid and client:Admin() < 80 then -- No GM
				client:WipeHateList();
				client:MovePCInstance(317,instance_id, 641,3285,-10,0); -- Zone: anguish
				client:SetEntityVariable("clicked_up", "0"); -- set to 0, they're no longer up here correctly
			end
		end
		banished_raid = true;
		banished_hp = math.ceil(e.self:GetMaxHP() * e.self:GetHPRatio() / 100);
		e.self:WipeHateList(); -- let's wipe ours too, it should be empty, maybe fix bards being instantly killed for some reason
		eq.spawn2(317109,0,0,e.self:GetSpawnPointX(),e.self:GetSpawnPointY(),e.self:GetSpawnPointZ(),e.self:GetSpawnPointH()); -- NPC: Overlord_Mata_Muram
		eq.depop();
	elseif e.timer == "banish_hp_watch" then
		--if hp is less than 20% then banish after 3 sec
		if e.self:GetHPRatio() < 20 then	
			eq.set_timer("banish",3000);
			eq.stop_timer("banish_hp_watch");
		end;
	elseif e.timer == "reset" then
		-- eq.debug("resetting event: " .. os.date("!%c"));
		event_started	= false;
		banished_raid	= false;
		reenable_summon	= false;
		local dz = eq.get_expedition();
		if dz.valid then
			dz:SetLocked(false);
		end
		eq.stop_timer("banish_phase2");
		eq.stop_timer("enable_summon");
		eq.depop_all(317122);
		eq.depop_all(317114);
		eq.depop_all(317123);
		eq.depop_all(317117);
		eq.spawn2(317109,0,0,e.self:GetSpawnPointX(),e.self:GetSpawnPointY(),e.self:GetSpawnPointZ(),e.self:GetSpawnPointH()); -- NPC: Overlord_Mata_Muram
		eq.depop();
	elseif e.timer == "enable_summon" then
		-- eq.debug("re-enabling summon: " .. os.date("!%c"));
		e.self:SetSpecialAbility(SpecialAbility.summon, 1);
		reenable_summon = false;
		eq.stop_timer("enable_summon");
	elseif e.timer == "banish_phase2" then
		-- so we need to banish people who are up here incorrectly (warp, logged and relogged, etc)
		-- we set the entity variable when PCs click up which we check here to
		-- prevent any sort of race condition with the signal
		local now_clients = eq.get_entity_list():GetClientList();
		local instance_id = eq.get_zone_instance_id();
		for client in now_clients.entries do
			if client.valid and client:Admin() < 80 then -- No GM
				local var = client:GetEntityVariable("clicked_up");
				if (var == nil or var == "0") and room_box:contains(client:GetX(), client:GetY()) then
					-- eq.debug(client:GetName() .. " shouldn't be up here yet: " .. os.date("!%c"));
					client:MovePCInstance(317,instance_id, 641,3285,-10,0); -- Zone: anguish
				end
			end
		end
	elseif e.timer == "respawn_coerced" then
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(317114) then
			CL1 = eq.spawn2(317114,0,0,378, 4969, 279, 128); -- NPC: Coerced_Lieutenant
		end

		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(317123) then
			CL2 = eq.spawn2(317123,0,0,618, 4969, 279, 384); -- NPC: Coerced_Lieutenant
		end

		eq.stop_timer("respawn_coerced");
	elseif e.timer == "charm_mem_wipe" then
		if CL1.valid and CL1:Charmed() then
			CL1:WipeHateList();
		end

		if CL2.valid and CL2:Charmed() then
			CL2:WipeHateList();
		end
	end
end

function OMM_Death(e)
	eq.signal(317116 , 317109); -- NPC: zone_status
	eq.zone_emote(MT.Yellow,"The walls of Anguish tremble, you can feel the world shaking your bones. For a brief moment you think you see a smile flash across Mata Muram's face, and as the last breath escapes his lungs you hear a faint voice, 'There are worlds other than these...");
	eq.world_emote(MT.Yellow, "The world trembles around you. All of Discord seems to howl in pain, in the distance you hear dragorn shouting for their freedom from Mata Muram's terror.");

	eq.signal(317116,999999); -- NPC: zone_status

	local target = e.other;

	if e.other:IsPet() then		--Pet check routine
		target = e.other:GetOwner();		--If pet is at top of hate list then target will change to owner
	end

	if eq.get_data("Omens_OMM_First") == "" then
		eq.world_emote(MT.Magenta,"Congratulations to [".. eq.get_guild_name_by_id(eq.get_guild_id_by_char_id(target:CastToClient():CharacterID())) .."] for being the first guild to kill Overlord Mata Muram and completing the Omens of War Expansion.");
		eq.set_data("Omens_OMM_First", "1");
	else
		e.self:DeathNotification(e);

		local data_bucket = ("OOW_OMM_Kill_Timer");
		local dz = target:CastToClient():GetExpedition();
		local dz_time = eq.seconds("6h");
		local remaining_time = 0;
		local guild_id = eq.get_guild_id_by_char_id(target:CastToClient():CharacterID());
		local record_kill_exists = false;
		local record_kill = false;
		local record_kill_guild_id = 0;
		local record_kill_seconds = 9999999;

		if dz.valid then
			remaining_time = dz:GetSecondsRemaining();
		end

		local total_time_seconds = dz_time - remaining_time;

		if eq.get_data(data_bucket) ~= "" then -- Kill Timer Recorded
			local temp = eq.get_data(data_bucket);
			s = eq.split(temp, ',');

			record_kill_guild_id	= tonumber(s[1]); -- Current Fastest Guild ID
			record_kill_seconds 	= tonumber(s[2]); -- Current Fastest Time

			record_kill_exists = true;

			if record_kill_seconds > total_time_seconds then -- This run was a record!
				eq.set_data(data_bucket, guild_id..","..total_time_seconds);
				record_kill = true;
			end
		else  -- No Kill Timer Recorded
			eq.set_data(data_bucket, guild_id..","..total_time_seconds);
		end
		
		eq.world_emote(MT.Magenta,"Congratulations to [".. eq.get_guild_name_by_id(guild_id) .."] for killing Overlord Mata Muram and saving all denizens of Kuua from the invaders from discord. Total Time from Zone Start: ".. eq.SecondsToClockHours(total_time_seconds));

		if record_kill_exists then
			eq.world_emote(MT.Lime, "Citadel of Anguish: Current Zone Speed Record: Guild = ".. eq.get_guild_name_by_id(record_kill_guild_id) .." -  Time To Complete = ".. eq.SecondsToClockHours(record_kill_seconds));
		end

		if record_kill then
			eq.world_emote(MT.LightBlue, "This run was a new record! Congratulations!");
		end
	end
	-- e.self:CameraEffect(1000,8, e.self, true);
end

function OMM_Signal(e)
	--30 sec reset timer on first click up after raid is banished 
	if e.signal == 1 then
		if not reset_countdown and banished_raid then
			eq.set_timer("reset",60 * 1000);
			eq.stop_timer("banish_phase2");
			reset_countdown = true;
		end
	elseif e.signal == 2 then
		eq.set_timer("respawn_coerced",2 * 1000);
	end
end

function Riftseeker_Signal(e)
	if e.signal == 1 then
		eq.zone_emote(MT.Yellow,"Rifts open in Mata Muram's Chamber.");
		e.self:Shout("Come! They have weakened him.  Now is our chance to strike.");
	elseif e.signal == 2 then
		eq.set_timer("shout",5000);
	end
end

function Riftseeker_Timer(e)
	if e.timer == "shout" then
		eq.zone_emote(MT.Yellow,"Tendrils of energy shoot from the fingertips of the Riftseekers, turning Mata Muram's magic inward.");
		e.self:Shout("Now fools. Strike while we hold him, we cannot hold this seal for long.");
		eq.stop_timer("shout");
	end
end

function Coerced_Death(e)
	eq.signal(317109,2);
end

function Convert_Spawn(e)
	eq.set_timer("grow_stronger",10*1000);
end

--damage is multiplied by 1.2 every 10 sec
function Convert_Timer(e)
	if e.timer == "grow_stronger" then
		convert_min_hit = math.ceil(convert_min_hit * 1.2);
		convert_max_hit = math.ceil(convert_max_hit * 1.2); 
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
	eq.register_npc_event('omm', Event.death_complete,	317123, Coerced_Death);
	eq.register_npc_event('omm', Event.spawn, 			317122, Convert_Spawn);
	eq.register_npc_event('omm', Event.timer, 			317122, Convert_Timer);
	eq.register_npc_event('omm', Event.signal,			317118, Riftseeker_Signal);
	eq.register_npc_event('omm', Event.signal,			317119, Riftseeker_Signal);
	eq.register_npc_event('omm', Event.timer,			317119, Riftseeker_Timer);
end

function event_encounter_unload(e)
end

function make_attackable(mob, attackable)
	mob:SetSpecialAbility(SpecialAbility.immune_aggro, attackable and 0 or 1)
	mob:SetSpecialAbility(SpecialAbility.immune_aggro_on, attackable and 0 or 1)
	mob:SetSpecialAbility(SpecialAbility.disable_melee, attackable and 0 or 1)
end
