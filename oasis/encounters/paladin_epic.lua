-- items: 69982
local event_starter;
local event_started=false;
local num_wave=0;
local event_won=false;

function Keelee_Spawn(e)
	event_started=false;
	num_wave=0;
	event_won=false;
end

function Keelee_Say(e)
	if(e.other:HasItem(69953)) then
		if(e.message:findi("hail") and event_started==false and event_won==false) then
			e.self:Say(e.other:GetName() .. "!! Watch out, there are aggressive orcs here! Be careful. . .Aiiiieeeeeeeeee");
			event_starter=eq.get_entity_list():GetClientByID(e.other:GetID());
			event_started=true;
			event_won=false
			num_wave=0;
			eq.spawn2(37162, 0, 0,1304.8,1478.7,4.6,452); --##Remal_the_Black (37162) UNTARGETABLE
			eq.set_timer("spawn_wave",1000);
			eq.set_timer("banish",3000);
		end
		if(e.message:findi("hail") and event_started==true and event_won==true and e.other:GetID()==event_starter:GetID()) then
			e.other:SummonItem(69982); -- Item: Keelee's Brooch
			e.self:Say(e.other:GetName() .. "! You are my savior. Thank you very much for saving me. Here is my Brooch, take it as a symbol of friendship from me to you. I need to depart. I still have some collecting to do.");
			local qglobals = eq.get_qglobals(e.other);
			if(qglobals["pal_chest_keel"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 2.0)
				eq.set_global("pal_chest_keel","1",5,"F");
			end
			eq.depop_with_timer();
		end
	end
end

function Keelee_Timer(e)
	if e.timer=="spawn_wave" then
		if num_wave < 4 then
			num_wave=num_wave+1
			eq.spawn2(37160, 0, 0,1342.6,1507.6,4.6,298); --#an_orc (37160)
			eq.spawn2(37160, 0, 0,1347.6,1429.77,4.6,448); --#an_orc (37160)
			eq.spawn2(37160, 0, 0,1283.6,1416,4.6,64); --#an_orc (37160)
			eq.spawn2(37160, 0, 0,1287,1498.4,11,190); --#an_orc (37160)
			eq.set_timer("spawn_wave",120*1000);
		else
			--if no #an_orc, next phase
			if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(37160) == false) then
				eq.depop(37162);
				eq.zone_emote(15,"A mystical portal is formed. Keelee and Remal dissappear.");
				e.self:Shout("Help me, I'm at some orc camp, help please!");
				e.self:GMMove(-690.6 ,-1825, 5.55, 48);
				eq.spawn2(37161,0,0,-704.5,-1835,6,52); --#Remal_the_Black (37161)
				eq.set_timer("depop",60*60*1000);
				eq.stop_timer("banish");
				eq.stop_timer("spawn_wave");
			else
			--lost, depop it all
				eq.set_timer("depop",1000);
			end
		end
	elseif e.timer=="banish" then
		local now_clients = eq.get_entity_list():GetClientList();
		for client in now_clients.entries do
			if (client.valid and e.self:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) <=300 and client:GetID()~=event_starter:GetID()) then	
				client:MovePC(37, -956,725,50,120); -- Zone: oasis
				client:Message(15,"Foolish adventurer, do not interfere with this ritual!");
			end
		end
	elseif e.timer=="depop" then
		eq.depop_all(37160);
		eq.depop_all(37161);
		eq.depop_all(37162);
		eq.depop_with_timer();
	end
end

function Remal_Death(e)
	event_won=true;
end

function event_encounter_load(e)
  eq.register_npc_event('paladin_epic', Event.say, 37152, Keelee_Say); --#Keelee_Rayin (37152)
  eq.register_npc_event('paladin_epic', Event.timer, 37152, Keelee_Timer); --#Keelee_Rayin (37152)
  eq.register_npc_event('paladin_epic', Event.spawn, 37152, Keelee_Spawn); --#Keelee_Rayin (37152
  eq.register_npc_event('paladin_epic', Event.death, 37161, Remal_Death); --#Keelee_Rayin (37152)
 end
