function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail. %s - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?",e.other:GetName()));
	elseif(e.message:findi("I am interested in delivering mail")) then
		e.self:Say("I have messages that need to go to Freeport and to Qeynos.  Will you [deliver] mail [to Freeport] or [to Qeynos] for me?"); 
	elseif(e.message:findi("deliver to freeport")) then
		e.self:Say("Take this pouch of mail to Ton Twostring. You can find him at the bard guild hall. I'm sure he will compensate you for your trouble.");
		e.other:SummonItem(18164);
	elseif(e.message:findi("deliver to qeynos")) then
		e.self:Say("Take this letter to Tralyn Marsinger. You can find him at the bard guild hall. I'm sure she will compensate you for your trouble.");
		e.other:SummonItem(18154);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18152}) or item_lib.check_turn_in(e.trade, {item1 = 18156})) then
		e.self:Say("More mail - you have done us a noteworthy service!  Please take this gold for your troubles.  If you are interested in more work, just ask me.");
		e.other:Ding();
		e.other:Faction(192,5,0);
		e.other:Faction(184,5,0);
		e.other:Faction(135,5,0);
		e.other:Faction(273,-15,0);
		e.other:Faction(207,-15,0);
		e.other:AddEXP(200);
		e.other:GiveCash(0,0,eq.ChooseRandom(8,9,10,11,12),0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
