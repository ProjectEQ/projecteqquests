-- CHRMFewerMemmed

local memmed_table = {  [1] = {0,1},
                        [2] = {1,0.875},
                        [3] = {2,0.75},
                        [4] = {3,0.625},
                        [5] = {4,0.5},
                        [6] = {5,0.375},
                        [7] = {6,0.25},
                        [8] = {7,0.125},
                        [9] = {8,0}
}

function event_scale_calc(e)
    if e.owner:GetClass() == Class.WARRIOR or e.owner:GetClass() == Class.MONK or e.owner:GetClass() == Class.ROGUE or e.owner:GetClass() == Class.BERSERKER then
        e.self:SetScale(0);
    else
        for id, v in pairs(memmed_table) do
            if e.owner:MemmedCount() == v[1] then
                e.self:SetScale(v[2]);
            else
                e.self:SetScale(0); -- nil protection
            end
        end
    end
end
