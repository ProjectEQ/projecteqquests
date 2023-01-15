function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Aye, ".. e.other:GetName() .. ", I can do just about anything with metal. I can bend, roll, and weave metal in any way. That's why I'm still here! The brotherhood wants me to keep me working to make sure there are replacement parts for the ship.");	
	end
end
