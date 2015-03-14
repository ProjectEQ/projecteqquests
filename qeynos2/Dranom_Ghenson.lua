function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello there, %s. My name's Dranom Ghenson. My daughter, Aenia, and I moved out here from Freeport about a year ago. That dump of a city is just horrible! I feel that Qeynos is a much safer place for [Aenia] and myself to set up our shop. I only have a few things to sell right now, but hopefully business will pick up soon.",e.other:GetName()));
	elseif(e.message:findi("aenia")) then
		e.self:Say("Aenia is my beautiful daughter.  Many so-called men have tried to win her hand in marriage, but none of them have been able to live up to my standards.  My daughter shall have a nobleman or a wealthy merchant... certainly not some lowly bard, like that Behroe she's been seeing.  If I ever catch him, or one of his cronies, around my daughter again, I'll bash their good-for-nothing heads in.");
	end
end
