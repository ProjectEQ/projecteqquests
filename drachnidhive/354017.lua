function event_combat(e)
if e.joined then
e.self:CastSpell(eq.ChooseRandom(7741,7743), e.self:GetID()); --explosive poison/deadly cloud
end
end

function event_cast(e)
eq.depop_with_timer(); --add function since spells have casting time and need to finish
end
