-- a_corrupted_construct (298002)
-- Big golem at beginning of Pixtt_Riel_Tavas fight

function event_spawn(e)
	-- Lay down. DoAnim(16)?
	e.self:SetAppearance(3)
end

function event_death_complete(e)
	e.self:Emote("The ground trembles as the massive construct falls. ")
end