-- items: 12147, 18814
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, friend! Welcome to the Hog Caller's Inn! Don't let the name fool you.  We are the finest establishment in Freeport. Please feel free to relax in our lounge. There is usually music to soothe your blues away.");
	elseif(e.message:findi("mail for room two")) then
		e.self:Say("Hmmph !! If you're here to get the mail for room two you first need to show me the room key.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12147})) then -- Hog Key
		e.self:Say("Here you go then.");
		e.other:SummonItem(18814); -- A Sealed Letter
		e.other:Ding();
		e.other:Faction(229,1,0); -- Coalition of Trade Folk
		e.other:Faction(281,1,0); -- Knights of Truth
		e.other:Faction(291,1,0); -- Merchants of Qeynos
		e.other:Faction(5015,1,0); -- Coalition of TradeFolk III
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	e.self:Say("Hmmph !! If you're here to get the mail for room two, you'll need to show me the room key.");
end

-- END of FILE Zone:freportw -- Swin_Blackeye
