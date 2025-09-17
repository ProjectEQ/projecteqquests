-- items: 12268, 7100
function event_spawn(e)
	e.self:SetRunning(true);
end

function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("Stopped, I have. Greet you, I do. What business do we have? Hmm? Speak up!!");
	elseif (e.message:findi("journeyman boot")) then
		e.self:Say("Journeyman's boots are what you seek? Ha!! Those I have upon my feet and disintegrate will they if my life is taken. Extra pair have I, and, possibly, [rare trade] can we make.");
	elseif (e.message:findi("rare trade")) then
		e.self:Say("Three things I call for and journeyman boots are yours. A [shadowed rapier], [ring of the ancients] and gold... 3250 gold coins I call for !! This trade I call.");
	elseif (e.message:findi("shadowed rapier")) then
		e.self:Say("Shadowed men, foes to all, have appeared. Many lands do they walk. Invisible are they, but for the items they wield. Seek them out and return to me a shadowed rapier. Return it with haste before 'poof' goes the rapier!! No time to camp have you.");
	elseif (e.message:findi("ring of the ancients")) then
		e.self:Say("Ancient cyclopes do march the land. Long have they lived and crafted the rings of the ancients. I must have one and you shall go and fetch one for me. Seek the lands of the oldest cyclops clans. Seek the plains, seek the island in tears and search the dunes for there is one who is last. His clan was blown from the sands.");
	end
end

function event_trade(e)
	if (eq.handin({[12268] = 1, [7100] = 1, gold = 3250})) then -- Items: Ring of the Ancients, Shadowed Rapier, Cash: Gold x 3250
		e.self:Say("The time to trade has come!! I am now rich and you are now fast. Take the journeyman boots and run like the wind.");
		e.other:QuestReward(e.self,0,0,0,0,2300,1250);
	elseif (eq.handin({[12268] = 1, [7100] = 1, platinum = 325})) then -- Items: Ring of the Ancients, Shadowed Rapier, Cash: Platinum x 325
		e.self:Say("The time to trade has come!! I am now rich and you are now fast. Take the journeyman boots and run like the wind.");
		e.other:QuestReward(e.self,0,0,0,0,2300,1250);
	end
end