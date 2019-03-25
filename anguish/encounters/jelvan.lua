--[[
Jelvan (317004)
Jelvan`s_Keepsake (317111)

Tanthi_the_Tormentor (317099) (west)  Wail of Anguish  5678
Tantho_the_Tormentor (317100) (east)  Touch of Anguish 5679
Tanthu_the_Tormentor (317101) (south) Gaze of Anguish  5680

If they become unbalanced the unbalanced ones also use: 
Void of Suppression 
Relinquish Spirit 
Torment of Body

Blessing of Jelvan 5674, cast on the target tanking each Tormentor
[Tue Nov 29 20:44:16 2016] [20:44:16] Jelvan begins to cast a spell. <Blessing of Jelvan>
[Tue Nov 29 20:44:16 2016] [20:44:16] Clasper is encased in a protective light.
[Tue Nov 29 20:44:16 2016] [20:44:16] Jelvan begins to cast a spell. <Blessing of Jelvan>
[Tue Nov 29 20:44:16 2016] [20:44:16] Clasper is encased in a protective light.
[Tue Nov 29 20:44:16 2016] [20:44:16] Jelvan begins to cast a spell. <Blessing of Jelvan>
[Tue Nov 29 20:44:16 2016] [20:44:16] Clasper is encased in a protective light.
Jelvan shouts 'Here you go! This should help!

balance checked once per minute?
lowest hp tormentor calls for help

[Tue Nov 29 21:06:16 2016] [21:06:16] Jelvan shouts 'Here you go! This should help!'
[Tue Nov 29 21:07:16 2016] [21:07:16] Jelvan shouts 'Here you go! This should help!'
[Tue Nov 29 21:08:16 2016] [21:08:16] Jelvan shouts 'Here you go! This should help!'
[Tue Nov 29 21:08:51 2016] [21:08:51] Jelvan shouts 'My power is theirs...I'm sorry, I cannot... fight... them...'
[Tue Nov 29 21:09:41 2016] [21:09:41] Tanthu the Tormentor begins to cast a spell. <Void of Suppression>
[Tue Nov 29 21:09:45 2016] Tanthu dies
[Tue Nov 29 21:10:11 2016] [21:10:11] Jelvan shouts 'Here you go! This should help!'

[Tue Nov 29 21:10:51 2016] [21:10:51] Tantho the Tormentor begins to cast a spell. <Torment of Body>
[Tue Nov 29 21:10:52 2016] Tantho dies
[Tue Nov 29 21:11:28 2016] Tanthi dies

after 2nd tormentor dies, the shouts/hp check stop

[Fri Sep 25 08:24:06 2015] You hear Jelvan's shouts of gratitude as he runs into the shadows.
[Tue Nov 29 21:10:21 2016] [21:10:21] Jelvan shouts 'My power is theirs...I'm sorry, I cannot... fight... them...'
[Tue Nov 29 21:10:26 2016] [21:10:26] Tantho the Tormentor begins to cast a spell. <Relinquish Spirit>

--jelvan circle radius is ~140, checking that and Z axis (-151 is pit floor) for leash purposes, -121 is jelvan Z axis
--]]
local event_started =0;
local tanthi_ae=0;
local tantho_ae=0;
local tanthu_ae=0;
local tanthi_aggro=0;
local tantho_aggro=0
local tanthu_aggro=0;
local depopping=0;

function Jelvan_spawn()
	event_started =0;
end

function Jelvan_Say(e)
  if event_started==0 then
	if(e.message:findi("hail")) then
		e.self:Emote("grabs his head in pain. 'The voices. Make them stop. My thoughts are my own! You will not break me! Shhh. Can you [" .. eq.say_link("hear") .. "] them?");
	elseif(e.message:findi("hear")) then
		e.self:Say("The tormentors. They are trying to break me. They want me to be one of them. They want my power. You must [" .. eq.say_link("help") .. "] me. You must destroy them.");
	elseif(e.message:findi("help")) then
		e.self:Say("They must be killed! They... Can you here them? They are coming close. I will help you while I can, but I can already feel their taint seeping into my bones");
		event_started=1;
		depopping=1;
		tanthi_ae=0;
		tantho_ae=0;
		tanthu_ae=0;
		tanthi_aggro=0;
		tantho_aggro=0;
		tanthu_aggro=0;
		eq.unique_spawn(317099,0,0, -174, 2152, -149, 334); -- NPC: Tanthi_the_Tormentor
		eq.unique_spawn(317100,0,0, -341, 2152, -149, 154); -- NPC: Tantho_the_Tormentor
		eq.unique_spawn(317101,0,0, -252, 2008, -149, 0); -- NPC: Tanthu_the_Tormentor
		eq.set_timer("check_event",1*1000);
		eq.set_timer("balance",60*1000);
		eq.set_timer("check_leash",3000);
		eq.set_timer("depop_event",15*1000);  --depop 15 sec if no aggro
	end
  end
end

function Jelvan_Timer(e)
	if (e.timer=="check_event") then
		local torment_alive=0;
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(317099)==true) then
			torment_alive=torment_alive+1;
		else
			tanthi_aggro=0;
		end
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(317100)==true) then
			torment_alive=torment_alive+1;
		else
			tantho_aggro=0;			
		end
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(317101)==true) then
			torment_alive=torment_alive+1;
		else
			tanthu_aggro=0;			
		end		
		if(torment_alive==0) then
		--set player lockout
		--chance to spawn 2.0 orb, if so set zone lockout for "bottom orb"			
			eq.signal(317116 , 317004); -- NPC: zone_status
			eq.unique_spawn(317111,0,0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); --Jelvan`s_Keepsake (317111)
			eq.zone_emote(15,"You hear Jelvan's shouts of gratitude as he runs into the shadows.");	
			event_started=0;
			eq.depop();
		elseif (torment_alive==1) then
			eq.stop_timer("balance");
		elseif (tanthi_aggro==0 and tanthi_aggro==0 and tanthu_aggro==0 and depopping==0) then
			eq.set_timer("depop_event",15*1000);
			depopping=1;
		elseif (tanthi_aggro==1 or tantho_aggro==1 or tanthu_aggro==1) then
			eq.stop_timer("depop_event");
			depopping=0;
		end
	elseif (e.timer=="depop_event") then
		if (tanthi_aggro==0 and tanthi_aggro==0 and tanthu_aggro==0 and depopping==1) then
			eq.stop_timer("depop_event");
			eq.stop_timer("check_event");
			eq.stop_timer("balance");
			eq.depop_all(317099);
			eq.depop_all(317100);
			eq.depop_all(317101);
			event_started=0;		
		end
	elseif (e.timer=="check_leash") then
			Leash_Tormentors(e);
	elseif (e.timer == "balance" and (tanthi_aggro==1 or tantho_aggro==1 or tanthu_aggro==1)) then
		local tanthi_hp=100;
		local tantho_hp=100;
		local tanthu_hp=100;
		local tanth_io = 1;
		local tanth_iu = 1;
		local tanth_ou = 1;
		local tanthi_alive=0;
		local tantho_alive=0;
		local tanthu_alive=0;
		local lowest_hp=100;
		local lowest_npc=0;
		--if alive get hp and see who is lowest
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(317099)) then
			--e.self:Say("tanthicheck" .. eq.get_entity_list():GetNPCByNPCTypeID(317099):GetHPRatio());
			tanthi_alive=1;
			tanthi_hp=eq.get_entity_list():GetNPCByNPCTypeID(317099):GetHPRatio();
			lowest_hp=tanthi_hp;
			lowest_npc=317099;			
		end
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(317100)) then
			tantho_alive=1;
			tantho_hp=eq.get_entity_list():GetNPCByNPCTypeID(317100):GetHPRatio();
			if (tantho_hp < lowest_hp) then
				lowest_hp=tantho_hp;
				lowest_npc=317100;
			end			
		end
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(317101)) then
			tanthu_alive=1;
			tanthu_hp=eq.get_entity_list():GetNPCByNPCTypeID(317101):GetHPRatio();
			if (tanthu_hp < lowest_hp) then
				lowest_hp=tanthu_hp;
				lowest_npc=317101;
			end					
		end				
		--check alive mobs to see if any are out of balance
		if (tanthi_alive==1 and tantho_alive==1) then
			if(math.abs(tanthi_hp-tantho_hp) > 5) then
				tanth_io = 0;
			end
		end
		if (tanthi_alive==1 and tanthu_alive==1) then
			if(math.abs(tanthi_hp-tanthu_hp) > 5) then
				tanth_iu = 0;
			end
		end
		if (tantho_alive==1 and tanthu_alive==1) then
			if(math.abs(tantho_hp-tanthu_hp) > 5) then
				tanth_ou = 0;
			end
		end		
		--if out of balance send lowest_npc signal to call for helps
		if (tanth_io==0 or tanth_iu==0 or tanth_ou==0) then
			local npc = eq.get_entity_list():GetNPCByNPCTypeID(lowest_npc);
			if npc.valid then
				npc:Emote("calls for Jelvan's assistance as the balance tips.");
				if(lowest_npc==317099) then 
					tanthi_ae=1;
				elseif(lowest_npc==317100) then
					tantho_ae=1;
				elseif(lowest_npc==317101) then
					tanthu_ae=1;
				end
			end
			e.self:Shout("My power is theirs...I'm sorry, I cannot... fight... them...");
		--in balance
		else
			tanthi_ae=0;
			tantho_ae=0;
			tanthu_ae=0;
			e.self:CastSpell(5674,eq.get_entity_list():GetNPCByNPCTypeID(317099):GetTarget():GetID(),0,1); -- Spell: Blessing of Jelvan
			e.self:CastSpell(5674,eq.get_entity_list():GetNPCByNPCTypeID(317100):GetTarget():GetID(),0,1); -- Spell: Blessing of Jelvan
			e.self:CastSpell(5674,eq.get_entity_list():GetNPCByNPCTypeID(317101):GetTarget():GetID(),0,1); -- Spell: Blessing of Jelvan	
			e.self:Shout("Here you go! This should help!");
		end
	end
