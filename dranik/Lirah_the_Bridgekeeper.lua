function event_spawn(e)
	eq.set_timer("spawnevent", 3 * 1000);
end

function event_timer(e)
	if (e.timer == "spawnevent") then
		eq.stop_timer("spawnevent");
    eq.unique_spawn(336011, 0, 0, 821,457,133,250);
    --a_Dragorn_Protector (336011)

    eq.unique_spawn(336129, 0, 0, 789,457,133,250);
    --a_Dragorn_Protector (336129)

	elseif (e.timer == "addone") then
    eq.stop_timer("addone");
    e.self:Emote("roars for assistance, and a response echoes shortly thereafter as help is on the way.");
    eq.unique_spawn(336011, 0, 0, 753,937,147,250);
    --a_Dragorn_Protector (336011) 
	elseif (e.timer == "addtwo") then
    eq.stop_timer("addtwo");
    e.self:Emote("roars for assistance, and a response echoes shortly thereafter as help is on the way.");
    eq.unique_spawn(336129, 0, 0, 753,937,147,250);
    --a_Dragorn_Protector (336129)
  elseif (e.timer == "aggrolink") then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 336129 or npc:GetNPCTypeID() == 336011)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
		end
		end
	elseif (e.timer == "checkadds") then
		eq.stop_timer("checkadds");
		  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(336011) then
        e.self:Emote("roars for assistance, and a response echoes shortly thereafter as help is on the way.");
        eq.unique_spawn(336011, 0, 0, 753,937,147,250);
		  end
		  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(336129) then
        e.self:Emote("roars for assistance, and a response echoes shortly thereafter as help is on the way.");
        eq.unique_spawn(336129, 0, 0, 753,937,147,250);
		  end
  end
end

function event_signal(e)
  if(e.signal == 1) then
    eq.set_timer("addone", 60 * 1000);
  elseif(e.signal == 2) then
    eq.set_timer("addtwo", 60 * 1000);
  end
end

function event_combat(e)
  if e.joined then
    eq.set_timer("aggrolink", 3 * 1000);
    eq.set_timer("checkadds", 5 * 1000);
  else
    eq.stop_timer("aggrolink");
    eq.stop_timer("checkadds");
  end
end
