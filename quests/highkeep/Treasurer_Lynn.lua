function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings!!  Welcome to Highkeep. home of the greatest casino in all of Norrath.  Please visit our fine casino on the second floor."); 
	elseif(e.message:findi("highpass lottery")) then
		e.self:Say("Interested in the Highkeep lotter, are we?  I am afraid it as been put on hold.  We found last season's winner to be holding a counterfeit ticket.  We now await [last season's winner] to step foward with the winning ticket - ticket number 16568.  His prize is the key to the royal suite."); 
	elseif(e.message:findi("last season")) then
		e.self:Say("Last season's winner is not known.  I have heard from my sources that he was some sort of merchant of used goods."); 
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12261})) then
		e.self:Say("You have the runner up ticket from last season!! Here is your reward. Remember, a copper gambled is a plat earned!!");
		e.other:Ding();
		e.other:AddEXP(500);
		e.other:GiveCash(16,11,10,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12266})) then
		e.self:Say("Congratulations!! You are the winner of last season's Highkeep lottery. Here is the key to the royal suite. You should find this room on the third floor.");
		e.other:SummonItem(12267);
		e.other:Ding();
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:highkeep  Treasurer_Lynn