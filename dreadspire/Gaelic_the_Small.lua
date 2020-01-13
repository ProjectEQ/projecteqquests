function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, " .. e.other:GetName() .. ".  It's truly a testament to your character that you've found a way into Dreadspire.  Either you have received an [invitation], or you are blindly stumbling into the [unknown].  Whatever your motivations, I trust you will enjoy your stay.  Be wary of the inhabitants.  Not everyone will be as accommodating as I.");
	elseif(e.message:findi("invitation")) then
		e.self:Emote("bows, 'If that is so, the Master wishes to convey his thanks for accepting the invitation.  He hopes you will mingle with the other guests and rest in the room of your choosing.  Stay as long as you wish.");
	elseif(e.message:findi("unknown")) then
		e.self:Emote("nods. 'In some circles that is known as bravery, but here in the Master's Keep it is suicide.  If you were not invited, I suggest you return from whence you came.");
	end
end
