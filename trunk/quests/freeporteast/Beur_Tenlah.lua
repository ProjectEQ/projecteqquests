function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Heya. " .. e.other:GetName() .. "!  I've been on watch duty all night.  Kinda makes a man thirsty. ya know?  Why don't you be a good little scamp and run up to the bar and get me a [dwarven ale]?  That sure would hit the spot right about now.");
	elseif(e.message:findi("dwarven ale")) then
		e.self:Say("Ahhh..  Dwarven ale is the best.  You gotta hand it to those stinky little dirt diggers. they know how to make a good brew.  Now if they could just learn to shower. huh. Harkin? Ha ha ha!");
	end
end

function event_signal(e)
	-- Signal from Harkin Duskfoot
	e.self:Say("Heh, I got something that reminds you of home.. My armpit! Bwa haha!!!");
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13036})) then -- Dwarven Ale
		e.other:Ding();
		e.self:Say("Well, well, well.. It's about time. Whatta ya got, boots fulla stones? Or maybe yer just part turtle? Bah, anyways, thanks for the ale. Maybe I'll buy you one sometime, eh? Bwahaha!");
		e.other:AddEXP(100);
		eq.signal(382194,1); -- Signal to Harkin Duskfoot
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freporte  ID:10106 -- Beur_Tenlah