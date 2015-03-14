function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You seek Cinium Darkblade, do you? Find me you have. Often I am here. To test my [Wasp Poison], yes. Less Aqua Gobs there now are. Ha!! A true rogue am I with no leader or guild. Just the wind and shadows and much treasure to be had.");
	elseif(e.message:findi("wasp poison")) then
		e.self:Say("Giant Wasp Venom made from the Giant Wasp Venom Sacs. An interest in poison we share? Need the insect venom you do. It comes not cheap.  My time is precious, my talent supreme.. 30 Gold is my price and also provide me with three Giant Wasp Venom Sacs.");
	elseif(e.message:findi("who once owned it")) then
		e.self:Say("The human who gave me the axe remains nameless. We were separated during the battle. If he ever got out of there with all his gold, I do not know. The only clue I know of is the axe itself. The words 'Top of the World' were once printed on its handle.");
	elseif(e.message:findi("top of the world")) then
		e.self:Say("High in the pass you can find Top of the World. It sits near the highest bridge. It is one of the newest additions to our community. It specializes in imported items for adventuring.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13260,item2 = 13260,item3 = 13260,gold = 30})) then
		e.self:Say("Take the giant wasp venom. Good or evil it is not. That is up to you.");
		e.other:SummonItem(14032);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18955})) then
		e.self:Say("So Lon has sworn allegiance to a temple. What a fool, but he is a skilled fool. My word is my bond and if he asks for the gem, then so be it. Unfortunately I traded it for a much-needed axe. It was in the middle of a dungeon and... well, that is a long story. If you want to get the gem, take this axe back to the [one who once owned it].");
		e.other:SummonItem(12366);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF Conium Darkblade