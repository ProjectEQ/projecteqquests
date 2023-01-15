--Scout_Mainil (249000)
--Scout_Granos (249001)
--Executioner_Gimdk (249078)
--Energy_Focus (249077)
--Matter_Focus (249079)
--Spirit_Focus (249082)
--#Chest_of_the_Foci (249075)
--#The_Slimy_Chest_of_the_Witness (249076)
--#Gimdk`s_chest (249234)
--The_First_Witness (249083)
local event_started=false;
local exec_position=1;
local exec_chest=false;

local mwp10=false;
local mwp20=false;
local mwp27=false;
local mwp33=false;
local mwp36=false;
local gwp33=false;
local gwp35=false;
function Mainil_Spawn(e)
	e.self:PauseWandering(3);
	eq.set_timer("pause_wander",1000);
	eq.set_timer("auto_start", 1000);
end
function Granos_Spawn(e)
	e.self:PauseWandering(3);
	eq.set_timer("pause_wander",1000);
end

function Mainil_Say(e)
	if(e.message:findi("hail")) then
		if event_started==false then
			e.self:Say("Greetings friend, thank you for making such haste to get here. The situation is worse than we feared. Not only is the First Witness attempting to complete his spell, he has minions that he is sending to the outside. He is hoping that by assaulting Gukta he will distract us. My friend here will help you guard the exit, please ensure that nothing happens to him. I'll be talking half of you with me, so we can assess the situation. As soon as I have a better idea of what is going on, I will pass on more instructions to you. When you are [" .. eq.say_link("ready",false,"ready") .. "] please let me know, and we shall be off.");
		else
			e.self:Say("If you need me to [" .. eq.say_link("wait",false,"wait") .. "] then let me know");
		end
	elseif(e.message:findi("ready") and event_started==false) then
		event_started=true;
		e.self:Say("Ok, half of you please accompany me while we scout ahead. Granos, I will let you know when I know more.");			
		eq.stop_timer("pause_wander");
	elseif(e.message:findi("wait") and event_started==true) then
		e.self:PauseWandering(30);
		e.self:Say("Very well, we can wait here a moment.");
	end
end

function Granos_Say(e)
	if(e.message:findi("hail")) then
		if event_started==false then
			e.self:Say("Greetings, it is good that you came to assist us. We cannot allow the First Witness of Hate to complete his spell. Half of you are going to have to go ahead with my companion, while the other half are going to need to wait here with me. We suspect that the First Witness will attempt to send a force here as a diversion. We will be able to catch up with them soon");
		else
			e.self:Say("'Now is not the time to talk, there is fighting to be done!'");
		end
	end
end

function Granos_Timer(e)
	if e.timer=="pause_wander" then
		e.self:PauseWandering(3);
	end
end

function Granos_Signal(e)
	if e.signal==1 then
		e.self:Say("It appears as though the assault is starting.  Prepare yourselves.");
	elseif e.signal==2 then
		eq.stop_timer("pause_wander");
	end
end

function Mainil_Timer(e)
	if e.timer=="adds_on_granos" then
		eq.spawn2(249053,0,0,620.24,-1027.12,75.66,128):AddToHateList(eq.get_entity_list():GetNPCByNPCTypeID(249001),1); -- NPC: a_blade_of_the_First
		eq.spawn2(249090,0,0,620.54,-1039.19,74.15,112):AddToHateList(eq.get_entity_list():GetNPCByNPCTypeID(249001),1); -- NPC: a_blade_of_the_First
	elseif e.timer=="pause_wander" then
		e.self:PauseWandering(3);
	elseif e.timer=="finish_note" then
		e.self:Emote("finishes scrawling his note, and leans over to listen to the ground. 'It sounds as though the assault on your companions has ended, Grannos should be moving in this direction soon.  We'll be off in just a moment.  I am curious as to what lies ahead.'");
		eq.stop_timer("finish_note");
		eq.signal(249001,2); -- NPC: Scout_Granos
	elseif e.timer=="auto_start" then
		local now_clients = eq.get_entity_list():GetClientList();
		for client in now_clients.entries do
			if (client.valid and e.self:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) >150) then	
				eq.debug("player > 150 dist, starting event");
				event_started=true;
				e.self:Say("Ok, half of you please accompany me while we scout ahead. Granos, I will let you know when I know more.");			
				eq.stop_timer("pause_wander");
				eq.stop_timer("auto_start");
				break;				
			end
		end		
	end
