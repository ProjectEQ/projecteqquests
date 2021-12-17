-- #Inquisitor_Chiak_Tansk (297148)  ZMTZ event

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3000)
		eq.set_timer("aggrolink", 3 * 1000)
	else
		eq.stop_timer("OOBcheck")
		eq.stop_timer("aggrolink")
	end
end

function event_timer(e)
	if(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() < 1215 or e.self:GetY() > 106 or e.self:GetY() < -106) then
				e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 3 * 1000);
			end
	elseif (e.timer == "aggrolink") then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 297148 or npc:GetNPCTypeID() == 297149 or npc:GetNPCTypeID() == 297147 or npc:GetNPCTypeID() == 297150)) then
			npc:AddToHateList(e.self:GetHateRandom(),1); -- add ritualists , inquisitors, zmtz to aggro list if alive
		end
		end
	end
end
