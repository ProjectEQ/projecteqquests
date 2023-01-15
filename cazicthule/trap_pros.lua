function event_combat(e)
if (e.joined == true) then
eq.spawn2(48007, 0, 0, 115, 426, -10, 385):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); --a_Tae_Ew_proselyte (48007)
eq.spawn2(48007, 0, 0, 115, 426, -10, 385):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); --a_Tae_Ew_proselyte (48007)
eq.depop_with_timer();
end
end
