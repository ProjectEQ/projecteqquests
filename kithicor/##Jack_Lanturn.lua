local wave_time=300;

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". Are you here to help us? We received word that an undead army is planning an attack on Freeport, and we are here to hold them off. If you need any [" .. eq.say_link("defensive magics") .. "] cast on you, do not hesitate to ask.");
	elseif(e.message:findi("defensive")) then
		e.self:Say("For those of you new to Norrath, I can improve your [" .. eq.say_link("valor") .. "]. For those who have lasted more than 30 seasons, Tricksy can protect you with aegolism. For the rest of you, Eve can bestow upon you a greater virtue");
	elseif(e.message:findi("valor")) then
		e.self:CastSpell(312,e.other:GetID(),0,1)
	elseif(e.message:findi("reset")) then
		if (e.other:Admin() >= 100 and e.other:GetGM()) then
			eq.debug(e.other:GetName() .. " reset pumpkin");
			start_event(e);
		end
	end		
end

function event_spawn(e)
	eq.debug("spawned, checking global every 5 sec");
	eq.set_timer("check_global",5000); --check global
	local qglobals = eq.get_qglobals();
	if((qglobals["halloween_great_pumpkin"]) == nil) then
		eq.debug("ok");
	end
end

function start_event(e)
	e.self:Shout("Here they come!");
	eq.depop_all(20266);
	eq.depop_all(20267);
	eq.depop_all(20257);
	eq.depop_all(20269);
	eq.depop_all(20268);
	eq.depop_all(20256);
	eq.depop_all(20265);
	eq.depop_all(20264);
	eq.depop_all(20255);
	eq.depop_all(20272);
	eq.depop_all(20273);
	eq.depop_all(20261);
	eq.depop_all(20270);
	eq.depop_all(20271);
	eq.depop_all(20258);
	eq.depop_all(20274);
	eq.depop_all(20262);		
	eq.spawn2(20266,0,0,-151,976,7.5,430); -- NPC: ##a_Ghost
	eq.spawn2(20266,0,0,-161,976,7.5,430); -- NPC: ##a_Ghost
	eq.spawn2(20266,0,0,-131,976,7.5,430); -- NPC: ##a_Ghost
	eq.spawn2(20266,0,0,-121,976,7.5,430); -- NPC: ##a_Ghost
	eq.spawn2(20267,0,0,-151,986,7.5,430); -- NPC: ##a_Spook
	eq.spawn2(20267,0,0,-161,986,7.5,430); -- NPC: ##a_Spook
	eq.spawn2(20267,0,0,-131,986,7.5,430); -- NPC: ##a_Spook
	eq.spawn2(20267,0,0,-121,986,7.5,430); -- NPC: ##a_Spook
	eq.spawn2(20257,0,0,-141,976,7.5,430); --#Casper
	eq.set_global("halloween_great_pumpkin","1",7,"H1");
end

