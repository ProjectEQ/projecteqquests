-- CHRMPlateWeapon
-- Array: Class,Skill,Max_Skill
-- Classes: Warrior(1), Paladin(3), Shadow Knight(5), Bard(8)
-- Skill_ID: 1HB(0), 1HS(1), 2HB(2), 2HS(3), Archery(7), Piercing(36), Throwing(51)

function event_scale_calc(e)
    local max_skills    = 0;
    local total_count   = 0;

    local skill_matrix = {   [1] = {Class.WARRIOR,0,250},
                             [2] = {Class.WARRIOR,1,250},
                             [3] = {Class.WARRIOR,2,250},
                             [4] = {Class.WARRIOR,3,250},
                             [5] = {Class.WARRIOR,7,240},
                             [6] = {Class.WARRIOR,36,240},
                             [7] = {Class.WARRIOR,51,200},
                             [8] = {Class.PALADIN,0,225},
                             [9] = {Class.PALADIN,1,225},
                             [10] = {Class.PALADIN,2,225},
                             [11] = {Class.PALADIN3,3,225},
                             [12] = {Class.PALADIN,7,75},
                             [13] = {Class.PALADIN,36,230},
                             [14] = {Class.SHADOWKNIGHT,0,225},
                             [15] = {Class.SHADOWKNIGHT,1,225},
                             [16] = {Class.SHADOWKNIGHT,2,225},
                             [17] = {Class.SHADOWKNIGHT,3,225},
                             [18] = {Class.SHADOWKNIGHT,7,75},
                             [19] = {Class.SHADOWKNIGHT,36,230},
                             [20] = {Class.BARD,0,270},
                             [21] = {Class.BARD,1,270},
                             [22] = {Class.BARD,36,270},
                             [23] = {Class.BARD,51,120}
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