-- CHRMBrotherhood

function event_scale_calc(e)

    local playerrace = e.owner:GetRace();
    local playerclass = e.owner:GetClass();
    local group = e.owner:GetGroup();
    local member;
    local matchcount = 0;

    if(group) then
        for i = 1,6,1 do
            member = group:GetMember(i);
            if(member) then
                if((member:GetClass() == playerclass) or (member:GetRace() == playerrace)) then
                    matchcount = matchcount + 1
                end
            end
        end
    end

    e.self:SetScale(matchcount/5)

end
