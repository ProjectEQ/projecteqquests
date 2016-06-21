function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 20, e.self:GetX() + 20, e.self:GetY() - 20, e.self:GetY() + 20);
end
 
function event_enter(e)
	eq.spawn2(164122, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
	eq.depop();
end
