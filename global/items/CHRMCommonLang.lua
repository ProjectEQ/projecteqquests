-- CHRMCommonLang

-- Languages based on most commonly accepted responses here:
-- https://everquest.allakhazam.com/db/item.html?item=84244

function event_scale_calc(e)
    local lang_known = 0;
    if(e.owner:GetLanguageSkill(0) >= 100) then -- Common
        lang_known = lang_known + 1;
    end
    if(e.owner:GetLanguageSkill(1) >= 100) then -- Barbarian
        lang_known = lang_known + 1;
    end
    if(e.owner:GetLanguageSkill(2) >= 100) then -- Erudian
        lang_known = lang_known + 1;
    end
    if(e.owner:GetLanguageSkill(3) >= 100) then -- Elvish
        lang_known = lang_known + 1;
    end
    if(e.owner:GetLanguageSkill(4) >= 100) then -- Dark Elvish
        lang_known = lang_known + 1;
    end
    if(e.owner:GetLanguageSkill(5) >= 100) then -- Dwarvish
        lang_known = lang_known + 1;
    end
    if(e.owner:GetLanguageSkill(6) >= 100) then -- Troll
        lang_known = lang_known + 1;
    end
    if(e.owner:GetLanguageSkill(7) >= 100) then -- Ogre
        lang_known = lang_known + 1;
    end
    if(e.owner:GetLanguageSkill(8) >= 100) then -- Gnomish
        lang_known = lang_known + 1;
    end
    if(e.owner:GetLanguageSkill(9) >= 100) then -- Halfling
        lang_known = lang_known + 1;
    end
    if(e.owner:GetLanguageSkill(13) >= 100) then -- Froglok
        lang_known = lang_known + 1;
    end
    if(e.owner:GetLanguageSkill(24) >= 100) then -- Vashir
        lang_known = lang_known + 1;
    end

    e.self:SetScale(lang_known / 12);
end
