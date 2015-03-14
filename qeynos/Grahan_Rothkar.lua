function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. "! What business do you have in the pens of the Qeynos Arena? Have you a report of the [escaped catman]?");
	elseif(e.message:findi("escaped catman")) then
		e.self:Say("We had a catman imprisoned here for use in future gladiator battles. He escaped. In the process, he bit off my assistant's hand which held the key to pen number seven. I now seek to hire a warrior to [retrieve key seven].");
	elseif(e.message:findi("retrieve key seven")) then
		e.self:Say("Hmmm. You seem a bit young, but I shall give you a chance. Seek out the catman named Nomala. He most likely returned to [Kerra Isle]. He is not very powerful, but his people are surely watching over him. Retrieve the key for me and be rewarded.");
	elseif(e.message:findi("kerra isle")) then
		e.self:Say("Kerra Isle is a dangerous place. The Kerra are not a friendly race. There is an island between Erudin and Qeynos which is inhabited by a more docile tribe of Kerra. I hear they took some of their Kerra beetles along with them to the island, too.");
	elseif(e.message:findi("second escaped gladiator")) then
		e.self:Say("It appears our prize gladiator has escaped. He is a minotaur hero!! Trained by our best. He took down five of our greatest warriors during his escape. Rumor has it he fled to his homeland in the Steamfont Mountains. They say he is an outcast and does not live with his people. He appears during times of great need to champion the minotaurs. Return his shackles to me and glory is yours!!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20031})) then
		e.self:Say("I thank you. I must admit I had my doubts, but you have proven yourself a true warrior. I salute you. You can be of some assistance to me.It see ms as though there has been a [second escaped gladiator] and I have a reward waiting for a human warrior.");
		e.other:SummonItem(5033);
		e.other:Ding();
		e.other:Faction(311,1,0); -- Steel Warriors
		e.other:Faction(135,1,0); -- Guards of Qeynos
		e.other:Faction(53,-5,0); -- Corrupt Qeynos Guards
		e.other:Faction(105,-5,0); -- Freeport Militia
		e.other:Faction(184,1,0); -- Knights of Truth
		e.other:AddEXP(10000);
		e.other:GiveCash(0,0,0,2);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12188})) then
		e.self:Say("You are a true Steel Warrior!! Now you shall wear my hero bracers. I designed them for my greatest gladiators and you have shown yourself mighty enough to wear them.");
		e.other:SummonItem(12189);
		e.other:Ding();
		e.other:Faction(311,1,0); -- Steel Warriors
		e.other:Faction(135,1,0); -- Guards of Qeynos
		e.other:Faction(53,-5,0); -- Corrupt Qeynos Guards
		e.other:Faction(105,-5,0); -- Freeport Militia
		e.other:Faction(184,1,0); -- Knights of Truth
		e.other:AddEXP(10000);
		e.other:GiveCash(0,0,0,2);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13398})) then
		e.self:Say("I salute you. You have done well and crossed into the brotherhood of the Steel Warriors. Welcome. Take this. It is the mark of a Steel Warrior. Live the way of the warrior.");
		e.other:SummonItem(13229);
		e.other:Ding();
		e.other:Faction(311,15,0); -- Steel Warriors
		e.other:Faction(135,1,0); -- Guards of Qeynos
		e.other:Faction(53,-5,0); -- Corrupt Qeynos Guards
		e.other:Faction(105,-5,0); -- Freeport Militia
		e.other:Faction(184,1,0); -- Knights of Truth
		e.other:AddEXP(8000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18894})) then
		e.self:Say("So you are ready to encounter your final test. I wish you well, young warrior. Take this key to the pen on the left along the wall with three doors. There you shall meet your final challenge. Return with proof of victory. Exit before it is at an end and I shall not help you.");
		e.other:SummonItem(20029);
		eq.unique_spawn(1303,0,0,-520,-120,-24.5);
		eq.set_timer("goaway",600000);
		e.other:Ding();
		e.other:AddEXP(2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "goaway") then
		eq.signal(1303,1);
	end
end

-- quests/qeynos/Grahan_Rothkar.pl 