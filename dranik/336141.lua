function event_spawn(e)
    e.self:SetPseudoRoot(true);
    eq.set_next_hp_event(85);
end

function event_hp(e)
    if (e.hp_event == 85) then
        e.self:SetPseudoRoot(false);
        eq.stop_timer("terror");
        eq.set_next_inc_hp_event(99);
    elseif (e.inc_hp_event == 99) then -- not sure on how to reset ... probably should :P
        e.self:GotoBind();
        e.self:SetPseudoRoot(true);
        eq.set_next_hp_event(85);
    end
end

function CastTerror(self)
    local client_list = eq.get_entity_list():GetClientList();

    for client in client_list.entries do
        if (client.valid and self:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) <= 120) then
            self:SpellFinished(5821, client); -- Zun`Muram's Terror
            eq.debug("Terror on: " .. client:GetName());
        end
    end
end

function event_timer(e)
    if (e.timer == "terror") then
        CastTerror(e.self);
    end
end

function event_combat(e)
    if (e.joined == true and e.self:GetHPRatio() > 85) then
        eq.set_timer("terror", 5000); -- every 5 seconds
        CastTerror(e.self);
    else
        eq.stop_timer("terror");
    end
end

