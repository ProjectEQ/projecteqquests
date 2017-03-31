--[[
Overlord_Mata_Muram (317109)
Coerced_Lieutenant  (317114)
Frenzied_Lasher (317117)
a_languished_convert (317110)

#Vyishe (317118)
#Anishy (317119)
#Piraand (317120)
#Garishi (317121)

at 30% walk back to spawn
set model to wings over head
before banish set regen to 0

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
local reset_countdown=0;
local gaze_client=nil;
local buzz_client=nil;
local convert_min_hit=278;
local convert_max_hit=1855;

function OMM_Spawn(e)
	if (banished_raid==0) then
		event_started =0;
		banished_hp=30;
		e.self:SetAppearance(1); --sitting
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
	else 
		e.self:SetAppearance(1);
		eq.set_timer("reset",15*60*1000);	
		eq.set_timer("keep_banished_hp",1000);
		e.self:SetHP(banished_hp);
	end
end

function OMM_Say(e)
  if event_started==0 then
	if(e.message:findi("hail")) then
		e.self:Say("So. You are the mighty god killers. I am not surprised you managed to make it this far. I did expect there to be more of you, do you really think so little of me? I have destroyed [" .. eq.say_link("worlds") .. "] where animals roam with power that would cause your gods to tremble.");
	elseif(e.message:findi("worlds")) then	
		e.self:Say("You would have made fine additions to my army, were you not so willful. Prepare yourself for power beyond your greatest nightmares.");
		event_started=1;
		reset_countdown=0;
		banished_raid=0;
		banished_hp=30;
		eq.spawn2(317114,0,0,378, 4969, 279, 64);
		eq.spawn2(317114,0,0,618, 4969, 279, 192);		
		eq.set_next_hp_event(80);
		e.self:AddToHateList(e.other,1);
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);	
		e.self:AddToHateList(e.other,1);
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
				client:Message(15,"You feel the cold grip of death looming over you.");
				e.self:CastSpell(5684, client:GetID(),0,1,0);
				num_hit=num_hit+1;
			end
		end
	elseif (e.hp_event == 50) then
		eq.zone_emote(13, "Mata Muram shouts, 'I will adorn the Gates of Anguish with the corpses of your dead.'");
		eq.set_next_hp_event(30);
		eq.spawn2(317110,0,0,331, 4961, 278, 64):AddToHateList(e.self:GetHateRandom(),1);
		eq.spawn2(317110,0,0,505, 4792, 278, 192):AddToHateList(e.self:GetHateRandom(),1);		
	elseif (e.hp_event == 30) then
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:WipeHateList();
		eq.spawn2(317118,0,0,504, 4840, 280, 0); --#Vyishe (317118) south
		eq.spawn2(317119,0,0,381, 4843, 280, 192); --#Anishy (317119) west
		eq.spawn2(317120,0,0,393, 4968, 280, 64); --#Piraand (317120) east
		eq.spawn2(317121,0,0,381, 4843, 280, 128); --#Garishi (317121) north
		eq.depop_all(317114);
		eq.stop_timer("torment");
		eq.stop_timer("touch");
		eq.stop_timer("buzz");
		eq.stop_timer("buzz_spawn");
		eq.stop_timer("wail");
		eq.stop_timer("mmgaze");
		eq.stop_timer("gaze");
		eq.stop_timer("relinq");
		eq.stop_timer("void");		
		e.self:CameraEffect(1000,2);
		eq.signal(317118,1);
		eq.signal(317119,2);		
		eq.set_timer("move_to_spawn",30*100);
		eq.set_timer("banish",60*100);
		eq.set_timer("limit_20pct",1000);
	end		
end

function OMM_Combat(e)
	if (e.joined == true) then
		e.self:SetAppearance(0);
		e.self:ModifyNPCStat("hp_regen", "10000");
		eq.stop_timer("reset");
		eq.stop_timer("keep_banished_hp");
		--these become static after first roll
		eq.set_timer("buzz",    math.random(25,55)  * 1000);
		eq.set_timer("mmgaze",  math.random(45,75)  * 1000);
		--these are always random ranges
		eq.set_timer("torment", math.random(5,25)   * 1000);
		eq.set_timer("touch",   math.random(120,479)* 1000);
		eq.set_timer("wail",    math.random(179,718)* 1000);		
		eq.set_timer("gaze",	math.random(162,646)* 1000);
		eq.set_timer("relinq",	math.random(170,680)* 1000);
	else
		eq.set_timer("reset", 15 * 60 * 1000);
		eq.stop_timer("torment");
		eq.stop_timer("touch");
		eq.stop_timer("buzz");
		eq.stop_timer("wail");
		eq.stop_timer("mmgaze");
		eq.stop_timer("gaze");
		eq.stop_timer("relinq");
		eq.stop_timer("void");
	end
end

function OMM_Timer(e)
	if (e.timer == "torment") then		
		e.self:CastSpell(5676,e.self:GetHateRandom():GetID()); --Torment of Body
		local diceroll=math.random(1,10);
		if (diceroll <=2) then
			eq.set_timer("torment",math.random(8,25)*1000);
		elseif (diceroll <=4) then
			eq.set_timer("torment",math.random(25,55)*1000);
		else
			eq.set_timer("torment",math.random(55,66)*1000);
		end
	elseif (e.timer == "touch") then
		e.self:CastSpell(5679,e.self:GetHateRandom():GetID()); --Touch of Anguish
	elseif (e.timer == "wail") then
		e.self:CastSpell(5678,e.self:GetHateRandom():GetID()); --Wail of Anguish		
	elseif (e.timer == "gaze") then
		e.self:CastSpell(5680, e.self:GetTarget():GetID()); --Gaze of Anguish
	elseif (e.timer == "void") then
		e.self:CastSpell(5677, e.self:GetTarget():GetID()); --Void of Suppression
	elseif (e.timer == "relinq") then
		e.self:CastSpell(5675, e.self:GetTarget():GetID()); --Relinquish Spirit
	elseif (e.timer == "mmgaze") then
		eq.set_timer("mmgaze",70*1000);
		--eq.set_timer("mmgaze",10*1000);	--TESTING
		gaze_client=eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),1000000);
		if gaze_client.valid then
			eq.zone_emote(15, "Mata Muram fixes his gaze on one of your companions.");
			gaze_client:Message(6,"You feel a gaze of deadly power focusing on you.");
			eq.set_timer("mmgaze_cast",10*1000);
			--eq.set_timer("mmgaze_cast",5*1000); --TESTING
		else
			eq.zone_emote(15, "INVALID CLIENT GAZE");
			e.self:Say("clientfail is: " .. gaze_client:GetName());
		end
	elseif (e.timer == "mmgaze_cast") then
		eq.stop_timer("mmgaze_cast");		
		if (gaze_client.valid) then		
			e.self:Emote("fixes his gaze on " .. gaze_client:GetName());						
			if (gaze_client:FindBuff(6494)) then
				eq.zone_emote(15, "Overlord Mata Muram's spell has been reflected by " .. gaze_client:GetName() .. ".");			
			--else
			--	eq.zone_emote(15, "client didnt have buff");
			end
			e.self:CastSpell(5685, gaze_client:GetID());--Mata Muram's Gaze
		--else
		--what happens if someone dies while they are target? assume nothing
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
			eq.spawn2(317117,0,0,clientx  ,clienty-5,clientz,clienth)
			eq.spawn2(317117,0,0,clientx-1,clienty-5,clientz,clienth)
			eq.spawn2(317117,0,0,clientx+1,clienty-5,clientz,clienth)
			eq.spawn2(317117,0,0,clientx-2,clienty-5,clientz,clienth)
			eq.spawn2(317117,0,0,clientx+2,clienty-5,clientz,clienth)			
		--else
		--what happens if someone dies while they are target? assume nothing			
		end
	elseif (e.timer == "move_to_spawn") then
		e.self:MoveTo(507, 4969, 296.53, 127.6,true);
		eq.stop_timer("move_to_spawn");
	elseif (e.timer == "limit_20pct") then
		if (e.self:GetHPRatio() < 20) then
			local new_hp = e.self:GetMaxHP() * 20/100;
			e.self:SetHP(new_hp);		
		end	
	elseif (e.timer == "banish") then
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		eq.depop_all(317118);
		eq.depop_all(317119);
		eq.depop_all(317120);
		eq.depop_all(317121);
		eq.depop_all(317117);
		eq.depop_all(317110);
		eq.zone_emote(13,"Mata Muram breaks free of his bonds, killing the Riftseekers with the magic. 'You dare betray me! When I am done with them I shall see that all of your kind meet the same fate.");
		eq.zone_emote(13,"The world shifts around you as the riftseeker's are consumed by their magic.");
		eq.stop_timer("banish");
		eq.stop_timer("limit_20pct");				
		e.self:ModifyNPCStat("hp_regen", "0");
		local now_clients = eq.get_entity_list():GetClientList();
		local instance_id = eq.get_zone_instance_id();
		--eq.get_entity_list():GetClientList():RemoveFromTargets(e, true);
		for client in now_clients.entries do
			if (client.valid and e.self:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) <=1000) then
				--client:GetPet():WipeHateList();
				client:WipeHateList();				
				client:MovePCInstance(317,instance_id, 641,3285,-10,0);
				--client:Message(1,"moving you");
				--e.self:CastSpell(47282, client:GetID(),0,1,0); --47282 Banishment of Mata Muram
			end
		end
		banished_raid=1;
		banished_hp=math.ceil(e.self:GetMaxHP()*e.self:GetHPRatio()/100);
		if banished_hp < 20 then
			banished_hp=20
		end
		eq.spawn2(317109,0,0,e.self:GetSpawnPointX(),e.self:GetSpawnPointY(),e.self:GetSpawnPointZ(),e.self:GetSpawnPointH());
		eq.depop();
	elseif (e.timer =="keep_banished_hp") then
		e.self:SetHP(banished_hp);
	elseif (e.timer == "reset") then
		eq.depop_all(317110);
		eq.depop_all(317114);
		eq.depop_all(317117);
		eq.spawn2(317109,0,0,e.self:GetSpawnPointX(),e.self:GetSpawnPointY(),e.self:GetSpawnPointZ(),e.self:GetSpawnPointH());
		eq.depop();
		event_started=0;
    end
