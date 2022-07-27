function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("You'd best move along if you've got no business here. We have to keep this area safe. Terrible stuff across the seas, you know.");	
	end
end
