-- CHRMCasterWeapon
-- Array: Class,Skill,Max_Skill
-- Classes: Necromancer(11), Wizard(12), Magician(13), Enchanter(14)
-- Skill_ID: 1HB(0), 2HB(2), Piercing(36), Throwing(51)

function event_scale_calc(e)
    local max_skills	= 0;
    local total_count	= 0;

    local skill_matrix = {   [1] = {Class.NECROMANCER,0,120},
                             [2] = {Class.NECROMANCER,2,120},
                             [3] = {Class.NECROMANCER,36,120},
                             [4] = {Class.NECROMANCER,51,80},
                             [5] = {Class.WIZARD,0,110},
                             [6] = {Class.WIZARD,2,110},
                             [7] = {Class.WIZARD,36,110},
                             [8] = {Class.WIZARD,51,75},
                             [9] = {Class.MAGICIAN,0,120},
                             [10] = {Class.MAGICIAN,2,120},
                             [11] = {Class.MAGICIAN,36,120},
                             [12] = {Class.MAGICIAN,51,75},
                             [13] = {Class.ENCHANTER,0,120},
                             [14] = {Class.ENCHANTER,2,120},
                             [15] = {Class.ENCHANTER,36,120},
                             [16] = {Class.ENCHANTER,51,80}
    }

    for id, v in pairs(skill_matrix) do
        if e.owner:GetClass() == v[1] then
            if e.owner:GetSkill(v[2]) >= v[3] then
                max_skills = max_skills + 1;
            end
            total_count = total_count + 1;
        end
    end

    if total_count <= 0 then
        total_count = 0.1; -- to avoid NAN
    end

    e.self:SetScale(max_skills / total_count);
end