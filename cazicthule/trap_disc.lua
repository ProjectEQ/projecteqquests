function event_combat(e)
if (e.joined == true) then
eq.spawn2(48026, 0, 0, 119, 345, -10, 385):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); --a_Tae_Ew_disciple (48026)
eq.spawn2(48026, 0, 0, 119, 345, -10, 385):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); --a_Tae_Ew_disciple (48026)
eq.depop_with_timer();
end
end
