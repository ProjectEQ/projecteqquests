local function endurance(e)
    local tar = e.self:GetTarget();
    if (tar.null) then
        tar = e.self;
    end

    e.self:Message(MT.Yellow, "Targets endurance refreshed (" .. tar:GetCleanName() .. ")");
    tar:SetEndurance(tar:GetMaxEndurance());
end

return endurance;