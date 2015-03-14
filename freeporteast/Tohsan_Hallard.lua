function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and welcome to Hallard's!  You will find many aged weapons begging you to shine them up and make them great once more.  We will gladly pay you top dollar for any rusty weapons you may have found littering the Commonlands.  I have a [special offer] for those who have obtained orc pawn picks.");
	elseif(e.message:findi("special offer")) then
		e.self:Say("I will pay some silver pieces for every four orc pawn picks returned to me.  I shall also throw in a ticket to the Highpass Hold lottery.  It could be a winner!!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13885,item2 = 13885,item3 = 13885,item4 = 13885})) then -- Orc Pawn Pick
		e.self:Say("As I promised, some silver and of course, the Highpass lottery ticket. Oh yes, I forgot to mention the ticket was for last season's lottery. Ha Ha!! You now own a losing Highpass lottery ticket, lucky you! Ha!!");
		e.other:SummonItem(eq.ChooseRandom(12264, 12265, 12261, 12262, 12263,12266));
		e.other:Ding();
		e.other:Faction(47,1,0); -- Coalition of Tradefolk
		e.other:Faction(184,1,0); -- Knights of Truth 
		e.other:Faction(217,1,0); -- Merchants of Qeynos
		e.other:Faction(48,1,0); -- Coalition of Tradesfolk Underground 
		e.other:AddEXP(200);
		e.other:GiveCash(0,3,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte -- Tohsan_Hallard.pl


