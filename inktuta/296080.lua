--stonemites roaming traps

function event_combat(e)
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"Stonemites drop from a crack in the ceiling and lunge forth to attack!");
	local rand = math.random(1,10);
	if  rand == 1 then
		--tameable stonemites seem rare
		pick = math.random(1,6);
		for n = 1,pick do
			eq.spawn2(296082,537952,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());	--a_tameable_stonemite
		end
		eq.depop_with_timer();
	elseif rand < 6 and rand > 1 then
		--mutated stonemites
		pick = math.random(1,6);
		for n = 1,pick do
			eq.spawn2(296038,537952,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());	--a_mutated_stonemite
		end
		eq.depop_with_timer();
	elseif rand >= 6 then
		--ancient stonemites
		pick = math.random(1,6);
		for n = 1,pick do
			eq.spawn2(296044,537952,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());	-- an_ancient_stonemite
		end
		eq.depop_with_timer();
	end
end
