function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good ta see ya! Now start showin' these poodlewalkers how a real fish drinks!");
	elseif(e.message:findi("low")) then
		e.self:Say("This is going to sound crazy, but my main supplier of [Blackburrow Stout] is one of the brewers themselves. I have run too low on the fine brew and need someone to [pick up my shipment].");
	elseif(e.message:findi("shipment")) then
		e.self:Say("Take this note to the Qeynos Hills. Somewhere there, you shall find a gnoll at night called Gnasher. Give him the note. Now, get moving!");
		e.other:SummonItem(18800);
	elseif(e.message:findi("blackburrow stout")) then
		e.self:Say("Keep it down!! So you've heard of Blackburrow Stout? We sell it here in Fish's Backroom. If the Qeynos Guards knew, well.. it wouldn't be such a good thing. The stout is illegal, It's made by the gnolls. It is one of the finest brews you will ever taste. If you want any.. slide me a [moonstone].");
	elseif(e.message:findi("moonstone")) then
		e.self:Say("Looking for moonstones, are we? The only way I know of getting a moonstone is to hunt gnolls for Captain Tillin of the Qeynos Guards.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 5) then
		e.self:Say("Blast!! We are running[low]!!");
	end
end

function event_signal(e)
	local rando = math.random(2);
	e.self:Say("You shall never take me alive!!");
	if(rando == 1) then
		eq.attack_npc_type(1202);
	end
end

function event_trade(e)
	local moonstone = 0;
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13131})) then
		e.self:Say("Good work, pal. Here's a little dough to spend, just don't spend it at any other bar.");
		e.other:Ding();
		e.other:Faction(167,1,0);
		e.other:Faction(135,1,0);
		e.other:Faction(257,1,0);
		e.other:Faction(183,1,0);
		e.other:GiveCash(0,0,3,9);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10070,item2 = 10070,item3 = 10070,item4 = 10070})) then
		moonstone = 4;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10070,item2 = 10070,item3 = 10070})) then
		moonstone = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10070,item2 = 10070})) then
		moonstone = 2;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10070})) then
		moonstone = 1;
	end
	if(moonstone > 0) then
		repeat
			e.self:Say("Here you go then. Don't go tellin' no Guards where that came from, I would hate to rid myself of a good paying customer.");
			e.other:Ding();
			e.other:SummonItem(13107,1);
			e.other:Faction(167,1,0);
			e.other:Faction(135,1,0);
			e.other:Faction(257,1,0);
			e.other:Faction(183,1,0);
			e.other:AddEXP(500);
			moonstone = moonstone - 1;
		until moonstone == 0
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
