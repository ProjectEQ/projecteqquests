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

function KeeperSpawn(e)
	eq.set_next_hp_event(50);
end

function KeeperHp(e)
if(e.hp_event == 50) then
    e.self:SetSpecialAbility(4, 1); --turn aoe ramp on
    eq.zone_emote(13,"Keeper of the Altar is infuriated!");
    eq.set_timer("aerampoff", 5 * 1000);
    eq.set_next_inc_hp_event(52); --to reset on event failure
	eq.set_next_hp_event(10);
elseif(e.hp_event == 10) then
    e.self:SetSpecialAbility(4, 1); --turn aoe ramp on
    eq.zone_emote(13,"Keeper of the Altar is infuriated!");
    eq.set_timer("aerampoff", 5 * 1000);
elseif (e.inc_hp_event == 52) then
	eq.set_next_hp_event(50);
end
end
		
function KeeperTimer(e)
	if e.timer=="assail" then
		e.self:Emote("quakes violently as Adhere assailants form from the ground to join in battle!");
		eq.set_timer("assail",60*1000);
		eq.spawn2(294622,0,0,680,59,-73,156); -- NPC: Altar_Assailant
		eq.spawn2(294622,0,0,816,125,-73,248); -- NPC: Altar_Assailant
		eq.spawn2(294622,0,0,744,46,-73,202); -- NPC: Altar_Assailant
		eq.spawn2(294622,0,0,746,125,-73,120); -- NPC: Altar_Assailant
		eq.spawn2(294622,0,0,908,111,-73,300);		
		eq.spawn2(294622,0,0,852,73,-73,292);		
		eq.spawn2(294622,0,0,852,73,-73,292);		
		eq.spawn2(294622,0,0,803,84,-73,0);
		eq.spawn2(294622,0,0,888,123,-73,410);
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
		eq.debug("Altar Adherent Alive: " .. num_adhere);
		if num_adhere >=5 then
			eq.stop_timer("adhere");
		end
	elseif e.timer=="bury" then
		e.self:Emote("crushes an enemy to the ground in an attempt to bury them!");
		eq.set_timer("bury", math.random(10,40)  * 1000);
		e.self:CastedSpellFinished(5001, e.self:GetHateRandom()); -- Spell: Bury
	elseif e.timer=="shrap" then		
		eq.set_timer("shrap", 30*1000);
		e.self:CastedSpellFinished(4188, e.self:GetHateRandom()); --  Spell: Earthen Shrapnel
	elseif e.timer=="throw" then
		local instance_id = eq.get_zone_instance_id();
		e.self:ForeachHateList(
		  function(ent, hate, damage, frenzy)
			if(ent:IsClient() and e.self:CalculateDistance(ent:GetX(), ent:GetY(), ent:GetZ()) >= 100) then
			  local currclient=ent:CastToClient();
				--e.self:Shout("You will not evade me " .. currclient:GetName()) keeper doesnt shout
				currclient:MovePCInstance(294,instance_id, e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ(),0); -- Zone: ikkinz
			end
		  end
		);
		eq.set_timer("throw", 40*1000);
		e.self:Emote("casts its eye upon several enemies and tosses them aggressively away!");
		hate_list = e.self:CountHateList();
    		if (hate_list ~= nil and tonumber(hate_list) == 1) then
				e.self:CastedSpellFinished(4185, e.self:GetHateTop());	-- Spell: Throw
			elseif (hate_list ~= nil and tonumber(hate_list) == 2) then
				e.self:CastedSpellFinished(4185, e.self:GetHateTop());	-- Spell: Throw
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw

			elseif (hate_list ~= nil and tonumber(hate_list) >= 3) then
				e.self:CastedSpellFinished(4185, e.self:GetHateTop());	-- Spell: Throw
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); -- Spell: Throw
			end
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
	elseif e.timer=="aerampoff" then
		eq.stop_timer("aerampoff");
		e.self:SetSpecialAbility(4, 0); --turn aoe ramp off
    	eq.zone_emote(13,"Keeper of the Altar is no longer infuriated.");
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
		eq.stop_timer("throw");
		eq.set_timer("reset",180*1000);
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
	eq.depop_all(294615);
	eq.depop_all(294637);
	eq.depop_all(294638);
	eq.depop_all(294639);
	eq.depop_all(294640);
	eq.stop_timer("adhere");
	eq.debug("Altar Adherent Alive: " .. num_adhere);
end



function AssailSpawn(e)
	eq.set_timer("deactivate", 15 * 1000);
end

function AssailTimer(e)
	if (e.timer == "deactivate") then
    		e.self:SetSpecialAbility(24, 1); --turn on immunity
    		e.self:SetSpecialAbility(35, 1); --turn turn on immunity
		e.self:WipeHateList();
		eq.stop_timer("deactivate");
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"The assailant runs out of energy and crumbles to the ground.");
		e.self:SetAppearance(3);
		eq.set_timer("depop", 5 * 1000); -- guessing 5 sec until depop at this point
	elseif (e.timer == "depop") then
		eq.depop();
	elseif(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetY() < -70) then
				e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 3 * 1000);
			end
	end
end

function AssailCombat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3 * 1000);
		
	else
		eq.stop_timer("OOBcheck");
	end
end

function event_encounter_load(e)
	inst_id = eq.get_zone_instance_id()
	eq.register_npc_event("keeper", Event.combat, 294622, AssailCombat)
	eq.register_npc_event("keeper", Event.spawn, 294622, AssailSpawn)
	eq.register_npc_event("keeper", Event.timer, 294622, AssailTimer)	
	eq.register_npc_event("keeper", Event.timer, 294620, KeeperTimer)
	eq.register_npc_event("keeper", Event.combat, 294620, KeeperCombat)
	eq.register_npc_event("keeper", Event.spawn, 294620, KeeperSpawn)
	eq.register_npc_event("keeper", Event.hp, 294620, KeeperHp)
	eq.register_npc_event("keeper", Event.death_complete, 294620, KeeperDeath)
end
