-- CHRMPlateWeapon
-- Array: Class,Skill,Max_Skill
-- Classes: Warrior(1), Paladin(3), Shadow Knight(5), Bard(8)
-- Skill_ID: 1HB(0), 1HS(1), 2HB(2), 2HS(3), Archery(7), Piercing(36), Throwing(51)

function event_scale_calc(e)

    local max_skills = 0;
    local total_count = 0;

    local skill_matrix = {   [1] = {1,0,250},
                             [2] = {1,1,250},
                             [3] = {1,2,250},
                             [4] = {1,3,250},
                             [5] = {1,7,240},
                             [6] = {1,36,240},
                             [7] = {1,51,200},
                             [8] = {3,0,225},
                             [9] = {3,1,225},
                             [10] = {3,2,225},
                             [11] = {3,3,225},
                             [12] = {3,7,75},
                             [13] = {3,36,230},
                             [14] = {5,0,225},
                             [15] = {5,1,225},
                             [16] = {5,2,225},
                             [17] = {5,3,225},
                             [18] = {5,7,75},
                             [19] = {5,36,230},
                             [20] = {8,0,270},
                             [21] = {8,1,270},
                             [22] = {8,36,270},
                             [23] = {8,51,120}
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