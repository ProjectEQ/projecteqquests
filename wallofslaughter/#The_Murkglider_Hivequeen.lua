function event_combat(e)
	if(e.joined) then
		eq.set_timer("adds", 40 * 1000);
		eq.set_timer("hate", 5 * 1000); -- check for adds
	else
		eq.stop_timer("adds");
		eq.stop_timer("hate");
	end
end

function event_timer(e)
	if (e.timer == "adds") then
		e.self:Emote("spews several slimy eggs unto the ground.  They begin to quiver almost immediately.");
		eq.spawn2(300083, 0, 0, e.self:GetX(),e.self:GetY()-5,e.self:GetZ()+5,0);
		eq.spawn2(300083, 0, 0, e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ()+5,0);
		eq.spawn2(300083, 0, 0, e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ()+5,0);
elseif(e.timer=="hate") then
    
    local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 300084 or npc:GetNPCTypeID() == 300035)) then
			npc:AddToHateList(e.self:GetHateRandom(),1); -- add a_murk_hatchling (300084) and a_murkglider_attendant (300035) to aggro list if alive
		end
		end
end
end
