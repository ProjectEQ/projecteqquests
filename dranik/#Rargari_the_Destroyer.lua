function event_spawn(e)
    eq.set_timer("tether", 2000) -- live has a fairly long timer
end

function event_timer(e)
    if (e.self:CalculateDistance(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ()) >200) then
        e.self:GotoBind()
        e.self:SetHP(e.self:GetMaxHP())
        e.self:CastSpell(3791, e.self:GetID())
        e.self:WipeHateList()
    end
end

function event_combat(e)
	if not e.joined then
		e.self:MoveTo(e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading(), true);
	end
end