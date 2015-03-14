function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello! You should take up fishing. It really relieves the stress that accompanies heavy adventuring.");
	end
end
