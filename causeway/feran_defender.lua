function event_combat(e)
  if e.joined then
    eq.set_timer("howl", 5 * 1000);
  else
    eq.stop_timer("howl");
  end
end

function event_timer(e)
  if (e.timer == "howl") then
    eq.stop_timer("howl");
    local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 303071 or npc:GetNPCTypeID() == 303072 or npc:GetNPCTypeID() == 303074)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end	
    --e.self:Emote("howls for assistance!"); these dont emote
    eq.set_timer("howl", 5 * 1000);
  end
end
