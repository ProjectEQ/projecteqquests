function event_waypoint_arrive(e)
	if(e.wp == 10) then
		e.self:Say("Hey Hanns.. Have you gotten word from Prak about the spy in Carson's guards?");
		eq.signal(2074,1);
	end
end

function event_signal(e)
	if(e.signal == 1 and e.self:GetX() == 163 and e.self:GetY() == 144) then
		e.self:Say("Yeah, whatever, Knarg. If I were you, I wouldn't mess around with [Renux]. She's in tight with [Hanns], and you know how he is.");
	elseif(e.signal == 2) then
		e.self:Say("[Rujahn] Tahslek, huh? I've never heard of him, but those bandits seem to have a new leader every month or so.");
	elseif(e.signal == 3) then
		e.self:Say("I'll send one of our best men to Highpass and eliminate [Rujahn]'s spy.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey..  My name's Zannsin. but you can call me [Zan].");
	elseif(e.message:findi("men to prak in highpass")) then
		e.self:Say("Hmm, I see. Maybe you can help us out with this, $name, huh? I think it'd be a perfect opportunity for you to prove just how valuable you are to our little organization. Take this letter to Prak at Golden Rooster in Highpass, and see what you can do to help him out.");
		e.other:SummonItem(18795);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18028})) then
		e.self:Say("You have proven yourself to be very valuable $name. For helping us out please accept this Cloak of the Unseen Hands!");
		e.other:SummonItem(1048);
		e.other:Ding();
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos2  ID:2077 -- Zannsin_Resdinet