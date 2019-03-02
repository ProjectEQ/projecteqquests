function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I haven't much energy to speak, so please listen carefully. I have been bitten by a beast whose venom is both painful and slow, yet my fear is not for myself; it is for my daughter, Alezra. She's wandering within this horrifying dream world, lost and unaware of her deceitful surroundings. Please find her, and [".. eq.say_link("help") .."] her flee this nightmare.");
	elseif(e.message:findi("help")) then
		--You have been assigned the task 'Bite of the Beast'.		
		e.self:Say("Please, do not let your concerns linger on me. It is only my daughter I worry about. Her safety is my dying wish. I'll cling to what little energy I have left as I await your return.");	
		e.self:Say("Unfortunately, I do not yet have this task to give you.");
	end
end