--[[
	##Drogerin##

	Tasks using this file.


	Grounding the Drakes - Version(1) (Complete) -- Spawn any of 4 types of drakes at a 85% chance when a drake egg is killed no other requirements needed, not used in task.
	The Drake Menace -Version (5) - ( Will need to add more script to spawn Drake Matriarch when task is added. )

--]]


function event_death_complete(e)
	local roll = math.random(100)

	if roll >= 15 then
		eq.spawn2(eq.ChooseRandom(341091,341085,341092,341087),0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC(s): a_Delve_spellbinder (341091), a_Delve_diviner (341085), a_Delve_evoker (341092), a_Delve_drake (341087)
	else
	-- Do nothing (for now) 
	end
end
