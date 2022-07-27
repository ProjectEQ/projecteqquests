function event_spawn(e)
  eq.set_timer("mezcheck", 5 * 1000);
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3 * 1000);	
	else
		eq.stop_timer("OOBcheck");
	end
end

function event_timer(e)
if(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() < 200 or e.self:GetX() > 500 or e.self:GetY() > -30 or e.self:GetY() < -250) then
				e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 3 * 1000);
			end
elseif(e.timer=="mezcheck") then
  local hp = e.self:GetMaxHP() * .15;
  if (e.self:IsMezzed()) then
    if ( (e.self:GetHP() - hp ) > 0 ) then 
      e.self:SetHP( e.self:GetHP() - hp );
	e.self:Emote("groans as the incapacitation siphons energy from it.");
    else
	eq.spawn2(294137,0,0,e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
      --eq.spawn2(294137,0,0,418.5914,-179.3205,10.502,384); -- NPC: Dire_Illusion
	eq.depop();
    end
  end
end
end




function event_death_complete(e)
	local el = eq.get_entity_list();
	
	if (el:IsMobSpawnedByNpcTypeID(294043) == true) then --Diabolic_Destroyer (294043)
		eq.spawn2(294137,0,0,e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
		--check for DD, respawn if DD up 
	end
end
