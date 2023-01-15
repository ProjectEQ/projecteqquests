--Ikkinz Raid #1: Chambers of Righteousness   

function event_signal(e)
if (e.signal == 1) then --guardian of righteousness died
eq.spawn2(294576, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- #Crumbling_Monolith
eq.depop();
end
end
