-- CHRMHighWisAgi

local stat_matrix = {   [1] = {610,999,1},
                        [2] = {600,609,0.99},
                        [3] = {561,599,0.86},
                        [4] = {533,560,0.84},
                        [5] = {506,532,0.7},
                        [6] = {483,505,0.675},
                        [7] = {476,482,0.55},
                        [8] = {451,475,0.5},
                        [9] = {425,450,0.4},
                        [10] = {395,424,0.35},
                        [11] = {351,394,0.3},
                        [12] = {301,350,0.2},
                        [13] = {251,300,0.1},
                        [14] = {0,250,0}
}

function event_scale_calc(e)
    local wis = e.owner:GetWIS();
    local agi = e.owner:GetAGI();

    if(wis < 0) then
        wis = 0;
    end

    if(agi < 0) then
        agi = 0;
    end
    local combined_stat = wis + agi;
    lookup(e,combined_stat);
end


function lookup(e,query)
    for id, v in pairs(stat_matrix) do
        if (query >= v[1] and query <= v[2]) then
            e.self:SetScale(v[3]);
        end
    end
end