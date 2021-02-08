-- Quest Name: Bard Mail Quest
-- items: 18161

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetName() .. " - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
	elseif(e.message:findi("mail")) then
		e.self:Say("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more central offices.  Are you [interested]?");
	elseif(e.message:findi("interested")) then
		e.self:Say("I have messages that need to go to - well, right now I have one that needs to go to Kelethin.  Will you [deliver] mail to [Kelethin] for me?"); 
	elseif(e.message:findi("deliver to kelethin")) then
		e.self:Say("Take this letter to Jakum Webdancer in Kelethin.  You can find him at the bard guild hall.  I am sure he will compensate you for your troubles.");
		e.other:SummonItem(18161); -- Item: Bardic Letter (Kelethin)
	end
end

-- END of FILE Zone:felwithea