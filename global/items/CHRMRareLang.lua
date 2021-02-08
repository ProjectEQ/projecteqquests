-- CHRMRareLang

function event_scale_calc(e)

    local languages = 0;

    for i = 11,22,1 do
        if (e.owner:GetLanguageSkill(i) == 100) then
            languages = languages + 1;
        end
    end

    e.self:SetScale(languages/12);
end