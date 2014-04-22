function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail traveler. may I assist you with something. or are you just passing through?");
	elseif(e.message:findi("passing through")) then
		e.self:Say("Very well friend. please take care when passing beyond the river to the east.  Several researchers and their mercenary escort passed through our camp en route to the temple.  That was last week and they have yet to return.  We are holding off on our expedition until we can learn more about what happened to them."); 
	elseif(e.message:findi("temple")) then
		e.self:Say("The temple of the lizardmen. The lost temple of Cazic-thule. It's just to the east of here.. across the river.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 8720})) then
		e.self:Say("Thank You. This is most interesting. I must study it immediatly"); -- text made up
		e.other:SummonItem(8732);
		e.other:Ding();
		e.other:AddEXP(100000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:feerrott  ID:47132 -- Aqaar_Aluram