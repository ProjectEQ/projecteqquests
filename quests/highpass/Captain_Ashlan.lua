function event_say(e)
	local fac = e.other:GetFaction(e.self);
	
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, traveler! I am Captain Ashlan of the Highpass Guards. I keep watch over my men and the [volunteers] here at the East Gate. It's been a busy [job] here lately, with the [orc raids] and all.");
	elseif(fac < 7) then
		if(e.message:findi("job")) then
			e.self:Say("We're short-handed around here, as usual. Would you like to help us out with the [Volunteer Watch]?");
		elseif(e.message:findi("volunteer")) then
			e.self:Say("The Volunteer Watch guards the entry gates of Highpass. Since the [orc raids] are becoming more and more frequent, it's a busy job. But it can pay well, depending on how many [orcs] you slay.");
		elseif(e.message:findi("orc")) then
			e.self:Say("One of the orc clans of Kithicor Woods has been trying to expand their territory. Small orc raiding parties are frequently rushing the East Gate. Without the [Volunteer Watch] helping us out, Highpass would probably be overrun by those vile beasts.");
		end
	else
		e.self:Say("I will not deal with ilk such as you."); -- text made up
	end
end

function event_trade(e)
	local fac = e.other:GetFaction(e.self);
	local scalp = 0;
	local item_lib =require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 13791,item2 = 13791,item3 = 13791,item4 = 13791})) then
			scalp = 4;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13791,item2 = 13791,item3 = 13791})) then
			scalp = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13791,item2 = 13791})) then
			scalp = 2;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13791})) then
			scalp = 1;
	end
	
	if(scalp > 0) then
		if(fac < 7) then
			repeat
				local random_copper = eq.ChooseRandom(0,1,2,3,4,5,6,7,8);
				local random_silver = eq.ChooseRandom(0,1,2,3,4,5,6);
				local random_gold = eq.ChooseRandom(0,1,2,3);
				local random_plat = eq.ChooseRandom(0,1);
				e.self:Say("Great work! Maybe you can help us out again sometime?");
				e.other:Ding();
				e.other:Faction(149,5,0);
				e.other:Faction(31,2,0);
				e.other:Faction(214,2,0);
				e.other:Faction(53,2,0);
				e.other:Faction(105,2,0);
				e.other:AddEXP(1000);
				e.other:GiveCash(random_copper,random_silver,random_gold,random_plat);
				scalp = scalp - 1;
			until scalp == 0
		else
			e.self:Say("I will not aid beings such as you."); -- text made up. faction too low and eat items.
			scalp = 0;
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
