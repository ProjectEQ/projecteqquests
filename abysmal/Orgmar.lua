function event_say(e)
    if e.message:findi("Hail") then
        e.self:Say("You have got ta help me, lad! That ghost there in the corner won't [leave] me alone! Where ever I go he follows me!");
    elseif e.message:findi("leave") then
        e.self:Say("I think I took somethin' o' his and he wants it back. Ya got ta [help] me get rid of this ghost, lad! I taint slept in over a fortnight.");
    elseif e.message:findi("help") then
        e.self:Say("I went explorin' one day in some sewers in the new land. I came across a rottin' satchel on the ground. Inside were some strange gems. I couldn't resist. I took the satchel back here to me room. A day or two later, this ghost appeared. Scared me out o' me chainmail it did. It kept moanin' about wantin' its satchel back. I didn't know what ta do so I went back to the sewers and chucked it into the water. Thought it might appease it or somethin'. That didn't work though and the darn ghost still comes back. Please find the satchel and bring it back ere. Maybe if I can give the satchel to the ghost, it will make him go away for good!");
    end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 55621}) then -- Item: A rotting Satchel
		e.self:Say("Ye done a good deed this day, me friend. Not that I am scared of ghosts or anything. Take this as your reward. I found it on one of me adventures in the new land. I know it be a bit gruesome lookin', but it has some magic power. Now to see if I can get rid o' this ghost. Farewell.");
		e.other:QuestReward(e.self,0,0,0,0,55622,eq.ExpHelper(52)); -- Item: Gouged Out Ukun Eye
	end

	item_lib.return_items(e.self, e.other, e.trade)
end