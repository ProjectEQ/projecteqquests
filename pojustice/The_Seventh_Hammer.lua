function event_combat(e)
  if e.joined then
	eq.set_timer("tremor", 10 * 1000);
	eq.set_timer("verdict", 85 * 1000);
  end
end

--tribunal 201077
function event_timer(e)
	if(e.timer=="tremor") then
		eq.stop_timer("tremor");
		e.self:CastSpell(1107, e.self:GetTarget():GetID()); -- Spell: Tremor of Judgment
		local npc = eq.get_entity_list():GetMobByNpcTypeID(201077);	
		   if (npc.valid) then
			  if ( npc:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) < 200) then			
				 eq.signal(201077, 1); -- NPC: #The_Tribunal
			  end
		   end
		eq.set_timer("tremor", 150 * 1000);
	elseif(e.timer=="verdict") then
		eq.stop_timer("verdict");
		e.self:CastSpell(1108, e.self:GetTarget():GetID()); -- Spell: Verdict of Eternity
		local npc = eq.get_entity_list():GetMobByNpcTypeID(201077);
		   if (npc.valid) then
			  if ( npc:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) < 200) then
				 eq.signal(201077, 1); -- NPC: #The_Tribunal
			  end
		   end
		eq.set_timer("verdict", 150 * 1000);
	elseif(e.timer=="depop") then
		eq.depop();
	end
end

--for triggered version
function event_signal(e)
   if (e.signal == 999) then
	 e.self:ClearItemList();
	 e.self:AddItem(48113,1);
	 eq.set_timer("depop", 2700 * 1000);
   end
end