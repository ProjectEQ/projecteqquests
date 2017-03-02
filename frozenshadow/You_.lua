function event_spawn(e)
  eq.set_timer('delay', 2000);
end

function event_timer(e)
  eq.stop_timer('delay');
  eq.set_proximity(e.self:GetX()-15, e.self:GetX()+15, e.self:GetY()-15, e.self:GetY()+15);
  eq.enable_proximity_say();
end

function event_proximity_say(e)
  local client_globals = eq.get_qglobals(e.other)
  local mnk_pre = tonumber(client_globals["MnkPre"]);
  if (mnk_pre == nil) then mnk_pre = 0; end
    
  if (mnk_pre == 2) then
    if (e.message:findi("I am ready to be tested")) then
      eq.spawn2(111190, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
      eq.depop_with_timer();
    end
  end
end