end

function Tormentor_Combat(e)
  local myid=e.self:GetNPCTypeID(); 
  if (e.joined == true) then
	eq.set_timer("cast", 	math.random(10,45) * 1000);
	eq.set_timer("void", 	math.random(1,20) * 1000);
	eq.set_timer("relinq",  math.random(20,40) * 1000);
	eq.set_timer("torment", math.random(40,60) * 1000);
	if (myid==317099) then
		tanthi_aggro=1;
	elseif (myid==317100) then
		tantho_aggro=1;
	elseif (myid==317101) then
		tanthu_aggro=1;
	end
	Aggro_Tormentor(e);
  else
	eq.stop_timer("cast");
	eq.stop_timer("void");
	eq.stop_timer("relinq");
	eq.stop_timer("torment");
	if (myid==317099) then
		tanthi_aggro=0;
	elseif (myid==317100) then
		tantho_aggro=0;
	elseif (myid==317101) then
		tanthu_aggro=0;
	end
  end
end

function Aggro_Tormentor(e)
	eq.get_entity_list():GetNPCByNPCTypeID(317099):AddToHateList(e.self:GetHateTop(),1)
	eq.get_entity_list():GetNPCByNPCTypeID(317100):AddToHateList(e.self:GetHateTop(),1)
	eq.get_entity_list():GetNPCByNPCTypeID(317101):AddToHateList(e.self:GetHateTop(),1)	
