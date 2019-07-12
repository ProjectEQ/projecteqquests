-- CHRMLightMeleeWeap
-- Array: Class,Skill,Max_Skill
-- Classes: Ranger(4), Monk(7), Rogue(9), Beastlord(15)
-- Skill_ID: 1HB(0), 1HS(1), 2HB(2), 2HS(3), Archery(7), Backstab(8), Dragon Punch(21), Eagle Strike(23), Flying Kick(26), Piercing(36), Throwing(51)

function event_scale_calc(e)

    local max_skills = 0;
    local total_count = 0;

    local skill_matrix = {   [1] = {4,0,270},
                             [2] = {4,1,270},
                             [3] = {4,2,270},
                             [4] = {4,3,270},
                             [5] = {4,7,255},
                             [6] = {4,36,270},
                             [7] = {4,51,120},
                             [8] = {7,0,275},
                             [9] = {7,2,275},
                             [10] = {7,51,215},
                             [11] = {7,21,240},
                             [12] = {7,23,240},
                             [13] = {7,26,240},
                             [14] = {9,0,270},
                             [15] = {9,1,270},
                             [16] = {9,7,255},
                             [17] = {9,36,270},
                             [18] = {9,8,235},
                             [19] = {15,0,270},
                             [20] = {15,2,270},
                             [21] = {15,36,270},
                             [22] = {15,51,180}
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