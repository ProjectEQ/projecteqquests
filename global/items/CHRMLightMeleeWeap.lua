-- CHRMLightMeleeWeap
-- Array: Class,Skill,Max_Skill
-- Classes: Ranger(4), Monk(7), Rogue(9), Beastlord(15)
-- Skill_ID: 1HB(0), 1HS(1), 2HB(2), 2HS(3), Archery(7), Backstab(8), Dragon Punch(21), Eagle Strike(23), Flying Kick(26), Piercing(36), Throwing(51)

function event_scale_calc(e)
    local max_skills    = 0;
    local total_count   = 0;

    local skill_matrix = {   [1] = {Class.RANGER,0,270},
                             [2] = {Class.RANGER,1,270},
                             [3] = {Class.RANGER,2,270},
                             [4] = {Class.RANGER,3,270},
                             [5] = {Class.RANGER,7,255},
                             [6] = {Class.RANGER,36,270},
                             [7] = {Class.RANGER,51,120},
                             [8] = {Class.MONK,0,275},
                             [9] = {Class.MONK,2,275},
                             [10] = {Class.MONK,51,215},
                             [11] = {Class.MONK,21,240},
                             [12] = {Class.MONK,23,240},
                             [13] = {Class.MONK,26,240},
                             [14] = {Class.ROGUE,0,270},
                             [15] = {Class.ROGUE,1,270},
                             [16] = {Class.ROGUE,7,255},
                             [17] = {Class.ROGUE,36,270},
                             [18] = {Class.ROGUE,8,235},
                             [19] = {Class.BEASTLORD,0,270},
                             [20] = {Class.BEASTLORD,2,270},
                             [21] = {Class.BEASTLORD,36,270},
                             [22] = {Class.BEASTLORD,51,180}
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