end

function Mainil_Waypoint_Arrive(e)
	eq.debug("mainil wp: " .. e.wp);
	if (e.wp == 10) then
		if mwp10 ==false then
			mwp10=true;
			e.self:Say("It sounds as though the assault has begun. I hope that Granos and your companions can hold the entrance.' He then studies the ground, 'It appears as though we are on the right track. We are making excellent time so far.");
			eq.set_timer("adds_on_granos",60*1000); --60
			eq.signal(249001,1)
		end
	elseif (e.wp == 20) then
		if mwp20 ==false then 
			mwp20=true;
			eq.debug("at wp 20- emote");
			e.self:Say("Hmm, this is very unusual. There seems to be a second path leading off to the North. It appears as though someone may be assisting the first witness. I will need to follow this second set of prints to investigate further.' He then scratches a note into the boulder before him with instructions for his partner.");	
			eq.zone_emote(1,"The scout appears to no longer need your protection.");
			e.self:ModifyNPCStat("hp_regen", "4000");
			e.self:ModifyNPCStat("ac", "1000");
			e.self:PauseWandering(30);			
			eq.set_timer("finish_note",25*1000);
			eq.stop_timer("adds_on_granos");
		end
	elseif (e.wp == 27) then
		if mwp27 ==false then 
			mwp27=true;
			e.self:Emote("glances casually at the tainted water as he wades effortlessly through the murky liquid.  The torchlight illuminates the dark pool, giving it a forbidding green glow.");
		end
	elseif (e.wp == 33) then
		if mwp33 ==false then 
			mwp33=true;
			eq.zone_emote(1,"The smell of death is carried heavy on a wind from the South.  An unnatural chill sets the hairs on the back of your neck on end.  Scout Mainlil looks uncomfortable for a moment, 'As much as it pains me, we must head South.  Something tells me there is more than we expected at work.'");
		end		
	elseif (e.wp == 36) then --executioner
		if mwp36==false then 
			mwp36=true;
			eq.debug("at wp 36- spawn exec");
			e.self:Say("This is worse than I feared.  The Executioner is feeding those souls to the Cauldron to assist the First Witness.  I fear that your friends may have more to deal with than just those that are assisting with his spell.  It appears the Executioner is protected by the same magic that guards the First Witness of Hate.  All we will be able to do is stem the flow of Souls from this place, aside from that, your friends will be on their own.");
			eq.spawn2(249078,0,0,512.5,521.6,-107.87,256); --Executioner_Gimdk
			e.self:MoveTo(508.73,433.41,-107.87,0,true);
			e.self:PauseWandering(86400);
			e.self:StopWandering();
			e.self:SetWaypointPause();
		end
	end;
end;

function Granos_Waypoint_Arrive(e)
	eq.debug("gran wp: " .. e.wp);
	if (e.wp==21) then
		if gwp21==false then
			gwp21=true;
			e.self:PauseWandering(5);
			e.self:Emote("reads the note scratched into the rock.  'Mainil left us instructions to head East, he is going to explore what lies North.  He believes we should find the First Witness in that direction.  Let us not dally, he is getting stronger as we speak!");			
		end
	elseif (e.wp==30) then
		if gwp33==false then
			gwp33=true;
			eq.debug("at wp 33- spawn dudes");
			eq.spawn2(249083,0,0,154.03,681.46,-17.09,256); --First Witness 154.03,681.46,-17.09
			eq.spawn2(249077,0,0,153.7,663.2,-38.87,256); --Energy
			eq.spawn2(249079,0,0,192.32,729,-23.87,128); --Matter
			eq.spawn2(249082,0,0,117.15,729,-23.87,384); --Spirit		
		end
	elseif (e.wp == 35) then
		if gwp35==false then
			gwp35=true;
			eq.debug("at wp 35- emote");
			e.self:Say("There are the foci. They must be destroyed before he completes his spell, or his power will increase tenfold.");			
			e.self:MoveTo(e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading(),true);
			e.self:PauseWandering(86400);
			e.self:StopWandering();
			e.self:SetWaypointPause();			
		end
	end
end

