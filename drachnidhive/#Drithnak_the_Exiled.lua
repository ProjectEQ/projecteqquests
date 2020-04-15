function event_combat(e)
if (e.joined == true) then
eq.set_timer("eggs", eq.ChooseRandom(45,65) * 1000);
eq.set_timer("OOBcheck", 6 * 1000);
eq.set_timer("agro", 6 * 1000);
else
eq.stop_timer("eggs");
eq.stop_timer("OOBcheck");
eq.stop_timer("agro");
end
end

function event_timer(e)
if(e.timer == "OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetX() < 1073 or e.self:GetY() >424) then
		eq.depop_all(354109);
		eq.depop_all(354110);
		e.self:SetHP(e.self:GetMaxHP());
		e.self:GotoBind();
		e.self:WipeHateList();
		eq.get_entity_list():MessageClose(e.self, false, 200, 15, "You see Drithnak fleeing the battle as he retreats to the confines of his quarters!");
	else
		eq.set_timer("OOBcheck", 6 * 1000);
	end
elseif(e.timer == "eggs") then
eq.spawn2(354109, 0, 0, e.self:GetX()+5, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_drachnid_egg_sac
eq.spawn2(354109, 0, 0, e.self:GetX()-5, e.self:GetY()-5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_drachnid_egg_sac
eq.spawn2(354109, 0, 0, e.self:GetX()+7, e.self:GetY()-7,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_drachnid_egg_sac
eq.get_entity_list():MessageClose(e.self, false, 200, 15, "The ground begins to tremble as you clutch your throat");
elseif (e.timer == "agro") then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and (npc:GetNPCTypeID() == 354110)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
		end
		end	
end
end
