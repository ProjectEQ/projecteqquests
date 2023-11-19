function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello.  My name is Noita.  I just arrived here a day ago.  I have come to hopefully work on creating some [new armor designs].");
	elseif e.message:findi("new armor designs") then
		e.self:Say("Well I work mainly with cloth and animal hides.  I have come here to see if there were any new creations I could make.  So far I have found one [creature] whose hide has proved to be very durable.");
	elseif e.message:findi("creature") then
		e.self:Say("I was exploring the beach earlier today, and saw a creature that had a wolf-like appearance, but it was larger than any wolf I have ever seen.  The creature proved to be quite vicious, but I was able to dispatch it.  The hide I acquired made a very nice pair of boots, suitable for any adventurer.  If you could perhaps bring me one boot pattern and three flawless hides from these creatures, I could attempt to make you a pair of these boots.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 13812, item2 = 55568, item3 = 55568, item4 = 55568}) then -- Items: Boot Pattern, Flawless Hynid Hide x3
		e.self:Say("Excellent. Hopefully I can make the same boots I did earlier.' Noita takes out her sewing kit and begins to skillfully sew the hides together. It doesn't take her long before you start to see the hides taking the familiar shape of a pair of boots. 'Here you go. These boots might be even better than the ones I made earlier. I hope they serve you well.");
		e.other:QuestReward(e.self,0,0,0,0,55569,eq.ExpHelper(42)); -- Hynid boots
	end

	item_lib.return_items(e.self, e.other, e.trade)
end
