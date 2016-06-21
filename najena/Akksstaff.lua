function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["ask_minion_dead"] ~= nil and e.message:findi("hail") ) then
		e.self:Say("How is this possible? I cannot be defeated. Spare my life and I will tell you the truth of Magi'kot's [" .. eq.say_link("demise") .. "].");
	elseif(qglobals["ask_minion_dead"] ~= nil and e.message:findi("demise") ) then
		e.self:Say("I am the last Council Member of the Order of the Elemental Shadows. For Centuries, we protected the true secrets behind elemental mastery, but our sect dies here with me. I chose to sit at Magi'kot's side and watch his progress, he showed more promise than anyone since Tvish. When I learned he was to receive the Orb of Mastery, I sabotaged his spell. The flaw was not his, but now people have succeeded where he failed. It doesn't matter, even with the power of the Orb and the knowledge in these tomes, Bantil will never unlock the full power of elemental mastery. You are only helping him to meet the same fate as Magi'Kot.' He then hands you the book and fades into the shadows.");
		e.other:SummonItem(15778);
	elseif(e.message:findi("hail")) then
		e.self:Say("What do you want?! Foolish "..e.other:Race() ..", I am in no mood to treat with beggars. I have half a mind to turn my pet here loose on you! Well, don't keep me waiting, state your business or be off with you!");
	elseif(e.message:findi("tell me about magi'kot")) then
		e.self:Say("Ah, that I can help you with. Magi'kot was a powerful elementalist, able to control the power of the elements which surrounded him. He was not able to fully master the elements when I was learning from him, but soon after my departure I heard rumors that he was going after the Orb of Mastery. At the time, I did not feel he was ready to harness all the elements, but Magi'kot listened to no one. He was in search of power beyond any held by a mortal. Do you wish to hear more?");
	elseif(e.message:findi("wish to hear more")) then
		e.self:Say("Then bring me the torn pages of Mastery, there are four pages that can be found upon the women In this keep, though have a care, Najena's followers guard her treasures carefully, and delight in punishing trespassers.");
	elseif(e.message:findi("bantil sent me") and qglobals["mage_epic"] >= "5") then
		e.self:Say("My, you are persistant aren't you? Well you have found more trouble than you expected, now haven't you? Prepare to witness the true power of a master of the elements!");
		eq.spawn2(44108,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	
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