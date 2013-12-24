function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("<BARK!>  Hiya!  <Bark!>  <Bark!>  My name is Furball Miller.  I work here on my father's farm.  Of course. he is not my real [father] but he is the one who raisd me from a pup.  I hope to go back to [Blackburrow] some day and try to get them to stop all the senseless fighting with the humans of Qeynos.");
	elseif(e.message:findi("blackburrow")) then
		e.self:Say("Blackburrow is home to a clan of gnolls called the Sabertooths.  It is where I am from but I really don't ever remember being there.  Pa tells me the gnolls there are always fighting with the <BARK!>  humans of Qeynos.  I wish they would stop and realize that humans and gnolls are not as different as they like to think.  <BARK!>");
	end
end

-- END of FILE Zone:qey2hh1  ID:1610 -- Furball_Miller 
