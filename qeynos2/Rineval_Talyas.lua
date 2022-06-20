-- items: 19071, 19070, 1000, 18302
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("hello, " .. e.other:GetName());
	elseif(e.message:findi("scribe")) then
		e.self:Emote("looks at " .. e.other:GetName() .. " strangely. 'Who told you this?'");
	elseif(e.message:findi("told me")) then
		-- NOTE: this is buggy but live-like. The real prompt should be "Kanthurn" or "Kanthurn told me", but that does not work on live /june 2022
		e.self:Say("I see. If a scribe is what you seek, then bring me the torn books of fire and ice. A donation of 1000 platinum is needed as well. The donation will be offered as a blessing to the gods.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 19071,item2 = 19070, platinum = 1000})) then
		e.other:SummonItem(18302); -- Item: Book of Scale
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
