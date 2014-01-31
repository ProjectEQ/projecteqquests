function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. " - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
	elseif(e.message:findi("interested")) then
		e.self:Say("I have messages that need to go to Highpass and to Freeport.  Will you [deliver] mail to [Highpass] or [Freeport] for me?");
	elseif(e.message:findi("mail")) then
		e.self:Say("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?");
	elseif(e.message:findi("deliver to qeynos")) then
		e.self:Say("Take this letter to Tralyn Marsinger. You can find him at the bard guild hall. I'm sure she will compensate you for your trouble.");
		e.other:SummonItem(18154);
	elseif(e.message:findi("deliver to freeport")) then
		e.self:Say("Take this letter to Felisity Starbright in Freeport.  You can find her at the bard guild hall.  I am sure she will compensate you for your troubles.");
		e.other:SummonItem(18155);
	end
end
