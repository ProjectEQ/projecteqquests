function event_combat(e)
if e.joined then
eq.set_timer("howl", 10 * 1000);
else
eq.stop_timer("howl");
end
end

function event_timer(e)
  if (e.timer == "howl") then
    eq.stop_timer("howl");
    local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 303071 or npc:GetNPCTypeID() == 303072)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end	
    e.self:Emote("howls for assistance!");
    eq.set_timer("howl", 15 * 1000);
  end
end
