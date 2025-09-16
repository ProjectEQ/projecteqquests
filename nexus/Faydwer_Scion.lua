function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". I am Jucian Featherhigh, the guardian of this teleport. It will take you back to my home in the Faydark. This pad, along with the others, activate in intervals of around fifteen minutes. When directed to do so, step onto the pad next to me and wait to be teleported.");
	end
end
