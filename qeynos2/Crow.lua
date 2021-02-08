-- items: 17600, 13901
function event_say(e)

	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Crow's! If you're thirsty, we have a fine selection of brews and ales.");
	end
	
end

function event_trade(e)

	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 17600})) then
		e.self:Say("What are you? The Rat's new bag man? Peh, he is useless. That bum drinks any gold he gets. Here ya go, kid!");
		e.other:Ding();
		e.other:SummonItem(13901); -- Item: Crow's Special Brew
		e.other:Faction(223,10,0); -- +Circle of Unseen Hands
		e.other:Faction(291,-10,0); -- -Merchants of Qeynos
		e.other:Faction(230,10,0); -- Corrupt Qeynos Guards
		e.other:Faction(262,-10,0); -- -Guards of Qeynos
		e.other:Faction(273,10,0); -- Kane Bayle
		e.other:AddEXP(250);
		e.other:GiveCash(0,0,6,0);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
	
end

function event_signal(e)

	if(e.signal == 1) then
		e.self:Say("You ok Sabs?");
		eq.signal(2083, 2); -- NPC: Sabnie_Blagard General Supplies
	elseif(e.signal == 2) then
		e.self:Say("Testing one two three four");
		eq.signal(2083,5); -- NPC: Sabnie_Blagard General Supplies
	elseif(e.signal == 3) then
		e.self:Say("Excellent. To think that he thought he could stroll in here from Highpass and take over my action. He will learn the hard way what happens to merchants who think they can operate here without our support and protection.");
	elseif(e.signal == 4) then
		e.self:Say("Anything you say, my love.");
	elseif(e.signal == 5) then
		e.self:Say("Bwah! Ha! Ha! I love it when he does that! HA HA HA! You are too much, Flynn!");
	end

end
