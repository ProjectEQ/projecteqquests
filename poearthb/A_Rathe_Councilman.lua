function event_combat(e)
	if not e.joined then
		e.self:CastToNPC():MoveTo(e.self:GetSpawnPointX(),e.self:GetSpawnPointY(),e.self:GetSpawnPointZ(),e.self:GetSpawnPointH(),true);	--mobs will instantly path back to spawn if no one on hate list
	end
end
