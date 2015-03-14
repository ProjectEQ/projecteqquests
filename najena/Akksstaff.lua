function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What do you want?! Foolish $race, I am in no mood to treat with beggars. I have half a mind to turn my pet here loose on you! Well, don't keep me waiting, state your business or be off with you!");
	elseif(e.message:findi("tell me about magi'kot")) then
		e.self:Say("Ah, that I can help you with. Magi'kot was a powerful elementalist, able to control the power of the elements which surrounded him. He was not able to fully master the elements when I was learning from him, but soon after my departure I heard rumors that he was going after the Orb of Mastery. At the time, I did not feel he was ready to harness all the elements, but Magi'kot listened to no one. He was in search of power beyond any held by a mortal. Do you wish to hear more?");
	elseif(e.message:findi("wish to hear more")) then
		e.self:Say("Then bring me the torn pages of Mastery, there are four pages that can be found upon the women In this keep, though have a care, Najena's followers guard her treasures carefully, and delight in punishing trespassers.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 28027,item2 = 28028,item3 = 28029,item4 = 28030})) then
		e.self:Say("Very well. Take these words back to that shriveled old gnome, Rykas, if you wish to complete this quest. Now leave me, $name, it sickens me to be this cordial for so long. And my pet needs exercise. Go!");
		e.other:Ding();
		e.other:SummonItem(28004);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone: najena  ID:44063 -- Akksstaff