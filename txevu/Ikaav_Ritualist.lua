--  Ikaav_Ritualist (297147) zmtz event

function event_signal(e)
  eq.set_timer('wipe_agro', 5 * 1000);
end

function event_timer(e)
	if (e.timer == 'wipe_agro') then
  		eq.stop_timer(e.timer);
  		e.self:WipeHateList();
	elseif (e.timer == "aggrolink") then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 297148 or npc:GetNPCTypeID() == 297149 or npc:GetNPCTypeID() == 297147 or npc:GetNPCTypeID() == 297150)) then
			npc:AddToHateList(e.self:GetHateRandom(),1); -- add ritualists, inquisitors, zmtz  to aggro list if alive
		end
		end
	end
end

function event_death_complete(e)
	--tell ZMTZ I died, spawn adds slower
	eq.signal(297150, 297147); -- NPC: #Zun`Muram_Tkarish_Zyk
end

function event_combat(e)
  if (e.joined) then
    	eq.set_timer("aggrolink", 3 * 1000)
	else
	eq.stop_timer("aggrolink");
  end
end
