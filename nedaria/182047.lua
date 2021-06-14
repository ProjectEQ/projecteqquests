-- Non Epic Dark Elf Blacksmith

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("So much to do, so little time! We have a tight deadline here!");	
	end
end
