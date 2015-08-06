-- an_unstable_construct (298045)
-- add during Pixtt_Riel_Tavas fight
-- mini golems that cast a AE DD when they die

function event_death(e)
	e.self:CastSpell(4661, e.self:GetID());
end
