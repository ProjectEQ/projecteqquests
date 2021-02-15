function event_combat(e)
if (e.joined == true) then
eq.spawn2(48047, 0, 0, 484, 818, -10, 385):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); --a_Tae_Ew_defender (48047)
eq.spawn2(48047, 0, 0, 484, 818, -10, 385):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true); --a_Tae_Ew_defender (48047)
eq.depop_with_timer();
end
end
