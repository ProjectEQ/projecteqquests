function event_say(e)
	if e.message:findi("Hail") then
		e.self:Emote("cackles, his body quivering with fear or dementia -- you're not sure which.");
		e.self:Say("The Muramites do not follow us here. But yet you found a way inside, and for your efforts you will be rewarded with eternal damnation. This temple is cursed!");
		e.self:Say("Stories . . . Word of mouth . . . Rumors passed down from generation to generation alluded to a lost temple such as this. Even the least skeptical of us dismissed it as a fairy tale, and now it has revealed itself. Was this a sign of our salvation, or of our destruction?");
		e.self:Emote("snickers softly");
		e.self:Say("But the catch, always a catch. It's never simple is it? The sentinel is not up here, so it must be in the depths of the temple. Those who have dared descend to the lower reaches of this place return as madmen or do not return at all.");    
		e.self:Say("It's time you began formulating prayers to whatever gods you heathens pray to. Your lives, my life, everything was forfeit the moment we crossed the threshold into Inktu'ta.");
	end
end
