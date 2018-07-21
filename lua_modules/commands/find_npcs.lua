local function find_npcs(e)
    local npc_list = eq.get_entity_list():GetNPCList();

    -- Filter npc's by name if specified
    local name_filter = "";
    if (e.args[1]) then
        name_filter = e.args[1];
    end

    -- List npc's
    for npc in npc_list.entries do
        if (npc.valid) then
            local link = "#goto " .. npc:GetX() .. " " .. npc:GetY() .. " " .. npc:GetZ();
            if (name_filter and npc:GetCleanName():findi(name_filter)) then
                e.self:Message(15, eq.say_link(tostring(link), false, npc:GetCleanName()));
            end
        end
    end
end

return find_npcs;