function event_timer(e)
	if(e.timer=="check_global") then
		eq.debug("checking global");
		local qglobals = eq.get_qglobals();
		if((qglobals["halloween_great_pumpkin"]) == nil) then
		 local el = eq.get_entity_list();
 		 if(el:IsMobSpawnedByNpcTypeID(20257) == false) then  --#Casper
		  if(el:IsMobSpawnedByNpcTypeID(20256) == false) then  --#Captain_Scareyface
		   if(el:IsMobSpawnedByNpcTypeID(20255) == false) then  --#Booberella
		    if(el:IsMobSpawnedByNpcTypeID(20261) == false) then  --#Solomon_Grundy
		     if(el:IsMobSpawnedByNpcTypeID(20258) == false) then  --#Count_Alucard
		      if(el:IsMobSpawnedByNpcTypeID(20262) == false) then  --#The_Great_Pumpkin
				start_event(e);
		      else 
		       eq.debug("not spawning, The_Great_Pumpkin is up");				
			  end
		     else 
		      eq.debug("not spawning, Count_Alucard is up");			  
			 end
		    else 
		     eq.debug("not spawning, Solomon_Grundy is up");			 
			end
		   else 
		    eq.debug("not spawning, Booberella is up");				
		   end
		  else 
		   eq.debug("not spawning, Captain_Scareyface is up");		   
		  end
		 else 
		  eq.debug("not spawning, Casper is up");		  
		 end
		else 
		 eq.debug("not spawning, global is set");		 
		end		
	elseif(e.timer=="wave2") then
		eq.stop_timer("wave2");
		eq.spawn2(20269,0,0,-243,1500,-14,379.2); -- NPC: ##an_Imp
		eq.spawn2(20269,0,0,-233,1500,-14,379.2); -- NPC: ##an_Imp
		eq.spawn2(20269,0,0,-263,1500,-14,379.2); -- NPC: ##an_Imp
		eq.spawn2(20269,0,0,-273,1500,-14,379.2); -- NPC: ##an_Imp
		eq.spawn2(20268,0,0,-243,1510,-14,379.2); -- NPC: ##a_Little_Demon
		eq.spawn2(20268,0,0,-233,1510,-14,379.2); -- NPC: ##a_Little_Demon
		eq.spawn2(20268,0,0,-263,1510,-14,379.2); -- NPC: ##a_Little_Demon
		eq.spawn2(20268,0,0,-273,1510,-14,379.2); -- NPC: ##a_Little_Demon
		eq.spawn2(20256,0,0,-233,1500,-14,379.2); --#Captain_Scareyface
		eq.set_global("halloween_great_pumpkin","1",7,"H1");
	elseif(e.timer=="wave3") then
		eq.stop_timer("wave3");
		eq.spawn2(20265,0,0,-151,976,7.5,430); -- NPC: ##a_Werewolf_with_Rabies
		eq.spawn2(20265,0,0,-161,976,7.5,430); -- NPC: ##a_Werewolf_with_Rabies
		eq.spawn2(20265,0,0,-131,976,7.5,430); -- NPC: ##a_Werewolf_with_Rabies
		eq.spawn2(20265,0,0,-121,976,7.5,430); -- NPC: ##a_Werewolf_with_Rabies
		eq.spawn2(20264,0,0,-151,986,7.5,430); -- NPC: ##a_Bat_with_Herpes
		eq.spawn2(20264,0,0,-161,986,7.5,430); -- NPC: ##a_Bat_with_Herpes
		eq.spawn2(20264,0,0,-131,986,7.5,430); -- NPC: ##a_Bat_with_Herpes
		eq.spawn2(20264,0,0,-121,986,7.5,430); -- NPC: ##a_Bat_with_Herpes
		eq.spawn2(20255,0,0,-141,976,7.5,430); --#Booberella
		eq.set_global("halloween_great_pumpkin","1",7,"H1");
	elseif(e.timer=="wave4") then
		eq.stop_timer("wave4");
		eq.spawn2(20272,0,0,-151,976,7.5,430); -- NPC: ##a_Zombie
		eq.spawn2(20272,0,0,-161,976,7.5,430); -- NPC: ##a_Zombie
		eq.spawn2(20272,0,0,-131,976,7.5,430); -- NPC: ##a_Zombie
		eq.spawn2(20272,0,0,-121,976,7.5,430); -- NPC: ##a_Zombie
		eq.spawn2(20273,0,0,-151,986,7.5,430); -- NPC: ##a_Xombie
		eq.spawn2(20273,0,0,-161,986,7.5,430); -- NPC: ##a_Xombie
		eq.spawn2(20273,0,0,-131,986,7.5,430); -- NPC: ##a_Xombie
		eq.spawn2(20273,0,0,-121,986,7.5,430); -- NPC: ##a_Xombie
		eq.spawn2(20261,0,0,-141,976,7.5,430); --#Solomon_Grundy
		eq.set_global("halloween_great_pumpkin","1",7,"H1");
	elseif(e.timer=="wave5") then
		eq.stop_timer("wave5");
		eq.spawn2(20270,0,0,-243,1500,-14,379.2); -- NPC: ##a_Vampire
		eq.spawn2(20270,0,0,-233,1500,-14,379.2); -- NPC: ##a_Vampire
		eq.spawn2(20270,0,0,-263,1500,-14,379.2); -- NPC: ##a_Vampire
		eq.spawn2(20270,0,0,-273,1500,-14,379.2); -- NPC: ##a_Vampire
		eq.spawn2(20271,0,0,-243,1510,-14,379.2); -- NPC: ##a_Vampire_Bat
		eq.spawn2(20271,0,0,-233,1510,-14,379.2); -- NPC: ##a_Vampire_Bat
		eq.spawn2(20271,0,0,-263,1510,-14,379.2); -- NPC: ##a_Vampire_Bat
		eq.spawn2(20271,0,0,-273,1510,-14,379.2); -- NPC: ##a_Vampire_Bat
		eq.spawn2(20258,0,0,-233,1500,-14,379.2); --#Count_Alucard
		eq.set_global("halloween_great_pumpkin","1",7,"H1");
	elseif(e.timer=="wave6") then
		eq.stop_timer("wave6");
		eq.spawn2(20274,0,0,-243,1500,-14,379.2); -- NPC: ##Soldier_of_the_Damned
		eq.spawn2(20274,0,0,-233,1500,-14,379.2); -- NPC: ##Soldier_of_the_Damned
		eq.spawn2(20274,0,0,-263,1500,-14,379.2); -- NPC: ##Soldier_of_the_Damned
		eq.spawn2(20274,0,0,-273,1500,-14,379.2); -- NPC: ##Soldier_of_the_Damned
		eq.spawn2(20274,0,0,-243,1510,-14,379.2); -- NPC: ##Soldier_of_the_Damned
		eq.spawn2(20274,0,0,-233,1510,-14,379.2); -- NPC: ##Soldier_of_the_Damned
		eq.spawn2(20274,0,0,-263,1510,-14,379.2); -- NPC: ##Soldier_of_the_Damned
		eq.spawn2(20274,0,0,-273,1510,-14,379.2); -- NPC: ##Soldier_of_the_Damned
		eq.spawn2(20262,0,0,-233,1500,-14,379.2); --#The_Great_Pumpkin
		eq.set_global("halloween_great_pumpkin","1",7,"H1");
	elseif(e.timer=="announce_hour") then
		eq.stop_timer("announce_hour");
		e.self:Shout("The forces will be coming in about an hour's time!");
	end
end

function event_signal(e)
	if (e.signal==1) then
		eq.set_timer("wave2",wave_time*1000); --5 min
	elseif (e.signal==2) then
		eq.set_timer("wave3",wave_time*1000); --5 min
	elseif (e.signal==3) then
		eq.set_timer("wave4",wave_time*1000); --5 min
	elseif (e.signal==4) then
		eq.set_timer("wave5",wave_time*1000); --5 min
	elseif (e.signal==5) then
		eq.set_timer("wave6",wave_time*1000); --5 min
	elseif (e.signal==6) then
		e.self:Shout("We did it! Freeport is safe! Happy Halloween!");
		local spawn_variance=math.floor(math.random(2700));
		local spawn_time=3600+spawn_variance;
		eq.debug("next pumpkin in " .. spawn_time .. " seconds");
		eq.set_timer("announce_hour",spawn_variance*1000);
		eq.set_global("halloween_great_pumpkin","1",7,tostring("S"..spawn_time));
	end
end