end

function Tormentor_Timer(e)
	local myid=e.self:GetNPCTypeID(); 
	if (myid==317099 and e.timer == "cast") then		
		e.self:CastSpell(5678, e.self:GetTarget():GetID()); -- Spell: Wail of Anguish
		eq.set_timer("cast",45*1000);
	elseif (myid==317100 and e.timer == "cast") then
		e.self:CastSpell(5679, e.self:GetTarget():GetID()); -- Spell: Touch of Anguish
		eq.set_timer("cast",45*1000);
	elseif (myid==317101 and e.timer == "cast") then
		e.self:CastSpell(5680, e.self:GetTarget():GetID()); -- Spell: Gaze of Anguish
		eq.set_timer("cast",45*1000);		
	elseif (e.timer == "check_leash") then	
		if(e.self:CalculateDistance( -256, 2100, -120.9) > 140 or e.self:GetZ() > -130 or e.self:GetZ() < -160) then
			Leash_Tormentors(e);		
		end
	elseif (e.timer == "unleash") then
		eq.stop_timer("leasing");
		leashing=0;
	end
	if((myid==317099 and tanthi_ae==1) or (myid==317100 and tantho_ae==1) or (myid==317101 and tanthu_ae==1)) then
		if (e.timer=="void") then
			e.self:CastSpell(5677, e.self:GetTarget():GetID()); -- Spell: Void of Suppression
			eq.set_timer("void",60*1000);
		elseif (e.timer=="relinq") then
			e.self:CastSpell(5675, e.self:GetTarget():GetID()); -- Spell: Relinquish Spirit
			eq.set_timer("relinq",30*1000);
		elseif (e.timer=="torment") then
			e.self:CastSpell(5676, e.self:GetTarget():GetID()); -- Spell: Torment of Body
			eq.set_timer("torment",60*1000);
		end
	end
