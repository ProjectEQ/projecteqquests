function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Ironforge Jewelers. We are the finest jewelers this side of the Serpent's Spine.");
	elseif(e.message:findi("tayla")) then
		e.self:Say("Tayla is our poor dear sweet half sister. She has runaway to live with those closer to her kind.");
	end
end
