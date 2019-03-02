function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("seems to be lost in a chant as he leans over the faintly breathing woman before him.  A seasoned adventurer would recognize his incantations as being an attempt to cleanse [".. eq.say_link("poison") .."].");
	elseif(e.message:findi("poison")) then
		e.self:Emote("stops as he's awoken from his trance and looks up at ".. e.other:GetName() ..". 'Spider venom, specifically.  She took ill from the venom of the spinechillers.  It keeps [".. eq.say_link("transforming") .."] and moving.'  He lowers his head.");	
	elseif(e.message:findi("transforming")) then
		e.self:Emote("closes his eyes from the pain, but a tear soaks the fur beneath them. 'On entry into her system, the venom keeps morphing, making it difficult to treat.  Just as I think I have saved her, it appears it has merely changed constitution.'  He looks back up at ".. e.other:GetName() .." and inquires, 'The only hope for her are pure samples of the venom that has infected her, those that have not yet been injected in flesh.  I could study it and try to find a way to stop the transformations or anticipate the next forms.  It's a lot to ask with how dire the situation is here, but would you [".. eq.say_link("retrieve some") .."] to save her?'");	
	elseif(e.message:findi("retrieve some")) then		
		--You have been assigned the task 'The Antidote Within'.
		e.self:Emote("places a hand on your arm and nods.  'Thank you... May your ancestors guide you, friend.  Return safe.'");	
		e.self:Say("Unfortunately, I do not yet have this task to give you.");
	end
end