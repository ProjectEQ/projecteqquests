--301065 marshall
--301066 Grinbik_the_Fertile
--301067 an_enslaved_earthmover
--301068 an_eager_student
-- items: 62622

function Marshall_Combat(e)
	if e.joined then		
		eq.set_timer("adds",10*1000);
		local entity_list = eq.get_entity_list();
		local npc_list = entity_list:GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 301066 or  npc:GetNPCTypeID() == 301067 or  npc:GetNPCTypeID() == 301068)) then
				npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end			
	end
end

function Grinbik_Say(e)
	local qglobals = eq.get_qglobals(e.other);
	if qglobals["ranger_epic"] == "2" and e.other:HasItem(62844) then
		if(e.message:findi("hail")) then
			e.self:Emote("shouts Aaaah! A deep rumbling voice flows along the ground. I thank you, "..e.other:GetName()..". You have freed me from such torture! Imagine me, Grinbik the Fertile, forced to kill and destroy! I was created to nurture and protect! I must go back to my own home and begin again to be what I was ment to be. I am honored and grateful to you for saving me. I see that you carry a powerful seed, nearly a seedling with its desire to grow! As my first act upon regaining myself I must aid you. If you wish that seed to flourish, you must find the land here that remains fertile. It is a rare thing but I have seen it. Take with you my blessing. This is a portion of my own power and it will aid you and that seed. I also know that my cousin Senvial is a slave here somewhere. You will need his aid as well to achieve your goal. Deliver that seedling and our blessings into the fertile ground and it will grow very quickly indeed! Thank you again "..e.other:GetName().."! All present should praise you for your kind heart and warrior soul.");
			e.other:SummonItem(62622); -- Item: Grinbik's Blessing
			if(qglobals["ranger_bloodfield_chest"] == nil) then
				eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("ranger_bloodfield_chest","1",5,"F");		
			end
			eq.set_timer("depop",8*1000);
		end
	end
end

function Grinbik_Spawn(e)
	eq.set_next_hp_event(10);
end

function Grinbik_Timer(e)
	if(e.timer=="depop") then
		eq.depop();
	elseif(e.timer=="checkstatus") then
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(301065) then
			e.self:Emote("roots himself in the earth and struggles to retain control of his own mind.");
			e.self:SetSpecialAbility(19, 1);
			e.self:SetSpecialAbility(20, 1);
			e.self:SetSpecialAbility(24, 1);
			e.self:SetSpecialAbility(25, 1);
			e.self:WipeHateList();
			eq.stop_timer("checkstatus");
		end
	end
end

function Grinbik_HP(e)
  if (e.hp_event == 10) then
		eq.set_timer("checkstatus",7*1000);
  end 
end

function event_encounter_load(e)
  eq.register_npc_event('ranger_1_5', Event.combat,         301065, Marshall_Combat);  
  eq.register_npc_event('ranger_1_5', Event.say,	   	   	301066, Grinbik_Say);
  eq.register_npc_event('ranger_1_5', Event.spawn,          301066, Grinbik_Spawn);
  eq.register_npc_event('ranger_1_5', Event.hp,         	301066, Grinbik_HP);
  eq.register_npc_event('ranger_1_5', Event.timer,         	301066, Grinbik_Timer); 
end
