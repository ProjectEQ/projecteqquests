--336002 Sverins
--336001 Uisima
--336000 a golembound spirit 1 5 sec in, then every minute, every 30 sec wipehatelist heal to full
--336230 a_fireskin_acolyte
local hpcheck;

function Sverin_Combat(e)
	if (e.joined == true) then		
		eq.set_timer("matter",14*1000);
		local entity_list = eq.get_entity_list();
		local npc_list = entity_list:GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 336230 or  npc:GetNPCTypeID() == 336001 or  npc:GetNPCTypeID() == 336000)) then
				npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end			
	end
end

function Uisima_Combat(e)
	if (e.joined == true) then		
		eq.set_timer("golem_add",5*1000);
		local entity_list = eq.get_entity_list();
		local npc_list = entity_list:GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 336230 or  npc:GetNPCTypeID() == 336002 or  npc:GetNPCTypeID() == 336000)) then
				npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end			
	end
end

function Drag_Combat(e)
	if (e.joined == true) then		
		local entity_list = eq.get_entity_list();
		local npc_list = entity_list:GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 336231 or  npc:GetNPCTypeID() == 336002 or  npc:GetNPCTypeID() == 336000)) then
				npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end			
	end
end


function Sverin_Timer(e)
	if(e.timer=="matter") then
		eq.stop_timer("matter");
		eq.set_timer("matter",20*1000);
		e.self:CastSpell(5815, e.self:GetHateTop():GetID()); --Matter Dispersal			
	end
end

function Uisima_Say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(hpcheck and qglobals["ranger_epic"] == "3") then
		if(e.message:findi("hail")) then
			e.self:Say("It is good to be free again. Thank you for your help. Now, let us forget the past, for that is the only way that I shall be able to regain my life. Let us look into your future and the future of your friend the treant. I must somehow make amends for the pain that I have caused him. Please let me see the heartwood in which he now resides.");
		end
	end
end

function Uisima_Trade(e)
	local item_lib = require("items");
	
	if(hpcheck and item_lib.check_turn_in(e.trade, {item1 = 62623})) then
		e.self:Emote("holds the wood for a while, peering into the smooth grains. After a few moments he speaks. 'We are in agreement, the treant and I. You have been my savior and his creator. There seems only one way to repay your efforts on our behalf.' Uisima holds the heartwood at arm's length and breathes lightly to it. You feel as much as hear the treant sigh with pleasure at the feel of the breath. You too feel the breeze brush our face and in it you understand what is happening. Uisima is freeing the wood and the treant inside to take a shape of its choosing. The wood grows, changing shape to become something more than it was, Uisima hands the wood back to you. 'The Red Dogwood treant is a rare creature, gentle in spirit but strong in conviction. He says that he is honored to serve you in this fashion. Take this wood and form around it a blade made of the finest silver. We both thank you but I must go now or I might be captured once again.");
		e.other:SummonItem(62626); --Wind-blessed Heartwood
		local qglobals = eq.get_qglobals(e.other);
		if(qglobals["ranger_dranik_chest"] == nil) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("ranger_dranik_chest","1",5,"F");		
		end	
		eq.set_timer("depop",8*1000);
	end
	item_lib.return_items(e.self, e.other, e.trade);	
end

function Uisima_Spawn(e)
	hpcheck=false;
	eq.set_next_hp_event(10);
end

function Uisima_Timer(e)
	if(e.timer=="depop") then
		eq.depop();
	elseif(e.timer=="golem_add") then
		eq.spawn2(336000,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading());
		eq.stop_timer("golem_add");
		eq.set_timer("golem_add",60*1000);
	elseif(e.timer=="checkstatus") then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(336002) == false) then
			eq.stop_timer("golem_add");
			hpcheck=true;
			e.self:Emote("freezes as if it has chosen to become inanimate stone.");
			e.self:SetSpecialAbility(19, 1);
			e.self:SetSpecialAbility(20, 1);
			e.self:SetSpecialAbility(24, 1);
			e.self:SetSpecialAbility(25, 1);
			e.self:SetNPCFactionID(0);
			e.self:WipeHateList();
			eq.stop_timer("checkstatus");
		end
	end
end

function Uisima_HP(e)
  if (e.hp_event == 10) then
		eq.set_timer("checkstatus",7*1000);
  end 
end

function Golem_Spawn(e)
	eq.set_timer("wipe",30*1000);
end

function Golem_Timer(e)
	if(e.timer=="wipe") then
		eq.spawn2(336000,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	end
end

function event_encounter_load(e)
  eq.register_npc_event('ranger_1_5', Event.timer,          336002, Sverin_Timer);
  eq.register_npc_event('ranger_1_5', Event.combat,         336002, Sverin_Combat);  
  eq.register_npc_event('ranger_1_5', Event.say,	   	   	336001, Uisima_Say);
  eq.register_npc_event('ranger_1_5', Event.spawn,          336001, Uisima_Spawn);
  eq.register_npc_event('ranger_1_5', Event.hp,         	336001, Uisima_HP);
  eq.register_npc_event('ranger_1_5', Event.timer,         	336001, Uisima_Timer);
  eq.register_npc_event('ranger_1_5', Event.trade,         	336001, Uisima_Trade); 
  eq.register_npc_event('ranger_1_5', Event.combat,         336001, Uisima_Combat);
  eq.register_npc_event('ranger_1_5', Event.spawn,          336000, Golem_Spawn);
  eq.register_npc_event('ranger_1_5', Event.timer,          336000, Golem_Timer);
  eq.register_npc_event('ranger_1_5', Event.combat,         336230, Drag_Combat);  
end