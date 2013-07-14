function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. stranger. Please excuse my melancholy state.  I have had some [bad news] that has brought me great sorrow.");
	elseif(e.message:findi("bayle list")) then
		e.self:Say("The Bayle List is gone. It lies inside the belly of that beast, Mammoth");
	elseif(e.message:findi("mammoth")) then
		e.self:Say("Mammoth is the great bear which inhabits the caves. It was he that swallowed my son whole. My son was using the scroll case as a play sword when Mammoth approached. I know you need the list but my vows as a Protector of the Pine forbid me to harm the bear. Help me ease my pain. Kill Mammoth and bring me his hide. You will find the list inside the beast.");
	elseif(e.message:findi("bad news")) then
		e.self:Say("My youngest son was devoured by a grizzly bear while playing near the caves. It was an unfortunate accident. The great bear was just protecting its territory. Now, could you please just leave me be? <sniff>");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18809,item2 = 13912})) then
		e.self:Say(string.format("It is not right to feel satisfied at the sight of Mammoth's hide, but I do. Thank you, %s.",e.other:GetName()));
		e.other:SummonItem(18809);
		e.other:Ding();
		e.other:Faction(265,10,0);
		e.other:Faction(159,10,0);
		e.other:Faction(279,-30,0);
		e.other:Faction(135,10,0);
		e.other:AddEXP(500);
		e.other:GiveCash(0,6,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
