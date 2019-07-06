-- CHRMFewPlayers

function event_scale_calc(e)

    local player_matrix = {   [1] = {0,1,1},
                              [2] = {2,6,0.85},
                              [3] = {7,10,0.7},
                              [4] = {11,20,0.55},
                              [5] = {21,33,0.4},
                              [6] = {34,47,0.25},
                              [7] = {48,60,0.1},
                              [8] = {61,107,0}
    }

    local client_list = eq.get_entity_list():GetClientList();
    local client_count = 0;

    if(client_list ~= nil) then
        for client in client_list.entries do
            client_count = client_count +1;
        end
    end

    for id, v in pairs(player_matrix) do
        if (client_count >= v[1] and client_count <= v[2]) then
            e.self:SetScale(v[3]);
        end
    end
end