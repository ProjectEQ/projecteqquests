function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". Rueppy's my name. Why don't you buy us something to [drink] and we can talk?");
	elseif(e.message:findi("drink")) then
		e.self:Say("How about a short beer? That sounds good.");
	elseif(e.message:findi("blackburrow stout")) then
		e.self:Say("Oh, well we can't get that here. However, you can always [smuggle] it in...");
	elseif(e.message:findi("smuggle")) then
		e.self:Say("Well, that depends. Do you want a [job]?");
	elseif(e.message:findi("job")) then
		e.self:Say("Should you choose to accept, you have to go to the ruins on the other side of the great wall, find Gunrich, and tell him that [Dark Rivers Flow East].");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13032})) then -- Short Beer
		e.self:Say("Mmm. It's good, but not as good as [Blackburrow Stout].");
		e.other:Ding();
		e.other:AddEXP(100);
		e.other:GiveCash(5,0,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13131})) then -- Case of Blackburrow Stout
		e.self:Say("Ahhh, that hit the spot! Nice work, $name. Take this as a reward.");
		e.other:Ding();
		e.other:AddEXP(5000);
		e.other:GiveCash(5,1,1,2);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19064 -- Rueppy_Kutpurse