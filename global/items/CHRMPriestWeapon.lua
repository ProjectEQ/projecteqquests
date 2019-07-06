-- CHRMPriestWeapon
-- Array: Class,Skill,Max_Skill
-- Classes: Cleric(2), Druid(6), Shaman(10)
-- Skill_ID: 1HB(0), 1HS(1), 2HB(2), H2H(28), Piercing(36)

function event_scale_calc(e)

    local max_skills = 0;
    local total_count = 0;

    local skill_matrix = {   [1] = {2,0,190},
                             [2] = {2,2,190},
                             [3] = {2,28,80},
                             [4] = {6,0,190},
                             [5] = {6,1,190},
                             [6] = {6,2,190},
                             [7] = {10,0,200},
                             [8] = {10,2,200},
                             [9] = {10,36,200}
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