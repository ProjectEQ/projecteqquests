function event_slay(e)
	if e.other:IsClient() or e.other:IsPet() then -- not sure why this is necessary, but otherwise will occasionally spawn adds when an event mob dies
		local x,y,z,h = e.other:GetX(), e.other:GetY(), e.other:GetZ(), e.other:GetHeading();
		eq.spawn2(eq.ChooseRandom(292043,292044,292045,292046,292047,292048,292049,292050),0,0,x,y,z,h); -- NPC(s): #a_coercing_spirit (292043), #a_malevolent_spirit (292044), #a_slighted_spirit (292045), #a_spiteful_spirit (292046), #a_vengeful_spirit (292047), #a_vindictive_spirit (292048), #an_avenging_spirit (292049), #an_infuriated_spirit (292050)
	end
end

-- mods enthralled destroyer/noc bloodluster
function event_spawn(e)
	e.self:ModSkillDmgTaken(0, 25); -- 1h blunt
	e.self:ModSkillDmgTaken(2, 25); -- 2h blunt
	e.self:ModSkillDmgTaken(1, -25); -- 1h slashing
	e.self:ModSkillDmgTaken(3, -25); -- 2h slashing
	e.self:ModSkillDmgTaken(7, -25); -- archery
end
