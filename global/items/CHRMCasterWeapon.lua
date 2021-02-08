-- CHRMCasterWeapon
-- Array: Class,Skill,Max_Skill
-- Classes: Necromancer(11), Wizard(12), Magician(13), Enchanter(14)
-- Skill_ID: 1HB(0), 2HB(2), Piercing(36), Throwing(51)

function event_scale_calc(e)

    local max_skills = 0;
    local total_count = 0;

    local skill_matrix = {   [1] = {11,0,120},
                             [2] = {11,2,120},
                             [3] = {11,36,120},
                             [4] = {11,51,80},
                             [5] = {12,0,110},
                             [6] = {12,2,110},
                             [7] = {12,36,110},
                             [8] = {12,51,75},
                             [9] = {13,0,120},
                             [10] = {13,2,120},
                             [11] = {13,36,120},
                             [12] = {13,51,75},
                             [13] = {14,0,120},
                             [14] = {14,2,120},
                             [15] = {14,36,120},
                             [16] = {14,51,80}
    }

    for id, v in pairs(skill_matrix) do
        if ( e.owner:GetClass() == v[1]) then
            if(e.owner:GetSkill(v[2]) >= v[3]) then
                max_skills = max_skills + 1;
            end
            total_count = total_count + 1;
        end
    end

    if(total_count <= 0) then
        total_count = 0.1; -- to avoid NAN
    end

    e.self:SetScale(max_skills / total_count);
end