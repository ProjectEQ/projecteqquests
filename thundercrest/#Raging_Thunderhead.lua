function event_signal(e)
if (e.signal==1) then
e.self:SetSpecialAbility(24, 0);
e.self:SetSpecialAbility(35, 0);
end
end

function event_spawn(e)
eq.zone_emote(15,"A storm rages to the west, building up strength as it devours lesser storms.");
end
