function event_spawn(e)
	eq.set_timer("fishing",300000);
end

function event_timer(e)
	e.self:Say("Whoo!!! I think I got a [bite]! Darn.. Seaweed.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh.. Hiya, I'm just out here fishing, since I can't find a job. I hope this [bait] I just bought catches me a big ol' fish.");
	elseif(e.message:findi("bait")) then
		e.self:Say("I use Captain Rohand's Secret Recipe Super Magic Catch-A-Lot brand bait. I bought my pole from Sneed's up by the north pond.");	
	elseif(e.message:findi("tacklebox")) then
		e.self:Say("Oh. That mean [dwarf], Trumpy, just knocked my tacklebox into the water. Could you please get it for me? I can't swim.");	
	elseif(e.message:findi("dwarf")) then
		e.self:Say("His name is Trumpy. He is one of those [Irontoes] I think. I've seen him hanging out in the Fish's Ale. I don't know why he likes to torment me.");
	elseif(e.message:findi("irontoes")) then
		e.self:Say("Ah! The Irontoes are a rough bunch of dwarves from Kaladim. The seem to get quite drunk on a frequent basis.");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Oh, hi, Beren. Not too good so far. That [dwarf] keeps bothering me, too.");
		eq.signal(1090,2);
	elseif(e.signal == 2) then
		e.self:Say("Huh? What? My [tacklebox]? You know I can't swim, you rotten [dwarf]!");
		eq.signal(1042,2,10000);
	elseif(e.signal == 3) then
		e.self:Say("My name is not Skippy.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13702})) then
		local randomcopper = math.random(20);
		e.self:Say("Thank you so much!  If you want some free advice, steer clear of those [Irontoes]! They are nothing but trouble. Here, It's not much but I must thank you somehow.");
		e.other:Ding();
		e.other:SummonItem(13129); -- Hurrieta's Tunic
		e.other:Faction(135,4,0); -- Guards of Qeynos
		e.other:Faction(9,4,0); -- Antonius Bayle
		e.other:Faction(53,-5,0); -- Corrupt Qeynos Guards
		e.other:Faction(33,-5,0); -- Circle Of Unseen Hands
		e.other:Faction(21,4,0); -- Merchants of Qeynos
		e.other:AddEXP(200);
		e.other:GiveCash(randomcopper,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
