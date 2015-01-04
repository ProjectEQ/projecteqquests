-- 1.0 Cleric Epic // Water Sprinkler of Nem Ankh // -- Drogerin

function event_death_complete(e)
		eq.spawn2(91090,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Spawns Zordakalicus Ragefire
end