end

function OMM_Death(e)
	eq.zone_emote(13,"The walls of Anguish tremble, you can feel the world shaking your bones. For a brief moment you think you see a smile flash across Mata Muram's face, and as the last breath escapes his lungs you hear a faint voice, 'There are worlds other than these...");
	e.self:CameraEffect(1000,8);	
	eq.signal(317116 , 317109);
end

function OMM_Signal(e)
	--30 sec reset timer on first click up after raid is banished 
	if (e.signal==1 and reset_countdown==0 and banished_raid==0) then
		eq.set_timer("reset_event",30*1000);
		reset_countdown=1;
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
	eq.set_timer("respawn",10*1000);
end

function Coerced_Timer(e)
	if (e.timer=="respawn") then
		eq.spawn2(317114,0,0,e.self:GetSpawnPointX(),e.self:GetSpawnPointY(),e.self:GetSpawnPointZ(),e.self:GetSpawnPointH());
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
	eq.register_npc_event('amv', Event.hp,         		317109, OMM_HP);
	eq.register_npc_event('omm', Event.death_complete,	317109, OMM_Death);
	eq.register_npc_event('omm', Event.signal,			317109, OMM_Signal);	    
	eq.register_npc_event('omm', Event.death_complete,	317114, Coerced_Death);
	eq.register_npc_event('omm', Event.timer,			317114, Coerced_Timer);	
	eq.register_npc_event('omm', Event.spawn, 			317110, Convert_Spawn);
	eq.register_npc_event('omm', Event.timer, 			317110, Convert_Timer); 	
	eq.register_npc_event('omm', Event.signal,			317118, Riftseeker_Signal);
	eq.register_npc_event('omm', Event.signal,			317119, Riftseeker_Signal);	
	eq.register_npc_event('omm', Event.timer,			317119, Riftseeker_Timer);	
end

function event_encounter_unload(e)
end

--elseif (e.timer == "mask_15sec") then
--	eq.stop_timer("mask_15sec");
--	e.self:WipeHateList();
--	e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
--	e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
--	eq.zone_emote(15, "Mata Muram roars in anger, 'You dare use my own magic against me!'");	
--	--so... what is he debuffed with from 15 to 30 sec?
--elseif (e.timer == "mask_30sec") then
--	eq.stop_timer("mask_30sec");
--	eq.zone_emote(15, "Mata Muram shakes off the effects of his affliction.");
--	--shakes off what??	maybe doesnt cast ae til now?


--eq.zone_emote(15, "Mata Muram grows weak as he is afflicted with his own magic.");  old way

--e.self:CastSpell(5685, e.self:GetID());	--Mata Muram's Gaze
--e.self:CastSpell(6296, gaze_client:GetID()); --Mata Muram's Gaze Recourse