function Executioner_Spawn(e)
	eq.debug("exec spawn");
	e.self:MoveTo(468.64,533.62,-107.87,192,true);
	eq.set_timer("spawn_adds",20*1000);
	exec_position=1;
end

function Executioner_Timer(e)
	eq.debug("exec timer, position: " .. exec_position);
--468.64,533.62,-107.87,192 NE
--468.64,480.02,-107.87,192 ME
--469.13,424.62,-107.87,192 SE
--545.11,424.86,-107.87 64 SW
--547.11,480.10,-107.87 64 MW
--547.01,534.10,-107.87 64 NW
	if e.timer=="move_adds" then
		if exec_position==1 then --ne
			e.self:MoveTo(547.11,480.10,-107.87, 64,true); --mw
			exec_position=2;
		elseif exec_position==2 then --mw
			e.self:MoveTo(469.13,424.62,-107.87,192,true); --se
			exec_position=3;
		elseif exec_position==3 then--se
			e.self:MoveTo(545.11,424.86,-107.87 ,64,true); --sw
			exec_position=4;
		elseif exec_position==4 then--sw
			e.self:MoveTo(468.64,480.02,-107.87,192,true); --me
			exec_position=5;
		elseif exec_position==5 then--me
			e.self:MoveTo(547.01,534.10,-107.87, 64,true); --nw
			exec_position=6;
		elseif exec_position==6 then--nw
			e.self:MoveTo(468.64,533.62,-107.87,192,true); --ne
			exec_position=1;
		end
		eq.stop_timer("move_adds");
		eq.set_timer("spawn_adds",20*1000);		
	elseif e.timer=="spawn_adds" then
		eq.debug("exec spawn add");
		if e.self:GetHeading()==64 then
			eq.spawn2(eq.ChooseRandom(249152,249154,249157,249161,249164,249169,249178,249183),0,0,e.self:GetX()+20,e.self:GetY(),e.self:GetZ(),192); -- NPC(s): a_risen_acolyte (249152), a_risen_champion (249154), a_risen_death_knight (249157), a_risen_deceiver (249161), a_risen_fire_caller (249164), a_risen_partisan (249169), a_risen_stalker (249178), a_risen_witch_doctor (249183)
		else
			eq.spawn2(eq.ChooseRandom(249152,249154,249157,249161,249164,249169,249178,249183),0,0,e.self:GetX()-20,e.self:GetY(),e.self:GetZ(),64); -- NPC(s): a_risen_acolyte (249152), a_risen_champion (249154), a_risen_death_knight (249157), a_risen_deceiver (249161), a_risen_fire_caller (249164), a_risen_partisan (249169), a_risen_stalker (249178), a_risen_witch_doctor (249183)
		end
		e.self:DoAnim(42);
		e.self:Emote("focuses his attention on a new Risen, 'The Cauldron shall feast on your essence!");
		eq.stop_timer("spawn_adds");
		eq.set_timer("move_adds",10*1000);
	end
end

function Executioner_Signal(e)
	eq.debug("exec signal");
	if e.signal==1 then
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(25, 0);
		e.self:SetSpecialAbility(35, 0);
		e.self:AddToHateList(eq.get_entity_list():GetNPCByNPCTypeID(249000),1);
		eq.stop_timer("spawn_adds");
		eq.stop_timer("move_adds");
	end
end

function First_Signal(e)
	eq.debug("first signal");
	if e.signal==1 then
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(25, 0);
		e.self:SetSpecialAbility(35, 0);
		e.self:CameraEffect(1000,6);
		eq.zone_emote(13,"As the last Focus blinks lifelessly, the room trembles. The First Witness screams as his shield of protection fails, 'Infidels! I was so close! You shall die!'");
	end
end

function Executioner_Combat(e)
	if e.joined==true then
		e.self:Say("Come to me, your execution will empower the First Witness.");
	end
end

function Executioner_Death(e)
	local el=eq.get_entity_list();
	if (el:IsMobSpawnedByNpcTypeID(249000) == true and el:IsMobSpawnedByNpcTypeID(249001) == true) then
		exec_chest=true;
		eq.zone_emote(15,"Your victory has weakened a shroud of magic cloaking the dungeon's treasure.");
	end
end
function Risen_Spawn(e)
	eq.set_timer("depop",30*1000);
	eq.set_timer("aggro_scout",5*1000);
