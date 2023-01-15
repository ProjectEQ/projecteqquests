-- items: 18744, 13561
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the shrine of the Dismal Rage.  May [Innoruuk] guide your every move in life.  Here. we will teach you to release your rage unto the world.  My priests are at your disposal.");
	elseif(e.message:findi("innoruuk")) then
		e.self:Say("You do not even know the name of the Prince of Hate! That is a crime in here. Our god Innoruuk speaks with Pietro Zarn himself. It was Innoruuk who told him to create the Dismal Rage. You should speak with our family. Perhaps someone will help you better understand our beliefs.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18744})) then -- A tattered note
		e.self:Say("Here we find a new follower.. Here we find a tunic of the Dismal Rage. Put the two together and let the hate grow. Let it be known from now on that your soul belongs to the Prince of Hate, Innoruuk. It is his power which flows within you. Destroy all those who oppose us. Please introduce your hate to the others in this shrine.");
		e.other:SummonItem(13561); -- Faded Crimson Tunic
		e.other:Ding();
		e.other:Faction(271,100,0); -- Dismal Rage
		e.other:Faction(281,-15,0); -- Knights of Truth
		e.other:Faction(296,20,0); -- Opal Dark Briar
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