end

function Tormentor_Signal(e)
	if (e.signal==1) then
		local instance_id = eq.get_zone_instance_id();
		eq.get_entity_list():GetNPCByNPCTypeID(317099):CastSpell(16234,0,0,1);
		eq.get_entity_list():GetNPCByNPCTypeID(317100):CastSpell(16234,0,0,1);
		eq.get_entity_list():GetNPCByNPCTypeID(317101):CastSpell(16234,0,0,1);
		e.self:ForeachHateList(
		  function(ent, hate, damage, frenzy)
			if(ent:IsClient()) then
			  local currclient=ent:CastToClient();
			  currclient:MovePCInstance(317,instance_id, e.self:GetSpawnPointX(),e.self:GetSpawnPointY(),e.self:GetSpawnPointZ(),0); -- Zone: riwwi
			end
		  end
		);		
	end
end

function Leash_Tormentors()
	local tanthi_l= eq.get_entity_list():GetNPCByNPCTypeID(317099);
	local tantho_o= eq.get_entity_list():GetNPCByNPCTypeID(317100);
	local tanthu_u= eq.get_entity_list():GetNPCByNPCTypeID(317101);
	
	if tanthi_l.valid then
		if (tanthi_l:CalculateDistance( -256, 2100, -120.9) > 140 or tanthi_l:GetZ() > -130 or tanthi_l:GetZ() < -160) then
      eq.signal(317099,1); -- NPC: Tanthi_the_Tormentor
		end
	elseif tantho_o.valid then
		if (tantho_o:CalculateDistance( -256, 2100, -120.9) > 140 or tantho_o:GetZ() > -130 or tantho_o:GetZ() < -160) then
      eq.signal(317100,1); -- NPC: Tantho_the_Tormentor
		end
	elseif tanthu_u.valid then
		if (tanthu_u:CalculateDistance( -256, 2100, -120.9) > 140 or tanthu_u:GetZ() > -130 or tanthu_u:GetZ() < -160) then
      eq.signal(317101,1); -- NPC: Tanthu_the_Tormentor
		end
	end
end

function event_encounter_load(e)
  eq.register_npc_event('jelvan', Event.spawn,          317004, Jelvan_Spawn);
  eq.register_npc_event('jelvan', Event.say,          	317004, Jelvan_Say);
  eq.register_npc_event('jelvan', Event.timer,        	317004, Jelvan_Timer);
  
  eq.register_npc_event('jelvan', Event.combat,			317099, Tormentor_Combat);
  eq.register_npc_event('jelvan', Event.timer,			317099, Tormentor_Timer);  
  eq.register_npc_event('jelvan', Event.combat,			317100, Tormentor_Combat);
  eq.register_npc_event('jelvan', Event.timer,        	317100, Tormentor_Timer);
  eq.register_npc_event('jelvan', Event.combat,			317101, Tormentor_Combat);
  eq.register_npc_event('jelvan', Event.timer,        	317101, Tormentor_Timer);

  eq.register_npc_event('jelvan', Event.signal,        	317099, Tormentor_Signal);
  eq.register_npc_event('jelvan', Event.signal,        	317100, Tormentor_Signal);
  eq.register_npc_event('jelvan', Event.signal,        	317101, Tormentor_Signal);
end

function event_encounter_unload(e)
end
