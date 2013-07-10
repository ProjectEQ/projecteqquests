function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, %s!  Welcome to the fine city of Qeynos! If you wish to join our fight against the evil gnolls of Blackburrow, be sure to talk to Captain Tillin in the Hall of Steel.",e.other:GetName()));
	end
end
