function event_say(e)
    local qglobals = eq.get_qglobals(e.other);

    if (qglobals["mnk_epic20"] == "3") then
        if (e.message:findi("hail")) then
            e.self:Say("I see you bear the Sign of the Order. I already know why you are here, " .. e.other:GetName() .. ". If it is my seal you wish to obtain you must [" .. eq.say_link("battle") .. "] me.");
        elseif (e.message:findi("battle")) then
            e.self:Say("Prepare yourself then " .. e.other:GetName() .. ", for this will not be a battle you will want to lose.");
            e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
            e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
            e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
            eq.attack(e.other:GetName());
        end
    end
end

function event_combat(e)
    if (e.joined == true) then
        eq.set_timer("start_strike", 1000);
        eq.set_timer("start_blinding", 2000);
    else
        eq.stop_all_timers();
    end
end

function event_timer(e)
    if (e.timer == "start_strike") then
        if (e.self:GetTarget().valid) then
            e.self:CastSpell(3168, e.self:GetTarget():GetID()); -- Spell: Strike of the Champion
        end
        eq.stop_timer(e.timer);
        eq.set_timer("cast_strike", 45000);
    elseif (e.timer == "start_blinding") then
        if (e.self:GetTarget().valid) then
            e.self:CastSpell(3166, e.self:GetTarget():GetID()); -- Spell: Blinding Essence of Purity
        end
        eq.stop_timer(e.timer);
        eq.set_timer("cast_blinding", 60000);
    elseif (e.timer == "cast_strike") then
        if (e.self:GetTarget().valid) then
            e.self:CastSpell(3168, e.self:GetTarget():GetID()); -- Spell: Strike of the Champion
        end
    elseif (e.timer == "cast_blinding") then
        if (e.self:GetTarget().valid) then
            e.self:CastSpell(3166, e.self:GetTarget():GetID()); -- Spell: Blinding Essence of Purity
        end
    end
end

