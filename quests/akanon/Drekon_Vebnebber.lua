-- Converted to .lua by Speedz

function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say("Hello, " .. e.other:GetName() .. ". It is grand to make your acquaintance. I am the in-house merchant-slash-file clerk. I have goods to offer and I handle all the Gemchopper paperwork. Thrilling, don't you think?");
  end
  if (e.message:findi("red")) then
    e.self:Say("Red 5 is rumored to be a haywire clockwork. They say he pieced himself back together and lives in the scrapyard. If he IS there, you must hunt him down and take his blackbox to Manik Compolten. Be careful, if Red 5 rebuilt himself, he may have rebuilt minions as well.");
  end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 18837})) then
		e.self:Say("Why, thank you. Hey!! This log indicates some messy business is going on at the scrapyard. Something happened to a group of gnomes. They never came out!! Go check out the scrapyard! I believe the rumors of [Red 5] are true.");
		e.other:Faction(115,2);
		e.other:Faction(210,2);
		e.other:Faction(176,2);
		e.other:Faction(71,-2);
		e.other:Faction(39,-2);
		e.other:AddEXP(2000);
		e.other:Ding();
	elseif (item_lib.check_turn_in(e.trade, {item1 = 18838})) then
		e.self:Say("Why, thank you. Hey!! What's this? This log is showing that two obsolete duster models have escaped! Well they'll need to be taken care of right away. Go out and find models V and X and take care of them. Bring Sanfyrd Featherhead proof that you've destroyed them and he'll probably have a reward for you."); -- text not live-like. Need original
		e.other:Faction(115,2);
		e.other:Faction(210,2);
		e.other:Faction(176,2);
		e.other:Faction(71,-2);
		e.other:Faction(39,-2);
		e.other:AddEXP(2000);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
