function event_spawn(e)
eq.set_next_hp_event(95);
end

function event_hp(e)
if(e.hp_event == 95) then
eq.get_entity_list():FindDoor(12):SetLockPick(-1);
eq.get_entity_list():FindDoor(13):SetLockPick(-1);
eq.get_entity_list():MessageClose(e.self, false, 200, MT.Yellow, "The room begins to tremble as you see the doors closing behind you.");
eq.set_next_hp_event(90);
elseif (e.hp_event == 90) then
eq.get_entity_list():MessageClose(e.self, false, 200, MT.Yellow, "You look upward as an unfamiliar smell fills the now sealed room.");
eq.spawn2(347088, 0, 0, 929, -826, 163, 193); -- NPC: a_spider_egg
eq.spawn2(347088, 0, 0, 826, -691, 163, 193); -- NPC: a_spider_egg
eq.spawn2(347088, 0, 0, 645, -744, 163, 193); -- NPC: a_spider_egg
eq.spawn2(347088, 0, 0, 656, -952, 163, 193); -- NPC: a_spider_egg
eq.spawn2(347088, 0, 0, 770, -1045, 163, 193); -- NPC: a_spider_egg
eq.spawn2(347088, 0, 0, 848, -977, 163, 193); -- NPC: a_spider_egg
eq.spawn2(347088, 0, 0, 567, -880, 163, 193); -- NPC: a_spider_egg
eq.set_next_hp_event(85);
elseif (e.hp_event == 85) then
eq.spawn_condition("illsalin",0,1,1);
eq.set_next_hp_event(55);
elseif (e.hp_event == 55) then
e.self:Shout("'Fools! Who are you to challenge I?' as you notice the drachnid eggs erupting on the ledge.");
eq.set_next_hp_event(20);
elseif (e.hp_event == 20) then
eq.get_entity_list():MessageClose(e.self, false, 200, MT.Yellow, "Ritesmaster Verok realizes that the enemy force is stronger than he had ever anticipated. 'I will destroy you yet, foul creatures. This is only the beginning.'");
eq.signal(347088,2); -- NPC: a_spider_egg
end
end

function event_combat(e)
if e.joined then
eq.set_timer("OOBcheck", 6 * 1000);
eq.set_timer("aggro", 5 * 1000);
else
eq.stop_timer("OOBcheck");
eq.stop_timer("aggro");
eq.set_timer("eventreset", 18 * 1000);
end
end

function event_death_complete(e)
eq.get_entity_list():FindDoor(12):SetLockPick(0);
eq.get_entity_list():FindDoor(13):SetLockPick(0);
eq.depop_all(347088);
eq.depop_all(347033);
eq.depop_all(347009);
eq.spawn_condition("illsalin",0,1,0);
end

function event_timer(e)
  if(e.timer=="OOBcheck") then
    eq.stop_timer("OOBcheck");
	    if (e.self:GetX() < 573 or e.self:GetY() < -1029) then
		    eq.depop_all(347088);
		    eq.depop_all(347033);
		    eq.depop_all(347009);
		    e.self:SetHP(e.self:GetMaxHP());
		    e.self:GotoBind();
		    e.self:WipeHateList();
		    eq.set_next_hp_event(95);
		    eq.get_entity_list():FindDoor(12):SetLockPick(0);
		    eq.get_entity_list():FindDoor(13):SetLockPick(0);
		    eq.get_entity_list():MessageClose(e.self, false, 120, MT.BrightBlue, "You see Verok fleeing the battle as he retreats to the confines of his quarters!");
				eq.spawn_condition("illsalin",0,1,0);
	    else
		    eq.set_timer("OOBcheck", 6 * 1000);
	    end
   elseif(e.timer=="eventreset") then
     eq.stop_timer("eventreset");
     eq.depop_all(347088);
     eq.depop_all(347033);
     eq.depop_all(347009);
     e.self:SetHP(e.self:GetMaxHP());
     e.self:GotoBind();
     eq.set_next_hp_event(95);
     eq.get_entity_list():FindDoor(12):SetLockPick(0);
     eq.get_entity_list():FindDoor(13):SetLockPick(0);
		 eq.spawn_condition("illsalin",0,1,0);
	elseif (e.timer == "aggro") then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 347033 or npc:GetNPCTypeID() == 347009)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end	
  end
end
