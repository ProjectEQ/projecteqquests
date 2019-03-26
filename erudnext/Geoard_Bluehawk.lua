function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. adventurer! After all those months of sweaty. hot and dirty battling of beasts untold. it is time to treat yourself to a tall. cool grog!"); 
	elseif(e.message:findi("about a Erud's Tonic")) then
		e.self:Say("Long ago, the great Erud found that excessive indulgence in spirits led to diminished mental awareness. His love of Kaladim brandy led him to concoct Erud's Tonic. The tonic blocked the effects of all spirits. Unfortunately, it is made from our precious Vasty Deep water and therefore is not permitted to be exported or given to non-Erudites or adventuring Erudites."); 
	elseif(e.message:findi("have some Erud's Tonic")) then
		e.self:Say("The sale or provision of Erud's Tonic to travelers is prohibited!"); 
		eq.signal(24039,50); -- NPC: Phloatin_Highbrow
	elseif(e.message:findi("Vasty Deep Water")) then
		e.self:Say("The Vasty Deep is a lake located on Odus. It contains the purest water in Norrath. Some say it is magical in nature. The High Council does not allow it to be taken by outsiders and those who try are usually converted to chum for the sharks."); 
	end
end

-- END of FILE Zone:erudnext  ID:98066 -- Geoard_Bluehawk