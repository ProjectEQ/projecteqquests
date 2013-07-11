function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, fellow traveler! I gotta tell ya. I love this town. Especially Crow's. Although the crowd seems a bit shadier than other places of the sort.");
	elseif(e.message:findi("testament of vanear")) then
		e.self:Say("So you have heard that good old Moodoro has knowledge of the Testament of Vanear. I care little for that book. Of course I have it!! If you want it, I will sell it to you for two gold pieces.");
	elseif(e.message:findi("ran")) then
		e.self:Say("Ran Flamespinner is a librarian in Highpass Hold.");
	elseif(e.message:findi("page 34")) then
		e.self:Say("So, you know I have page 34. Pretty smart of me to tear the most important page out before someone else tried, eh? If you really want it, then sit down and deal in. Ante is 4 gold. I will give you one card. If it is a jester, then I will give you the page. Let's do it.");
	elseif(e.message:findi("tonic")) then
		e.self:Say("I need some of Erud's tonic water. There is a merchant in Erudin who sells it.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 6) then
		e.self:Say("<urp>.. I don't feel so well.");
		eq.signal(2091,1,1);
	elseif(e.wp == 14) then
		eq.set_anim(2040,1);
	end
end

function event_signal(e)
	if(e.wp == 14) then
		e.self:Say("Ooooh.. Bllaughhh.. Ooh.. I need some tonic.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13118})) then
		e.self:Say("Oh thank the maker you have returned. Here is a little something in return");
		e.other:Ding();
		e.other:Faction(60,20,0);
		e.other:Faction(145,20,0);
		e.other:Faction(143,-20,0);
		e.other:Faction(147,20,0);
		e.other:AddEXP(200);
		e.other:GiveCash(5,0,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13994})) then
		e.self:Say("Lucky you. We were hoping to really clean you out. Here you go. Take the page. Even together, the book is nothing more than fiction.");
		e.other:Ding();
		e.other:SummonItem(13836);
	elseif(item_lib.check_turn_in(e.trade, {gold = 4})) then
		local random_card = eq.ChooseRandom({13994,13993,13992,13995});
		e.other:Ding();
		e.self:Say("Well, what do you have?!!");
		e.other:SummonItem(random_card);
	elseif(item_lib.check_turn_in(e.trade, {gold = 2})) then
		e.self:Say("HA!! I hope you enjoy the book. It is missing pages 30 and 34. It is nothing more than garbage without them. A rogue ripped them from their bindings and sold them to [Ran].");
		e.other:Ding();
		e.other:SummonItem(17918);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	e.self:Emote(string.format("'s corpse says 'I'll get you back %s!'",e.other:GetCleanName()));
end
