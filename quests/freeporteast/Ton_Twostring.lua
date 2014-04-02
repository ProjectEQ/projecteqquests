function event_say(e) 
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. "..e.other:GetName().." - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
	elseif(e.message:findi("what mail")) then
		e.self:Say("The League of Antonican Bards has a courier system made up of travelers,adventurers and [agents].  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?");
	elseif(e.message:findi("agent")) then
		e.self:Say("Silna Songsmith, Travis Two-Tone, Drizda Tunesinger and Dark Deathsinger all report to Felisity Starbright");
	elseif(e.message:findi("interested")) then
		e.self:Say("I have messages that need to go to Highpass and to Kelethin.  Will you [deliver] mail to [Kelethin] or [Highpass] for me?");
	elseif(e.message:findi("deliver to kelethin")) then
		e.self:Say("Take this pouch to Idia in Kelethin.  You can find her at the bard guild hall.  I am sure she will compensate you for your troubles.");
		e.other:SummonItem(18167);
	elseif(e.message:findi("deliver to highpass")) then
		e.self:Say("Take this pouch to Lislia Goldtune in Highpass.  You can find her at the entrance to HighKeep.  I am sure she will compensate you for your troubles."); 
		e.other:SummonItem(18156);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18164,item2 = 18166})) then
		e.self:Say("More mail - you have done us a noteworthy service!  Please take this gold for your troubles.  If you are interested in more work, just ask me.");
		e.other:Ding();
		e.other:Faction(192,10,0); -- league of antonican bards
		e.other:Faction(184,10,0); -- knights of truth
		e.other:Faction(135,10,0); -- guards of qeynos
		e.other:Faction(273,-30,0); -- ring of scale
		e.other:Faction(207,-30,0); -- mayong mistmoore
		e.other:AddEXP(100);
		e.other:GiveCash(0,0,eq.ChooseRandom(8,9,10,11,12),0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
