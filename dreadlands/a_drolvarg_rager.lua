function event_killed_merit(e)
	if e.other:IsTaskActive(5789) then
		if math.random(100) <= 20 then
			if e.other:HasItem(34998) then
				e.other:UpdateTaskActivity(5789,3,1);
			else
				e.other:Message(MT.Yellow, "You see the perfect pattern, but as you search your bags you cannot find your impression book.");
			end
		end
	end
end
