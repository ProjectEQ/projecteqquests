function event_combat(e)
  if (e.joined == true) then
    local which = math.random(1,100);
    if  (which <= 5) then
	    eq.spawn2(174152, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); --Golden_Shroom (174152)
      eq.depop_with_timer();
    elseif (which > 5 and which <= 10) then
	    eq.spawn2(174151, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); --Fungi (174151)
      eq.depop_with_timer();
    elseif (which > 10) then
	    eq.spawn2(174150, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); --Fungi_Shroom (174150)
      eq.depop_with_timer();
    end
  end
end