end

function Risen_Timer(e)
	if e.timer=="depop" then
		eq.spawn2(249128,58,0,508.73,433.41,-107.87,0); -- NPC: a_malicious_force
		eq.zone_emote(3,"The Risen before the Executioner explodes, leaving a small bit of dancing energy where it once stood.");
		eq.depop();
	elseif e.timer=="aggro_scout" then
		e.self:AddToHateList(eq.get_entity_list():GetNPCByNPCTypeID(249000),1);
		eq.stop_timer("aggro_scout");
	end
end

function Wisp_Waypoint_Arrive(e)
	eq.debug("wisp wp: " .. e.wp);
	if (e.wp == 35) then		
		eq.zone_emote(15,"The flames roar with angry heat as the Cauldron consumes the soul.");
		eq.spawn2(eq.ChooseRandom(249011,249061,249053,249056,249070,249142),0,0,153.2,673.4,-38.87,256); -- NPC(s): an_acolyte_of_the_First (249011), an_ice_caller_of_the_First (249061), a_blade_of_the_First (249053), a_caller_of_the_First (249056), a_fist_of_the_First (249070), a_protector_of_the_First_Witness (249142)
		eq.depop();
	end
end

function FocusE_Combat(e)
	if e.joined==true then
		eq.set_timer("focus",math.random(3,15)*1000); --Blurring Focus 48s 4123
		eq.set_timer("vortex",math.random(3,15)*1000); -- Life Vortex 48s 4122
	else
		eq.stop_timer("focus");
		eq.stop_timer("vortex");
	end
end

function FocusE_Timer(e)
	if e.timer=="focus" then
		e.self:CastSpell(4123,e.self:GetHateRandom():GetID()); -- Spell: Blurring Focus
		eq.set_timer("focus",48*1000);
	elseif e.timer=="vortex" then
		e.self:CastSpell(4122,e.self:GetHateRandom():GetID()); -- Spell: Life Vortex
		eq.set_timer("vortex",48*1000);
	end
end

function FocusM_Combat(e)
	if e.joined==true then
		eq.set_timer("ess",math.random(1,3)*1000) --Everlasting Essence 10s 4124
		eq.set_timer("swirl",math.random(3,15)*1000) -- Swirling Matter 48s 4121
	else
		eq.stop_timer("ess");
		eq.stop_timer("swirl");
	end
end

function FocusM_Timer(e)
	if e.timer=="ess" then
		e.self:CastSpell(4124,e.self:GetHateRandom():GetID()); -- Spell: Everlasting Essence
		eq.set_timer("ess",10*1000);
	elseif e.timer=="swirl" then
		e.self:CastSpell(4121,e.self:GetHateRandom():GetID()); -- Spell: Swirling Matter
		eq.set_timer("swirl",48*1000);
	end
end

function FocusS_Combat(e)
	if e.joined==true then
		eq.set_timer("mass",math.random(1,3)*1000) -- Infinite Mass 4125
	else
		eq.stop_timer("mass");
	end
end

function FocusS_Timer(e)
	if e.timer=="mass" then
		e.self:CastSpell(4125,e.self:GetHateRandom():GetID()); -- Spell: Infinite Mass
		eq.set_timer("mass",48*1000);
	end
end

function Focus_Death(e)
	local el=eq.get_entity_list();
	if (el:IsMobSpawnedByNpcTypeID(249077) == false and el:IsMobSpawnedByNpcTypeID(249079) == false and el:IsMobSpawnedByNpcTypeID(249082) == false) then
		eq.zone_emote(15,"Your victory has weakened a shroud of magic cloaking the dungeon's treasure.");
		eq.signal(249083,1); --wake first witness
		eq.signal(249078,1); --make executioner attackable
	end
end
function First_Death(e)
	local el=eq.get_entity_list();
	if (el:IsMobSpawnedByNpcTypeID(249000) == true and el:IsMobSpawnedByNpcTypeID(249001) == true) then
		eq.zone_emote(13,"The First Witness screams silently as his magic fails.  You feel a wave of hate wash over you, as a voice whispers in your head, 'There will always be a First.  You have not won.'");
		eq.zone_emote(15,"Your victory has weakened a shroud of magic cloaking the dungeon's treasure.");
		if exec_chest==true then
			eq.spawn2(249234,0,0,169.36,681.64,-16.87,384); --#Gimdk`s_chest (249234)
		end
		eq.spawn2(249075,0,0,138.56,681.64,-16.87,128); --#Chest_of_the_Foci (249075)
		eq.spawn2(249076,0,0,153.5,660.5,-38.87,256); --#The_Slimy_Chest_of_the_Witness (249076)

		local dz = eq.get_expedition()
		if dz.valid then
			dz:AddReplayLockout(eq.seconds("4d12h"))
		end
	end
