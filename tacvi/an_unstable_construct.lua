-- an_unstable_construct (298045)
-- add during Pixtt_Riel_Tavas fight
-- mini golems that cast a AE DD after a while, and when they die

function event_spawn(e)
	eq.set_timer("AddSpell", 10000)
end

function event_timer(e)
	--Cataclysm of Stone
	e.self:AddAISpell(0, 4661, 1, -1, -1, -350)
end

function event_death(e)
	e.self:CastSpell(4661, e.self:GetID());
end
