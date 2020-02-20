-- 982: Cazic Touch (Death Touch)
function event_spell_effect(e)
    local casterMob = eq.get_entity_list():GetMobID(e.caster_id);
    if (casterMob and e.target:IsClient()) then
        local client = e.target:CastToClient();
        if (client) then
            casterMob:Shout(string.upper(client:GetCleanName()) .. "!");
        end
    end
end
