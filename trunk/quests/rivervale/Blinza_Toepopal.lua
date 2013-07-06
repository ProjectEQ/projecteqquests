function event_spawn(e)
	eq.set_timer("jillin",550000);
end

function event_timer(e)
	if(timer == jillin) then
		e.self:Say("[Jillin]? Jillin? Where did he go? Hrumph!");
	end
end

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say(string.format("Hello. %s.  Welcome to the Fool's Gold!  Cards are upstairs. drinks are down here.  Have fun!", e.other:GetCleanName())); 
	elseif(e.message:findi("jillin")) then
		e.self:Say("Jillin is my courier. He was supposed to take this pot of [stew] over to Deputy Lowmot in Guardian Stronghold. It is just about ready and Mayor Gubbin hates cold stew!"); 
	elseif(e.message:findi("stew")) then
		e.self:Say("Here. Take it to Lowmot. The stew is already paid for but the good Deputy usually tips Jillin quite well. Hurry! It's getting cold!");
		e.other:SummonItem(13959);
	end
end

function event_trade(e)
local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade,  {item1 = 13958})) then
		e.self:Say("Well it is about time!  The mayor gets very upset if he does not have the freshest of carrots in his stew.  Here is the money for the carrots.  Be off with you.  Now. where the heck did [Jillin] go?");
		e.other:GiveCash(1,0,0,0);
		e.other:Faction(77, 1);
		e.other:Faction(218, 1);
		e.other:Faction(31, -2);
		e.other:Faction(33, -2);
		e.other:Faction(48, -2);
		e.other:AddEXP(100);
		e.other:Ding();
	elseif (item_lib.check_turn_in(e.trade,  {item1 = 13957})) then
		e.self:Say("Oh excellent! These carrots are perfect! The finest Reebo has ever sent us. The mayor will be so pleased. Here is the payment for the carrots. Excuse me, but I must finish preparing the stew. Hmm. Where the heck did [Jillin] go?");
		e.other:GiveCash(10,0,0,0);
		e.other:Faction(77, 5);
		e.other:Faction(218, 5);
		e.other:Faction(31, -10);
		e.other:Faction(33, -10);
		e.other:Faction(48, -10);
		e.other:AddEXP(200);
		e.other:Ding();
	elseif (item_lib.check_turn_in(e.trade,  {item1 = 13971})) then
		e.self:Say("What are these?!  I am trying to make stew for the mayor and you bring me ROTTEN CARROTS?!  Have you no sense??  Take these back to Reebo.");
		e.other:SummonItem(13972);
		e.other:Faction(77, -4);
		e.other:Faction(218, -4);
		e.other:Faction(31, 2);
		e.other:Faction(33, 2);
		e.other:Faction(48, 2);
	else
		item_lib.return_items(e.self, e.other, e.trade);
	end
end

--END of FILE Zone:rivervale  ID:19091 -- Blinza_Toepopal
