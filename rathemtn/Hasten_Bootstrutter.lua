-- items: 12268, 7100
function event_spawn(e)
	e.self:SetRunning(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Stopped I have done. Greet you I will. What business do we have? Hmm? Speak up!!");
	elseif(e.message:findi("journeyman boot")) then
		e.self:Say("Journeyman Boots are what you seek? Ha!! I have those upon my feet and disinigrate will they if my life is taken. Extra pair have I and [rare trade] can we make.");
	elseif(e.message:findi("rare trade")) then
		e.self:Say("I call for three things and Journeyman Boots are yours. I call for a [Shadowed Rapier], call for the [Ring of the Ancients] and call for Gold.. 3250 Gold Coins!! This the trade that I call.");
	elseif(e.message:findi("shadowed rapier")) then
		e.self:Say("Shadowed Men, foes to all, have appeared. Many lands do they walk. Invisible are they, but items they wield can be seen. Seek them out and return to me a Shadowed Rapier. Return it with haste before 'poof' goes the rapier!! No time to camp have you.");
	elseif(e.message:findi("ring of the ancient")) then
		e.self:Say("Ancient cyclopes do march the land.  Long have they lived and crafted the rings of the ancients.  I must have one and you shall go and fetch one for me.  Seek the lands of the oldest cyclops clans.  Seek the plains. seek the island in tears and search the dunes for there is one who is last.  His clan was blown from the sands.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 12268, item2 = 7100, platinum = 325})) then
		e.self:Say("The time to trade has come!! I am now rich and you are now fast. Take the Journeyman Boots and run like the wind.");
		e.other:QuestReward(e.self,0,0,0,0,2300,1250);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
