function event_spawn(e)
eq.spawn2(282120, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
eq.spawn2(282121, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
--spawn 2 guard dogs
--no indents
end

function event_signal(e)
if(e.signal == 1) then
eq.spawn2(282120, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
--repop doggo numero uno
elseif(e.signal == 2) then
eq.spawn2(282121, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
--repop doggo numero dos
end
end
