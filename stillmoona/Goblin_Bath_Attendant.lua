-- items: 55996, 55997, 55998, 55999
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("'You!  You will get the ingredients I need for this bath!  I have a very important Kirin client who is expected to be here shortly, and I am out of his favorite soap.  If I don't get all the ingredients to make more soap for his bath, he will be very, very angry.  Return to me with a branch of pink blossoms, some green herbs, a vial of pond water, and the tail from the puma that stalks these grounds.  What? Yes, yes I will reward you.  Now go!'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 55996,item2 = 55997,item3 = 55998,item4 = 55999})) then
		e.self:Say("'What? You didn't even get the essence of lily pad!  Now get back out there and get the rest...  Oh no!  It is too late!  He is here!  We are all gonna die!'");
		eq.spawn2(338170,0,0,681,414,16.05,510); -- NPC: #Akihiro
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
