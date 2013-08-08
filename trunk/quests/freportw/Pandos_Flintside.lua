local Bakery = 0;

function event_say(e)
	if(Bakery == 0) then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings! Please move along. I am not paid to converse with strangers... unless of course you have a muffin or two..?");
		elseif(e.message:findi("brownloe bakery")) then
			e.self:Say("Oh, yes! That is close by. I am sure Lady Shae will be fine for just a minute. I will just run there and run back. Thanks, friend!");
			eq.start(85); -- Move toward Brownloe Bakery
			eq.set_timer("Pandos",5000);
			Bakery = 1;
		end
	end
end

function event_trade(e)
	local muffin = 0;
	local item_lib =require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13014,item2 = 13014,item3 = 13014,item4 = 13014})) then
		muffin = 4;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13014,item2 = 13014,item3 = 13014})) then
		muffin = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13014,item2 = 13014})) then
		muffin = 2;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13014})) then
		muffin = 1;
	end
	
	if(muffin > 0) then
		repeat
			e.self:Say("Mmmm. This smells delicious. Oh great!! No milk!! Don't you have any sense?! Just tell me the name of the bakery and I will run and get it myself. I am sure Lady Shae will be safe.");
			e.other:Ding();
			e.other:Faction(43,5,0); -- Clerics of Tunare
			e.other:Faction(99,5,0); -- Faydark's Champions
			e.other:Faction(178,5,0); -- King Tearis Thex
			e.other:Faction(304,5,0); -- Soldiers of Tunare
			e.other:Faction(63,-10,0); -- Crushbone Orcs
			e.other:AddEXP(25);
			muffin = muffin - 1;
		until muffin == 0
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();

	if(xloc == -693 and yloc == -279 and Bakery == 1) then
		Bakery = 2;
		eq.pause(60);
		e.self:Say("I sure could use some of those famous muffins you make!");
		eq.signal(9088,1,10000);
	elseif(xloc == -497 and yloc == -204 and Bakery == 2) then
		eq.stop();
		eq.stop_timer("Pandos");
		Bakery = 0;
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Thank you very much! These look delicious. Well, I need to get back to duty. I'll be back tomorrow!");
		eq.signal(9088,2,10000);
	elseif(e.signal == 2) then
		eq.resume();
	elseif(e.signal == 3) then
		e.self:Say("Yes, Lady Shae.");
		eq.signal(9058,3);
	end
end

-- End of File, Zone:freportw -- Pandos_Flintside