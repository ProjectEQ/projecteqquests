function event_waypoint_arrive(e)
	if(e.wp == 3) then
		e.self:Say("Greetings, sister! I just wanted to make sure no harm had befallen you.");
		eq.signal(4052,5);
		e.self:SetRunning(true);
	elseif(e.wp == 4) then
		e.self:SetRunning(false);
	elseif(e.wp == 7) then
		eq.set_anim(4055,1);
	end
end

function event_signal(e)
	e.self:Say("But, you will always be my little sister. Fare well, Chanda! See you soon!");
end

function event_say(e)
	local fac = e.other:GetFaction(e.self);
	
	if(fac < 6) then
		if(e.message:findi("hail")) then
			e.self:Say("Hello, there. My name is Baobob Miller. My [sister] and I are the best tanners in all of Norath. Wolves are my specialty. A nice wolf skin [garment] would be the perfect accessory to your stylish ensemble.");
		elseif(e.message:findi("sister")) then
			e.self:Say("My little sister Chanda is the second best tanner around!. Seriously though, she is a very skilled artisan and people travel far and wide to acquire one of her fine bear skin cloaks. I am proud of her. She doesn't really like to meet new people, but if you tell her [Baobob sent you], I am sure she can help get you into some nice bear skin boots.");
		elseif(e.message:findi("garment")) then
			e.self:Say("I make the finest wolf skin [boots],[cloaks] and [belts] in all of Antonica.");
		elseif(e.message:findi("boot")) then
			e.self:Say("If you can bring me a wolf skin of medium quality and pay me a fee of say.. hmmmm.. for you.. 15 gold pieces, I think I can make you a pair of boots that will make all of Qeynos envy you.");
		elseif(e.message:findi("cloak")) then
			e.self:Say("Yes! One of my wold skin cloaks would go very well with your.. eeerr.. style.. Ahem! Let's see.. I think I can get you into one for 21 gold pieces, but, you have to provide the skin, and I make my cloaks with only the highest quality wolf skins.");
		elseif(e.message:findi("belt")) then
			e.self:Say("Belts are far more forgiving than cloaks or boots. A lesser quality pelt and 5 gold pieces would get you a nice wolf-hide belt.");
		end	
	else
		e.self:Say("Hmm.. I really would not feel comfortable helping you in that way. You need to prove yourself to me by aiding my friends and family in the Plains of Karana before I will help you.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13755, gold == 21})) then
		e.self:Say("Good work! Now have you the rest of what I require?");
		e.self:Say("Here ya go! That should keep ya nice and warm! Be sure to tell all the friends you're going to impress where you got this fine cloak. Although I am sure they probably have heard of me already.");
		e.other:SummonItem(2905);
		e.other:Ding();
		e.other:Faction(167,1,0); -- Karana Residents
		e.other:Faction(135,1,0); -- Guards of Qeynos
		e.other:Faction(257,1,0); -- Priests of Life
		e.other:Faction(183,1,0); -- Priests of Life
		e.other:AddEXP(500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13754, gold == 15})) then
		e.self:Say("Good work! Now have you the rest of what I require?");
		e.self:Say("They are exquisite, if I do say so myself. Hope they fit.");
		e.other:SummonItem(2906);
		e.other:Ding();
		e.other:Faction(167,1,0); -- Karana Residents
		e.other:Faction(135,1,0); -- Guards of Qeynos
		e.other:Faction(257,1,0); -- Priests of Life
		e.other:Faction(183,1,0); -- Priests of Life
		e.other:AddEXP(500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13753, gold == 5})) then
		e.self:Say("Good work! Now have you the rest of what I require?");
		e.self:Say("I hate working with such low quality hides. They lack the sheen that makes a high quality pelt look so fine! Anyhow, here's your belt.");
		e.other:SummonItem(2907);
		e.other:Ding();
		e.other:Faction(167,1,0); -- Karana Residents
		e.other:Faction(135,1,0); -- Guards of Qeynos
		e.other:Faction(257,1,0); -- Priests of Life
		e.other:Faction(183,1,0); -- Priests of Life
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
