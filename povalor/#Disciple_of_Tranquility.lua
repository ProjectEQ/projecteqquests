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
