function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am very sorry to have to inform you that the library is off limits to strangers.");
	elseif(e.message:findi("testament of vanear")) then
		e.self:Say("So, you seek the page 30 I recently purchased from an Erudite named Moodoro? He also had page 34, but refused to sell it to me. If you seek page 34, you will first have to find Moodoro. I had page 30 for but a few days when a man swiped it from the library's shelves. I believe he wore the garb of a guard of Qeynos. He darted away so fast I did not have time to cast a single spell! I believe he is still in Highpass, I can feel it!!");
	end
end
