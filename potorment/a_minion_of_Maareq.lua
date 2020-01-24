-- Drogerin ##

function event_spawn(e)
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
	eq.set_timer("attach", 1000);
end

function event_timer(e)
    if e.timer == "attach" then
        maareq = eq.get_entity_list():GetMobByNpcTypeID(207004);    --Maareq_the_Prophet (207004)
        e.self:CastToNPC():MoveTo(maareq:GetX(), maareq:GetY(), maareq:GetZ(),maareq:GetHeading(),true);
    end
end
