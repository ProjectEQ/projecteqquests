--[[

Keldovan_the_Harrier (317005)

http://everquest.allakhazam.com/db/quest.html?quest=4278

Upon aggro, he spawns chimeras and ferans in the four "pits" in the main room. 
Kill these to decrease Keldovan's power, and keep killing them to keep his power down throughout the encounter. 
You need only kill mobs in one of the pits. You can ignore the other three. 

On Aggro spawn 4 pit mobs, random:
- Frenzied_Pit_Fiend (317102)
- Raging_Pit_Hound   (317103)

Packmaster's Curse 4720	NPC Hatelist 300
Torment of Body 5676	NPC Hatelist 0
Touch of Anguish 5679	NPC Hatelist 0

he says this every 5.5 minutes - why?
Keldovan the Harrier says 'You have earned the right to die at my feet.'
--]]


local dead_dogs = 0
local inst_id = 0;
local touch_enabled = 1;
local torment_enabled = 1;

function Keldovan_Spawn(e)
	eq.start_timer("decrease_dog",90*1000);
end

function Keldovan_Death(e)
	eq.signal(317116 , 317005);
	--set player lockout
	--chance to spawn 2.0 orb, if so set zone lockout for "bottom orb"
end

function Keldovan_Combat(e)
  if (e.joined == true) then
    e.self:Say("You have earned the right to die at my feet.");
	eq.set_timer("packmaster", math.random(5,30)*1000); 
	eq.set_timer("torment",math.random(5,30)*1000);
	eq.set_timer("touch",math.random(5,30)*1000);
	eq.set_timer("say",300*1000);
	eq.spawn2(eq.ChooseRandom(317102,317103),0,0, -48, 755, -239.9, 210);
	eq.spawn2(eq.ChooseRandom(317102,317103),0,0, 44, 746, -239.9, 30);
	eq.spawn2(eq.ChooseRandom(317102,317103),0,0, 51, 643, -239.9, 90);
	eq.spawn2(eq.ChooseRandom(317102,317103),0,0, -37, 642, -239.9, 165);
  else
	eq.stop_timer("packmaster");
	eq.stop_timer("torment");
	eq.stop_timer("touch");
	eq.stop_timer("say");
	eq.set_timer("depop_dogs",6*1000);
  end
end

function Keldovan_Signal(e)
	if (e.signal==1) then
		eq.set_timer("Dog_NE",3000);
	elseif (e.signal==2) then
		eq.set_timer("Dog_NW",3000);
	elseif (e.signal==3) then
		eq.set_timer("Dog_SW",3000);
	elseif (e.signal==4) then
		eq.set_timer("Dog_SE",3000);
	end
	eq.set_timer("decrease_dog",45*1000);
	check_dogs(e,1);
end

function Keldovan_Timer(e)
	if (e.timer == "say") then
		e.self:Say("You have earned the right to die at my feet.");
	elseif (e.timer == "packmaster") then
		e.self:CastSpell(4720, e.self:GetTarget():GetID());
		eq.set_timer("packmaster",30*1000); 
	elseif (e.timer == "torment") then
		if torment_enabled ==1 then 
			e.self:CastSpell(5676, e.self:GetTarget():GetID());
		end
		eq.set_timer("torment",60*1000);
	elseif (e.timer == "touch") then
		if touch_enabled ==1 then 
			e.self:CastSpell(5679, e.self:GetTarget():GetID());
		end			
		eq.set_timer("touch",45*1000);	
	elseif (e.timer == "Dog_NE") then
		eq.stop_timer("Dog_NE");
		eq.spawn2(eq.ChooseRandom(317102,317103),0,0, -48, 755, -239.9, 210);
	elseif (e.timer == "Dog_NW") then
		eq.stop_timer("Dog_NW");
		eq.spawn2(eq.ChooseRandom(317102,317103),0,0, 44, 746, -239.9, 30);
	elseif (e.timer == "Dog_SW") then
		eq.stop_timer("Dog_SW");
		eq.spawn2(eq.ChooseRandom(317102,317103),0,0, 51, 643, -239.9, 90);	
	elseif (e.timer == "Dog_SE") then
		eq.stop_timer("Dog_SE");
		eq.spawn2(eq.ChooseRandom(317102,317103),0,0, -37, 642, -239.9, 165);
	elseif (e.timer == "depop_dogs") then
		eq.stop_timer("depop_dogs");
		eq.depop_all(317102);
		eq.depop_all(317103);
		dead_dogs=0;
	elseif (e.timer == "decrease_dog") then
		if (dead_dogs >=5) then
			dead_dogs=4;
		elseif (dead_dogs ==4) then
			dead_dogs=3;
		elseif (dead_dogs ==3) then
			dead_dogs=2;
		elseif (dead_dogs ==2) then
			dead_dogs=1;
		else 
			dead_dogs=0;
		end
		check_dogs(e,-1);
	end
