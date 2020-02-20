-- CHRMDexGain

local stat_matrix = {   [1] = {305,400,1},
                        [2] = {301,304,0.9},
                        [3] = {276,300,0.8},
                        [4] = {251,275,0.7},
                        [5] = {226,250,0.6},
                        [6] = {201,225,0.5},
                        [7] = {176,200,0.4},
                        [8] = {151,175,0.3},
                        [9] = {126,150,0.2},
                        [10] = {91,125,0.1},
                        [11] = {0,90,0}
}

function event_scale_calc(e)
    local dex = e.owner:GetDEX();

    if(dex < 0) then
        dex = 0;
    end

    lookup(e,dex);
end


function lookup(e,query)
    for id, v in pairs(stat_matrix) do
        if (query >= v[1] and query <= v[2]) then
            e.self:SetScale(v[3]);
        end
    end
end