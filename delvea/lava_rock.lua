local added_loot = false;

function event_death(e)
	added_loot = false;
	local roll = math.random(100)
	
	if (roll >= 50) then
    		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 15, 70,"You hear a loud screech as something breaks free of the stone.");
		eq.spawn2(eq.ChooseRandom(341091,341085,341092,341087),0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC(s): a_Delve_spellbinder (341091), a_Delve_diviner (341085), a_Delve_evoker (341092), a_Delve_drake (341087)
	else
		if (not added_loot) then
			added_loot = true;
    			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 15, 70,"You feel a blast of heat as you open the rock and see a dark stone inside.");
    			e.self:AddItem(56023,1); -- Calcified Lava Rock
		end
		
	end
end
