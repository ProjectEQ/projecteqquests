--Xasri_Virek.pl
--Intermediate Combat Manual

function event_say(e)
	if(e.message:findi("Hail")) then
		if(e.other:HasItem(28788)) then
			e.self:Say("Welcome my student. I see you have brought with you the Beginner's Manual. If you are ready for your next lesson, the task is simple. A vicious terror has awoken somewhere in the Plane of Innovation. You must seek out the Junk Beast and bring me its power source along with your Beginner Combat Manual. Doing this will prove your battle courage above all else. Remember, the gem cannot be polished without friction, nor man or lizard perfected without trials. I wish you luck.");
		else
			e.self:Say("Hail. and welcome to the Kartis meeting hall.  I trust you are keeping busy here in New Tanaan?  It is truly a wonderful city. there are many interesting new things to discover here.  I came here from my home of Cabilis long ago. but I could not dream of returning now.  My life is here. wading in the font of knowledge that this place has to offer.  Hopefully I will be able to help you discover your own knowledge one day.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28788, item2 = 29145})) then --Beginner Combat Manual, Junk Beast Power Source
		e.self:Say("Very impressive, " .. e.other:GetCleanName() .. ". This proves you have clearly graduated to the next phase of training we have to offer. Keep this book by your side and speak to Gwiraba Gelrid when you are ready for your next lesson.");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,math.random(5),0,0,28790,500000);--Intermediate Combat Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
