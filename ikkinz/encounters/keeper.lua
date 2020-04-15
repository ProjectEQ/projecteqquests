--[[
#Keeper_of_the_Altar (294620)
	Throw (4185) --40s -- Keeper of the Altar casts its eye upon several enemies and tosses them aggressively away!
				--throw 3 random hatelist
	Earthen Shrapnel (4188) --30sec
	Kneeshatter (4851) --30s
	Bury (5001): Keeper of the Altar crushes an enemy to the ground in an attempt to bury them!
#Altar_Adherent (294615)
Altar_Assailant (294622)
--]]

local num_adhere=0;

function KeeperTimer(e)
	if e.timer=="assail" then
		e.self:Emote("quakes violently as Adhere assailants form from the ground to join in battle!");
		eq.set_timer("assail",60*1000);
		eq.spawn2(294622,0,0,680,59,-73,156); -- NPC: Altar_Assailant
		eq.spawn2(294622,0,0,816,125,-73,248); -- NPC: Altar_Assailant
		eq.spawn2(294622,0,0,744,46,-73,202); -- NPC: Altar_Assailant
		eq.spawn2(294622,0,0,746,125,-73,120); -- NPC: Altar_Assailant
		--eq.spawn2(294622,0,0,908,111,-73,300);		
		--eq.spawn2(294622,0,0,852,73,-73,292);		
		--eq.spawn2(294622,0,0,852,73,-73,292);		
		--eq.spawn2(294622,0,0,803,84,-73,0);
		--eq.spawn2(294622,0,0,888,123,-73,410);
	elseif e.timer=="adhere" then
		e.self:Emote("slams its fist to the ground which calls forth an adherent to aid it in battle!");
		eq.set_timer("adhere",100*1000);
		if num_adhere==0 then
			eq.spawn2(294615,0,0,803,84,-73,0); -- NPC: #Altar_Adherent
		elseif num_adhere==1 then
			eq.spawn2(294637,0,0,803,84,-73,0); -- NPC: #Altar_Adherent_
		elseif num_adhere==2 then
			eq.spawn2(294638,0,0,803,84,-73,0); -- NPC: #Altar_Adherent__
		elseif num_adhere==3 then
			eq.spawn2(294639,0,0,803,84,-73,0); -- NPC: #Altar_Adherent___
		elseif num_adhere==4 then
			eq.spawn2(294640,0,0,803,84,-73,0); -- NPC: #Altar_Adherent____
		end
		num_adhere=num_adhere+1;
		if num_adhere >=5 then
			eq.stop_timer("adhere");
		end
	elseif e.timer=="bury" then
		e.self:Emote("crushes an enemy to the ground in an attempt to bury them!");
		eq.set_timer("bury", math.random(10,40)  * 1000);
		e.self:CastSpell(5001, e.self:GetTarget():GetID()); -- Spell: Bury
	elseif e.timer=="shrap" then		
		eq.set_timer("bury", 30*1000);
		e.self:CastSpell(4188, e.self:GetHateRandom():GetID()); -- Spell: Earthen Shrapnel	
	elseif e.timer=="throw" then
		eq.set_timer("throw", 40*1000);
		e.self:Emote("casts its eye upon several enemies and tosses them aggressively away!");
		e.self:CastSpell(4185, e.self:GetHateRandom():GetID()); -- Spell: Throw
		e.self:CastSpell(4185, e.self:GetHateRandom():GetID()); -- Spell: Throw
		e.self:CastSpell(4185, e.self:GetHateRandom():GetID()); -- Spell: Throw
	elseif e.timer=="reset" then
		eq.depop_all(294615);
		eq.depop_all(294622);
		eq.depop_all(294637);
		eq.depop_all(294638);
		eq.depop_all(294639);
		eq.depop_all(294640);
		e.self:SetHP(e.self:GetMaxHP());
		e.self:CastSpell(3791, e.self:GetID()); -- Spell: Ocean's Cleansing
		e.self:WipeHateList();
		eq.stop_timer("reset");
	end
end

function KeeperCombat(e)
	if e.joined then
		eq.set_timer("assail", math.random(10,15) * 1000);	
		eq.set_timer("adhere", math.random(45,60) * 1000);
		eq.set_timer("shrap",  math.random(5,10) * 1000);
		eq.set_timer("throw",  math.random(14,20) * 1000);
		eq.set_timer("bury",   math.random(5,20) * 1000);
		eq.stop_timer("reset");
	else
		eq.stop_timer("assail");
		eq.stop_timer("shrap");
		eq.stop_timer("bury");
		eq.stop_timer("adhere");
		eq.set_timer("reset",60*1000);
	end
end

function KeeperDeath(e)
	eq.spawn2(294621,0,0,680,59,-73,156); -- NPC: a_pile_of_bones
	eq.spawn2(294621,0,0,937,14,-72,400); -- NPC: a_pile_of_bones
	eq.spawn2(294621,0,0,908,111,-73,300); -- NPC: a_pile_of_bones
	eq.spawn2(294621,0,0,685,1,-73,114); -- NPC: a_pile_of_bones
	eq.signal(294631,8); --set lockout
	eq.zone_emote(10,"The Keeper of the Altar has been defeated! You have found a way do what even the trusik priests of old had trouble with." ..
	"You are well on your way to uncovering the secrets that Txevu has holed up inside its walls. Congratulations!");
	eq.ZoneMarquee(10,510,1,1,6000,"The Keeper of the Altar has been defeated! Congratulations!");
	eq.depop_all(294622);
	eq.stop_timer("adhere");
end

function AssailSpawn(e)
	eq.set_timer("depop",30*60*1000);
end

function AssailTimer(e)
	if e.timer=="depop" then
		eq.zone_emote(0,"The assailant runs out of energy and crumbles to the ground.");
		eq.depop();
	end
end

function event_encounter_load(e)
	inst_id = eq.get_zone_instance_id()
	eq.register_npc_event("keeper", Event.spawn, 294622, AssailSpawn)
	eq.register_npc_event("keeper", Event.timer, 294622, AssailTimer)	
	eq.register_npc_event("keeper", Event.timer, 294620, KeeperTimer)
	eq.register_npc_event("keeper", Event.combat, 294620, KeeperCombat)	
	eq.register_npc_event("keeper", Event.death_complete, 294620, KeeperDeath)
end
