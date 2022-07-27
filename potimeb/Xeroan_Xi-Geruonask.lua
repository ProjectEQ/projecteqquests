--Xeroan_Xi`Geruonask
--Phase 3 Event Mini-boss
--potimeb

function event_combat(e)
	if not e.joined then
		--mob will instantly path back to spawn if no one on hate list
		e.self:CastToNPC():MoveTo(e.self:GetGuardPointX(),e.self:GetGuardPointY(),e.self:GetGuardPointZ(),385,true);	
	end
end

function event_death_complete(e)
	eq.signal(223097,223016); -- Add Loot Lockout
	eq.signal(223097,4); -- send a signal to the zone_status that I died
end