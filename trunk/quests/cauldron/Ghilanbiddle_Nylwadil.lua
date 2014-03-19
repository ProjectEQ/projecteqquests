function event_say(e)
	fac = e.other:GetFaction(e.self);
	random_result = math.random(100);
	
	if(fac < 7) then
		if(e.message:findi("hail")) then
			if(random_result <= 50) then
				e.self:Say("Hail!! You are welcome to rest here.");
				eq.signal(70007,5);
			else
				e.self:Say("What business do you have here?!! Trying to keep safe? Expecting us to fight your battles? Bah!!");
			end
		elseif(e.message:findi("chalice of conquest")) then
			e.self:Say("Looking for the chalice, are you? Ha!! I don't know where it is, but I know a [lost soul] who does and he could lead you right to it. He had a taste of it and now he can't get enough. He is sort of under the weather, or do I mean under the ground? Ha!!");
		elseif(e.message:findi("lost soul")) then
			e.self:Say("The orc named Captain Klunga knows where it's buried. Unfortunately, his time on Norrath has passed. I happen to know two things... one, he is buried somewhere in this territory and two, I can [raise Klunga] and he can show you where the chalice is.");
		elseif(e.message:findi("raise klunga")) then
			e.self:Say("I can raise Captain Klunga if I have a portion of his blood, an item he once owned and the most important part, 100 gold coins!! Hehe!! A gnome's got to make a living, you know?");
		end
	else
		e.self:Say("You dare to speak to a member of the Eldritch Collective!! You had best leave before you find your soul displaced from your body.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12280,item2 = 18946,gold = 100})) then
		e.self:Say("Biggily boo, biggily borc.. Raise that stinky orc!! Bamm!! Okay!! It's done. Now all you have to do is find him in the spot where his soul left him and give him an orc shovel. Oh!! I didn't mention that? Oh, well. I'm sure you can find one.. somewhere. Now, get lost before I turn you into a toad!");
		e.other:Ding();
		e.other:Faction(91, 25,0);
		e.other:Faction(71, -25,0);
		e.other:Faction(322, -25,0);
		e.other:Faction(115, 25,0);
		e.other:Faction(176, 25,0);
		e.other:AddEXP(18000);
		eq.spawn2(70072, 0, 0, -2133.49, -727.05, 154.86, 0);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_signal(e)
	e.self:Say("Ha!! One like that one stands no chance within this realm. The goblins shall skin him alive!!");
	eq.signal(70005, 5);
end

-- EOF Ghilanbiddle Nylwadil