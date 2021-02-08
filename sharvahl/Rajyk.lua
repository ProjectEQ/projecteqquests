function event_say(e)
	if(e.other:GetFaction(e.self) < 5) then
		if(e.message:findi("hail")) then
			e.self:Emote("purrs at " .. e.other:GetCleanName() .. ".");
		elseif(e.message:findi("play dead")) then
			e.self:Emote("rolls over and plays dead.");
			e.self:DoAnim(16);
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself."));
	end
end

function event_signal(e)
	e.self:Emote("purrs at Warder Keeper Jyk.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
