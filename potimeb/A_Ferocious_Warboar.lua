--A_Ferocious_Warboar
--Phase 3 Event Mini-boss
--potimeb

function event_combat(e)
	if not e.joined then
		--mob will instantly path back to spawn if no one on hate list
		e.self:CastToNPC():MoveTo(e.self:GetSpawnPointX(),e.self:GetSpawnPointY(),e.self:GetSpawnPointZ(),e.self:GetSpawnPointH(),true);	
	end
end

function event_death_complete(e)
	eq.signal(223097,223008); -- Add Loot Lockout
	eq.signal(223097,4); -- send a signal to the zone_status that I died
end