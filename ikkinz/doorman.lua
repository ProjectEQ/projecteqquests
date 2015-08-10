local instance_id = nil;
function event_spawn(e)
  instance_id = eq.get_zone_instance_id();
  eq.set_proximity(e.self:GetX()-30, e.self:GetX()+30, e.self:GetY()-30, e.self:GetY()+30);
end

function event_enter(e)
  e.other:MovePCInstance(294, instance_id, -157, 23, -2.87, 0.0);
end
