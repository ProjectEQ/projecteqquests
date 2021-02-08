-- Ilanic's Scroll

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am no more.");
	elseif(e.message:findi("scroll")) then
		e.self:Say("Kobold! Kobold!");
		eq.unique_spawn(414192,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --a_kobold_caster (414192)
		eq.depop_with_timer();
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

