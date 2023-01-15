-- items: 22298, 13279, 13121, 22293, 22294, 22295, 22296, 22297, 22299
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I would love to chat with you, but I just realized something.. I do not waste time with whelps.");
	elseif(e.message:findi("lens")) then
		e.self:Say("So you seek the Spare Lens. Yes. I have it. There are only two ways you can obtain it, [fight] the great Zenita or [play a game of chance].");
	elseif(e.message:findi("play a game of chance")) then
		e.self:Say("Great. It is rather simple. I have five cards and only one is King Naythox. Find it. In order to get one card all you need to do is buy me a bottle of Innoruuks Kiss of Death from the barkeep in Chops N Hops. One bottle for one card. Return the King Naythox card to me and you shall get the Spare Lens.");
	elseif(e.message:findi("fight")) then
		e.self:Say("Darn!! I was hoping not to hear that word, fight. Oh well.");
		eq.attack(e.other:GetName());
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 22298})) then
		e.self:Say("Why I will be.. You got it!! I thought I took it out of the deck. Very well. You win the Spare Lens fair and square. Here you are. Now get out of my sight.");
		e.other:SummonItem(13279); -- Phiz's lens
		e.other:Ding();
		e.other:AddEXP(500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13121})) then
		e.self:Say("Let see what card you pulled.");
		e.other:SummonItem(eq.ChooseRandom(22293,22294,22295,22296,22297,22298,22299)); -- Item(s): Castle Card (22293), Beggar Card (22294), Joker Card (22295), Wild Card (22296), Queen Card (22297), King Card (22298), Knight Card (22299)
	elseif(item_lib.check_turn_in(e.trade, {item1 = 22299} or {item1 = 22297} or {item1 = 22296} or {item1 = 22294} or {item1 = 22293})) then
		e.self:Say(string.format("Bad luck must be one of your strong suits. You should have been a beggar because you sure aren't a very good %s. You lose!",e.other:Class()));
	elseif(item_lib.check_turn_in(e.trade, {item1 = 22295})) then
		e.self:Say(string.format("I see you have drawn the card that best represents a %s such as yourself. You lose!",e.other:Race()));
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte  ID:10153 -- Zenita_DRin