end

function check_dogs(e,inc_or_dec)
	if (dead_dogs <= 1) then
		e.self:ModifyNPCStat("mr", "600");
		e.self:ModifyNPCStat("fr", "600");
		e.self:ModifyNPCStat("cr", "600");
		e.self:ModifyNPCStat("pr", "600");
		e.self:ModifyNPCStat("dr", "600");
		e.self:ModifyNPCStat("slow_mitigation","85");
		torment_enabled=1;
		touch_enabled=1;
		e.self:ModifyNPCStat("accuracy", "300");		
		if (inc_or_dec < 0) then
			e.self:Emote("regains his magical aura of defense");
		end		
	elseif (dead_dogs == 2) then
		if (inc_or_dec > 0) then
			e.self:Emote("reels in pain as his protection from magic wavers.");
		else
			e.self:Emote("begins to quicken his attacks again.");
		end
		e.self:ModifyNPCStat("mr", "265");
		e.self:ModifyNPCStat("fr", "205");
		e.self:ModifyNPCStat("cr", "265");
		e.self:ModifyNPCStat("pr", "265");
		e.self:ModifyNPCStat("dr", "240");
		e.self:ModifyNPCStat("slow_mitigation","85");
	elseif (dead_dogs == 3) then
		if (inc_or_dec > 0) then
			e.self:Emote("howls as his protection from slow dwindles.");
		else
			e.self:Emote("seems to regain his awareness.");
		end
		e.self:ModifyNPCStat("slow_mitigation","40");
		torment_enabled=1;
		touch_enabled=1;
	elseif (dead_dogs == 4) then
		if (inc_or_dec > 0) then
			e.self:Emote("appears less able to sense those around him.");
		else
			e.self:Emote("regains his combat stance.");
		end
		e.self:ModifyNPCStat("accuracy", "300");
		torment_enabled=0;
		touch_enabled=0;
	elseif (dead_dogs == 5) then
		if (inc_or_dec > 0) then
			e.self:Emote("shakes as he loses some of his ability to focus his attacks.");
		end		
		e.self:ModifyNPCStat("accuracy", "200");
	end
	
	--eq.modify_npc_stat("min_hit", "1315");
    --eq.modify_npc_stat("max_hit", "5400");
	--eq.modify_npc_stat("ac", "700");	
end

function Dog_Death(e)
	dead_dogs=dead_dogs+1;
	if (e.self:GetSpawnPointY() == 755) then --NE
		eq.signal(317005,1);
	elseif (e.self:GetSpawnPointY() == 746) then --NW
		eq.signal(317005,2);
	elseif (e.self:GetSpawnPointY() == 643) then --SW
		eq.signal(317005,3);
	elseif (e.self:GetSpawnPointY() == 642) then --SE
		eq.signal(317005,4);    
	end
end

function event_encounter_load(e)
  inst_id = eq.get_zone_instance_id();

  --eq.register_npc_event('keldovan', Event.spawn, 317005, Keldovan_Spawn); 
  eq.register_npc_event('keldovan', Event.combat, 		  317005, Keldovan_Combat);
  eq.register_npc_event('keldovan', Event.signal, 		  317005, Keldovan_Signal);
  eq.register_npc_event('keldovan', Event.timer,		  317005, Keldovan_Timer);
  eq.register_npc_event('keldovan', Event.death_complete, 317005, Keldovan_Death);
  eq.register_npc_event('keldovan', Event.death_complete, 317102, Dog_Death); -- Frenzied_Pit_Fiend
  eq.register_npc_event('keldovan', Event.death_complete, 317103, Dog_Death); -- Raging_Pit_Hound 
end

function event_encounter_unload(e)
    --eq.depop_all(317005);
    --eq.depop_all(317102);
    --eq.depop_all(317103);
end
