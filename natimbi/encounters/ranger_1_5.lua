--280085 earth
--280086 fire
--280087 water
--280088 air
--280089 sen of mist

function Trenz_Combat(e)
	if (e.joined == true) then		
		eq.set_timer("wave",14*1000);
		eq.set_timer("adds",10*1000);
		eq.set_timer("senvial",math.random(75,120)*1000);
		--eq.set_timer("senvial",5*1000); test		
	end
end

function Trenz_Timer(e)
	if(e.timer=="wave") then
		eq.stop_timer("wave");
		eq.set_timer("wave",20*1000);
		e.self:CastSpell(5812, e.self:GetHateTop():GetID()); -- Wave of Flame	
	elseif (e.timer=="senvial") then
		eq.spawn2(280089,0,0,e.self:GetX()+15,e.self:GetY()+15,e.self:GetZ(),e.self:GetHeading());
		eq.stop_timer("senvial");
	elseif (e.timer=="adds") then
		eq.spawn2(eq.ChooseRandom(280085,280086,280087,280088),0,0,e.self:GetX()-15,e.self:GetY()-15,e.self:GetZ(),e.self:GetHeading());
		local entity_list = eq.get_entity_list();
		local npc_list = entity_list:GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 280085 or  npc:GetNPCTypeID() == 280086 or  npc:GetNPCTypeID() == 280087 or  npc:GetNPCTypeID() == 280088)) then
				npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end					
	end
end

function Senvial_Say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["ranger_epic"] == "2" and e.other:HasItem(62844) == true) then
		if(e.message:findi("hail")) then
			e.self:Say("Thank you for freeing me, "..e.other:GetName()..". I am not sure how it is that you broke the power that commanded me, but for that I am very grateful. The water spirit looks at you carefully before speaking again. I sense that you will need my aid in the future. To repay my debt to you I give you my blessing. This is no mean thing, it carries with it a portion of my own power. Mine is the cool rain and soft mist. I am the essence of morning dew and the lazy fog. I have no doubt that you will use it wisely. There are more of my kin enslaved by these beasts and others like them. You appear to have the power to rescue them as you have me. I am not a being of foresight or far-seeing, mine is the realm of small, gentle things, but even I can see that you are a being of portent. I am honored to have met you. I must return to my realm. I shall never forget this place and what it has made me do, nor shall I forget the one thing that freed me.");
			e.other:SummonItem(62621);
			if(qglobals["ranger_natimbi_chest"] == nil) then
				eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("ranger_natimbi_chest","1",5,"F");		
			end
			eq.set_timer("depop",8*1000);
		end
	end
end

function Senvial_Spawn(e)
	eq.set_next_hp_event(10);
end

function Senvial_Timer(e)
	if(e.timer=="depop") then
		eq.depop();
	elseif(e.timer=="checkstatus") then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(280084) == false) then
			e.self:Emote("stops moving and, with obvious effort, becomes more like mist than water.  The elemental spirit remains in this position as it struggles to maintain control of its own will.");
			e.self:SetSpecialAbility(19, 1);
			e.self:SetSpecialAbility(20, 1);
			e.self:SetSpecialAbility(24, 1);
			e.self:SetSpecialAbility(25, 1);
			e.self:WipeHateList();
			eq.stop_timer("checkstatus");
		end
	end
end

function Senvial_HP(e)
  if (e.hp_event == 10) then
		eq.set_timer("checkstatus",7*1000);
  end 
end

function event_encounter_load(e)
  eq.register_npc_event('ranger_1_5', Event.timer,          280084, Trenz_Timer);
  eq.register_npc_event('ranger_1_5', Event.combat,         280084, Trenz_Combat);  
  eq.register_npc_event('ranger_1_5', Event.say,	   	   	280089, Senvial_Say);
  eq.register_npc_event('ranger_1_5', Event.spawn,          280089, Senvial_Spawn);
  eq.register_npc_event('ranger_1_5', Event.hp,         	280089, Senvial_HP);
  eq.register_npc_event('ranger_1_5', Event.timer,         	280089, Senvial_Timer); 
end