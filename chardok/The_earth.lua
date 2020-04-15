function event_spawn(e)
eq.set_proximity(e.self:GetX() - 30, e.self:GetX() + 30, e.self:GetY() - 30, e.self:GetY() + 30);
end

function event_enter(e)
e.self:Emote("at your feet erupts.");
eq.spawn2(103093, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: a_Reanimated_Berserker
eq.depop_with_timer();
end