end


function event_encounter_load(e)
	eq.register_npc_event('guke', Event.say, 249000, Mainil_Say);
	eq.register_npc_event('guke', Event.say, 249001, Granos_Say);
	eq.register_npc_event('guke', Event.timer, 249000, Mainil_Timer);
	eq.register_npc_event('guke', Event.timer, 249001, Granos_Timer);
	eq.register_npc_event('guke', Event.spawn, 249000, Mainil_Spawn);
	eq.register_npc_event('guke', Event.spawn, 249001, Granos_Spawn);
	eq.register_npc_event('guke', Event.signal, 249001, Granos_Signal);
	eq.register_npc_event('guke', Event.waypoint_arrive, 249000, Mainil_Waypoint_Arrive);
	eq.register_npc_event('guke', Event.waypoint_arrive, 249001, Granos_Waypoint_Arrive);
	eq.register_npc_event('guke', Event.spawn, 249078, Executioner_Spawn);
	eq.register_npc_event('guke', Event.timer, 249078, Executioner_Timer);
	eq.register_npc_event('guke', Event.signal, 249078, Executioner_Signal);
	eq.register_npc_event('guke', Event.combat, 249078, Executioner_Combat);
	eq.register_npc_event('guke', Event.death_complete, 249078, Executioner_Death);
--249152,249154,249157,249161,249164,249169,249178,249183	
	eq.register_npc_event('guke', Event.spawn, 249152, Risen_Spawn);
	eq.register_npc_event('guke', Event.timer, 249152, Risen_Timer);
	eq.register_npc_event('guke', Event.spawn, 249154, Risen_Spawn);
	eq.register_npc_event('guke', Event.timer, 249154, Risen_Timer);
	eq.register_npc_event('guke', Event.spawn, 249157, Risen_Spawn);
	eq.register_npc_event('guke', Event.timer, 249157, Risen_Timer);
	eq.register_npc_event('guke', Event.spawn, 249161, Risen_Spawn);
	eq.register_npc_event('guke', Event.timer, 249161, Risen_Timer);
	eq.register_npc_event('guke', Event.spawn, 249164, Risen_Spawn);
	eq.register_npc_event('guke', Event.timer, 249164, Risen_Timer);
	eq.register_npc_event('guke', Event.spawn, 249169, Risen_Spawn);
	eq.register_npc_event('guke', Event.timer, 249169, Risen_Timer);	
	eq.register_npc_event('guke', Event.spawn, 249178, Risen_Spawn);
	eq.register_npc_event('guke', Event.timer, 249178, Risen_Timer);
	eq.register_npc_event('guke', Event.spawn, 249183, Risen_Spawn);
	eq.register_npc_event('guke', Event.timer, 249183, Risen_Timer);
	eq.register_npc_event('guke', Event.waypoint_arrive, 249128, Wisp_Waypoint_Arrive);

	eq.register_npc_event('guke', Event.timer, 249077, FocusE_Timer);
	eq.register_npc_event('guke', Event.combat, 249077, FocusE_Combat);
	eq.register_npc_event('guke', Event.death_complete, 249077, Focus_Death);
	eq.register_npc_event('guke', Event.timer, 249079, FocusM_Timer);
	eq.register_npc_event('guke', Event.combat, 249079, FocusM_Combat);
	eq.register_npc_event('guke', Event.death_complete, 249079, Focus_Death);
	eq.register_npc_event('guke', Event.timer, 249082, FocusS_Timer);
	eq.register_npc_event('guke', Event.combat, 249082, FocusS_Combat);
	eq.register_npc_event('guke', Event.death_complete, 249082, Focus_Death);

	eq.register_npc_event('guke', Event.signal, 249083, First_Signal);
	eq.register_npc_event('guke', Event.death_complete, 249083, First_Death);
end
