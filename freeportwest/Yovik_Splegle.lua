function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings %s. Beware the corruption that has infected Freeport. Even the tower of the Arcane Scientists is not safe from the slimy hands of the Dismal Rage. I fear Opal Darkbriar is not what she seems and is darkening the minds of her apprentices.",e.other:GetName()));
	end
end

-- END of FILE Zone:freportw -- Yovik_Splegle