function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("thrusts the torch close to your face in a threatening manner. 'Now that I can better see you, perhaps you can also shed some illumination on your purpose here?  Bah, never mind that.  Just get back upstairs before you get burned.  This area is not safe to visitors.");
	end
end
