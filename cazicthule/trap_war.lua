function event_combat(e)
if (e.joined == true) then
eq.spawn2(48076, 0, 0, 484, 818, -10, 385):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); --a_Tae_Ew_warrior (48076)
eq.spawn2(48076, 0, 0, 484, 818, -10, 385):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); --a_Tae_Ew_warrior (48076)
eq.depop_with_timer();
end
end
