-- items: 18160
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. " .. e.other:GetName() .. " - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
	elseif(e.message:findi("am interested")) then
		e.self:Say("I have messages that need to go to - well. right now I have one that needs to go to Kelethin.  Will you [deliver] mail [to Kelethin] for me?");
	elseif(e.message:findi("What mail")) then
		e.self:Say("The League of Antonican Bards has a courier system made up of travelers, adventurers, and agents.  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?");
	elseif(e.message:findi("deliver kelethin")) then
		e.self:Say("Take this letter to Jakum Webdancer. You can find him at the bard guild hall. I'm sure he will compensate you for your trouble.");
		e.other:SummonItem(18160); -- Item: Bardic Letter (Kelethin)
	end

end

--Author: RealityIncarnate
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
