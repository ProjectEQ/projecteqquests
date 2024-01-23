--Intermediate Magic Manual
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:DoAnim(70);
		if(e.other:HasItem(28795)) then
			e.self:Say("I see by the beginner manual you carry that you are on the right track. Let us continue your lessons, shall we? Magic can be a susceptible, yet volatile force sometimes, especially when wielded in the hands of dark beings. I fear there is one such being in particular that seeks to damage the very foundation of our mystic abilities, an ugly warrior by the name of Vhaksiz the Shade. He calls the Plane of Nightmares his home. You must seek this foul creature out and acquire proof of his demise: his dark, sinister heart. Bring it to me along with your Beginner's Magic Manual.");
		else
			e.self:Say("Welcome.  You stand inside the meeting hall for the Selia district. a most beautiful section of New Tanaan if there ever was one.  Although I do miss the adventuresome streets of Shar Vahl. my home. it just can't compare to the serene beauty of this place.  Back home I was a teacher of the mystic arts. and ever since arriving to this land my knowledge has increased tenfold.  If you seek to gain a better understanding of the ways of magic. see me again sometime when you have elevated your ability to a higher degree.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 28795, item2 = 28801})) then--Beginner Magic Manual, Heart of Vhaksiz
		e.self:Say("I say, " .. e.other:GetCleanName() .. ", you have certainly proven yourself, and I am quite proud of you. I believe your time has come, take this and when you are ready, speak to Zalil Nyvin. And remember, difficult tasks are put in our way not to stop us, but to call out our strength and resolve.");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,math.random(10),math.random(10),math.random(0,10),28796,500000);--Intermediate Magic Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
