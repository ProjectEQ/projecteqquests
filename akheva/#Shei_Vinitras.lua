function event_spawn(e)
  eq.set_timer('Depop', 600 * 1000);
end

function event_combat(e)
  if (e.joined == true) then
    eq.stop_timer('Depop');
	eq.set_timer('repopadds', 300 * 1000);
  else
    eq.set_timer('Depop', 600 * 1000);
	eq.stop_timer('repopadds');
  end
end

function event_timer(e)
	if (e.timer == 'Depop') then
		eq.depop();
	elseif (e.timer == 'repopadds') then
		e.self:Say("Sivuelaeus Rulour ans Rashan!");
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(179174) == false) then -- NPC: #Diabo_Tatrua
				eq.spawn2(179174,0,0,-1769,1038,17.13,126):AddToHateList(e.self:GetHateRandom(),1);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(179181) == false) then -- NPC: #Tavuel_Tatrua
				eq.spawn2(179181,0,0,-1769,1056,17.13,126):AddToHateList(e.self:GetHateRandom(),1);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(179164) == false) then -- NPC: #Thall_Tatrua
				eq.spawn2(179164,0,0,-1769,1084,17.42,126):AddToHateList(e.self:GetHateRandom(),1);
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(179173) == false) then -- NPC: #Va_Tatrua
				eq.spawn2(179173,0,0,-1769,1116,17.13,126):AddToHateList(e.self:GetHateRandom(),1);
			end
	end
end

function event_slay(e)
	local a = eq.ChooseRandom(179161,179147,179160,179142);

	eq.spawn2(a,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end
