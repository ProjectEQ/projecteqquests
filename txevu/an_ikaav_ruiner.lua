function event_death(e)
e.self:CastSpell(1387, e.self:GetID()); -- Spell: Fulmination
end

function event_spawn(e)
eq.zone_emote(0,"Checkity check");
end
