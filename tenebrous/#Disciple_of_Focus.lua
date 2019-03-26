function event_say(e)
    local qglobals = eq.get_qglobals(e.other);

    if (qglobals["mnk_epic20"] == "3") then
        if (e.message:findi("hail")) then
            e.self:Say("I see you have finally come. I have sensed someone with the I see you have finally come. I have sensed someone with the must know if this is the case. If so, you will [" .. eq.say_link("challenge") .. "] me.");
        elseif (e.message:findi("challenge")) then
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
        eq.set_timer("startcast", 1000);
    else
        eq.stop_all_timers();
    end
end

function event_timer(e)
    if (e.timer == "startcast") then
        e.self:CastSpell(3751, e.self:GetID()); -- Spell: Quivering Nightmares
        eq.stop_timer(e.timer);
        eq.set_timer("cast", 24000);
    elseif (e.timer == "cast") then
        e.self:CastSpell(3751, e.self:GetID()); -- Spell: Quivering Nightmares
    end
end

