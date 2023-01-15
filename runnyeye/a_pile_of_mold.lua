function event_combat(e)
    e.self:Emote("erupts in a cloud of spores!");
    
    local spawns = math.random(1,5);
	  for n = 1, spawns do
		mob = eq.spawn2(11164,0,0,e.self:GetX() + math.random (-5,5), e.self:GetY() + math.random(-5,5), e.self:GetZ(), e.self:GetHeading());	-- a_sporeling (11164)
      
    eq.depop_with_timer();
  end
end
