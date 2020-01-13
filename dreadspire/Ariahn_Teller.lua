function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("holds an index finger to her pursed lips. 'Shhh... Silence is golden, " .. e.other:GetName() .. ".  You are welcome to look around and peruse our selection so long as you remain quiet and do not bother the other guests.  I would also advise against speaking to the Quartet, for your sake and not theirs.  They will bore you to tears.");
	end
end
