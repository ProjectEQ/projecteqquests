function event_say(e)
	if (e.other:GetFaction(e.self) <= 5) then
		if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ".  If it is the halls of testing you seek, you have found them.  Do not enter without much contemplation of your fate.  You are brave to make it as far as this great temple, but terror exceeding imagination is beyond this point.");
		end
	end
end
