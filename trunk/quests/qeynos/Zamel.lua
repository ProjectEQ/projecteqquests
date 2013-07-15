function event_spawn(e)
	eq.set_timer("help",300000);
end

function event_timer(e)
	local endicRandom = 0;
	if(e.timer == "help") then
		endicRandom = math.random(100);
		if(endicRandom < 16) then
			e.self:Say("Clean the [aqueducts] they tell me. Peh, they don't pay me enough to climb into that filth!");
		end		
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, good %s.  My name is Zamel and I have the much coveted duty of pulling sludge up out of the pools and [aqueducts] of Qeynos..",e.other:GetName()));
	elseif(e.message:findi("aqueducts")) then
		e.self:Say("Aye, the aqueducts are a horrible place.  I have heard rumors of horrible [beasts] who live under the city in the water and just the other day, a child playing in the water just up and disappeared!");
	elseif(e.message:findi("beasts")) then
		e.self:Say("I know nothing of what or where they may be, just rumors, friend.  However, should you foolishly choose to enter the waters to brave the possibilities and return with some evidence of the [child's] fate, I would be most appreciative.");
	elseif(e.message:findi("child")) then
		e.self:Say("The daughter of one of our own guardsmen is missing.  He has offered me a reward for any information about her disappearance.  So, if you find out anything, let me know and I will cut you in on the reward.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13713})) then
		e.self:Say("Yes,  I do believe this was the child's dress.  Here, take this as your share of the reward.  Her father will be heartbroken..");
		e.other:SummonItem(eq.ChooseRandom(10018,10018,10320));
		e.other:Ding();
		e.other:Faction(36,5,0);
		e.other:Faction(9,5,0);
		e.other:Faction(53,-5,0);
		e.other:Faction(33,-5,0);
		e.other:Faction(217,5,0);
		e.other:GiveCash(0,4,0,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
