-- CHRMCommonLang

-- Languages based on most commonly accepted responses here:
-- https://everquest.allakhazam.com/db/item.html?item=84244

function event_scale_calc(e)
    local lang_known = 0;
    local languages = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 13, 24 };
    for i, v in ipairs(languages) do 
        if (e.owner:GetLanguageSkill(v) >= 100) then
            lang_known = lang_known + 1;
        end
    end
    e.self:SetScale(lang_known / 12);
end
