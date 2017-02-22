function event_death_complete(e)
	eq.spawn2(20300,0,0, e.self:GetX()+7,e.self:GetY()+7,e.self:GetZ(),0);
	eq.spawn2(20300,0,0, e.self:GetX(),e.self:GetY()+7,e.self:GetZ(),0);
	eq.spawn2(20300,0,0, e.self:GetX()+7,e.self:GetY(),e.self:GetZ(),0);
	eq.spawn2(20300,0,0, e.self:GetX()-7,e.self:GetY()-7,e.self:GetZ(),0);
	eq.spawn2(20300,0,0, e.self:GetX()-7,e.self:GetY(),e.self:GetZ(),0);
	eq.spawn2(20300,0,0, e.self:GetX(),e.self:GetY()-7,e.self:GetZ(),0);
	eq.spawn2(20300,0,0, e.self:GetX()+7,e.self:GetY()-7,e.self:GetZ(),0);
	eq.spawn2(20300,0,0, e.self:GetX()-7,e.self:GetY()+7,e.self:GetZ(),0);
	eq.spawn2(20300,0,0, e.self:GetX()+14,e.self:GetY()+14,e.self:GetZ(),0);
	eq.spawn2(20300,0,0, e.self:GetX()-14,e.self:GetY()-14,e.self:GetZ(),0);
end