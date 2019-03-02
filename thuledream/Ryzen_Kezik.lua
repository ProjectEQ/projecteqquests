function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("There is a bevy of spell components here. It is unfortunate that there are undead creatures attached to them! Now get out of my way.");
	end
end