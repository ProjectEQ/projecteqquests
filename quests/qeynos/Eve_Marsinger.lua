function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?",e.other:GetName()));
	elseif(e.message:findi("interested")) then
		e.self:Say("'I have messages that need to go to - well, right now I have one that needs to go to Highpass. Will you [deliver] mail to [Highpass] for me?");
	elseif(e.message:findi("agents")) then
		e.self:Say("Sivina Lutewhisper, Marton Stringsinger, Ticar Lorestring and Mistrana Two-Notes all report to my husband, Tralyn.");
	elseif(e.message:findi("mail")) then
		e.self:Say("'The League of Antonican Bards has a courier system made up of travelers, adventurers and [agents]. We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices. Are you [interested]");
	elseif(e.message:findi("deliver")) then
		e.self:Say("Take this pouch to Lislia Goldtune in Highpass. You can find her at the entrance to HighKeep. I am sure she will compensate you for your troubles.");
		e.other:SummonItem(18152);
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18165})) then
		e.self:Say("Incoming mail - very good! Please take this gold for your troubles.");
		local gp = math.random(15);
		e.other:Ding();
		e.other:Faction(192,10,0);
		e.other:Faction(184,10,0);
		e.other:Faction(135,10,0);
		e.other:Faction(273,-30,0);
		e.other:Faction(207,-30,0);
		e.other:AddEXP(150);
		e.other:GiveCash(0,0,gp,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
