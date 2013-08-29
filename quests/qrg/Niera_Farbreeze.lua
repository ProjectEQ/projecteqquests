function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 20, xloc + 20, yloc - 20, yloc + 20);
end

function event_enter(e)
	eq.set_timer("hum",30);
end

function event_timer(e)
	if(e.timer == "hum") then
		e.self:Emote("hums softly, a little tune that tickles the back of your mind but you can't quite recall.");
		eq.stop_timer("hum");
	end
end

function event_say(e)
	if(e.message:findi("tune") or e.message:findi("humming")) then
		e.self:Say("Ohh. Just a little song my mother taught me when I was young. It speaks of the earth, the sky, and the sparkling stars above, always there.");
	elseif(e.message:findi("always there")) then
		e.self:Say("Aye, always there. Like this small bag I wear around my neck. The last gift of my dying mother. It holds a fine dust, a dust she collected during her short life, that she believed brought her luck. It's speckled, flecked as the night sky is with stars.");
	elseif(e.message:findi("speckled flecked dust")) then
		e.self:Say("I've had this little bit of dust, all I have of my mother, for many years now. It's the only reminder I have of her. She said it was special, magical, a warmth to help me through the nights. Even if my life were in the balance, I would have a hard time giving it up.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20476})) then
		e.self:Say("This, this is my mother's amulet. I cannot believe it. Please, take this powder you say you need. Perhaps it does have powers, I don't know, I don't care. Thank you, my eternal thanks for this.");
		e.other:SummonItem(20456);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
