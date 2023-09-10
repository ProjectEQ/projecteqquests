function event_combat(e)
	if e.joined then
		e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
	end
end