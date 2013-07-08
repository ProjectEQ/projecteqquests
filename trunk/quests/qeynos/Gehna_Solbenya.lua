function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings and blessings to you, %s. Karana offers you his protection and guidance. All who accept the offer shall find safe haven within our Temple of Thunder, If you are a cleric of Karana, you must have a [desire to serve Karana]'s flock.",e.other:GetName()));
	elseif(e.message:findi("serve karana")) then
		e.self:Say("If you are a young acolyte, you may [deliver blessings to the flock] and if you are a skilled cleric, we need you to [hunt bandit binders].");
	elseif(e.message:findi("blessings to the flock")) then
		e.self:Say("Then go to the Plains of Karana. It is there that the blessings are needed. Ask every resident of the plains if they are followers of Karana. If they are, then ask them if they [require Karana's blessings]. Let them drink from this temple chalice. Return the empty chalice to me and you shall never go thirsty again.");
		e.other:SummonItem(12103);
	elseif(e.message:findi("hunt bandit binders")) then
		e.self:Say("Go to the Plains of Karana and seek out the Karana Bandits. Among them can be found their bandit binders. They are healers of sorts. Which evil deity granted them this power is unknown to us. Each carries a binder spectacle. I shall reward clerics for every two returned spectacles. Perhaps a new power may even be bestowed.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12104})) then
		e.self:Say("You have done a good service for the flock of Karana. Study the words upon this scroll and soon Karana shall keep you from thirst.");
		e.other:Ding();
		e.other:Faction(183,5,0);
		e.other:Faction(21,-10,0);
		e.other:Faction(257,5,0);
		e.other:Faction(135,5,0);
		e.other:AddEXP(500);
		e.other:GiveCash(16,9,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12101,item2 = 12101})) then -- spectacle
		e.self:Say("The bounty will not be paid until two spectacles are received.");
		e.self:Say("Excellent work. These foul men have no right to be proficient in the ways of healing. Here then is your bounty. Use it in your continued war against the Karana bandits.");
		e.other:Ding();
		e.other:Faction(183,5,0);
		e.other:Faction(21,-10,0);
		e.other:Faction(257,5,0);
		e.other:Faction(135,5,0);
		e.other:AddEXP(500);
		e.other:GiveCash(0,1,3,1);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
