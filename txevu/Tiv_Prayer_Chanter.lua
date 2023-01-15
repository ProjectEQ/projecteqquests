function event_spawn(e)
	eq.set_timer("dostuff", 5 * 1000);
	eq.set_timer("dostufftwo", 10 * 1000);
end

function event_timer(e)
if (e.timer == "dostuff") then
eq.stop_timer("dostuff");
	local rand = math.random(1,4);
		if (rand == 1) then
		  e.self:SetSpecialAbility(16, 0); --turn off snare immunity
	  end
elseif (e.timer == "dostufftwo") then
eq.stop_timer("dostufftwo");
  local pick = math.random(1,3);
		if (pick == 1) then
		  e.self:RemoveAISpell(4489);
			eq.debug("remove Taelosian vengeance");
		elseif (pick == 2) then
		  e.self:RemoveAISpell(4494);
			eq.debug("remove geotension");
		elseif (pick == 3) then
		  e.self:RemoveAISpell(4495);
			eq.debug("remove clinging mud");
	  end
end
end
