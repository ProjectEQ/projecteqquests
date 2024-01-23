--Advanced Combat Manual

function event_say(e)
	if(e.message:findi("Hail")) then
		if(e.other:HasItem(28790)) then
			e.self:Say("Good day to you, " .. e.other:GetCleanName() .. ". By the looks of things you have learned quite a bit about planar combat already, but if you wish to be truly knowledgeable on the subject, there is one last course you must undertake. Using your newfound courage and bravery, you must collect for me a Sandstorm Gem, a Rage Filled Gem, and a Blue Diamond. Bring me these items along with your Intermediate Combat Manual. And remember, unless you have the moral nerve to live out your convictions, they are of little account.");
		else
			e.self:Say("Good day to you, " .. e.other:GetCleanName() .. ". Are you new to this cirty or have you been a long time resident? I'm afraid I do not get to run about and explore like I used to, as my studies keep me quite busy. If you have the time and inclination, I would suggest you explore the land some more. Then perhaps one day when you return, you will be redy to learn what I have to teach you.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetLevel() > 19 and item_lib.check_turn_in(e.trade, {item1 = 22503, item2 = 26697, item3 = 9421, item4 = 28790})) then--Blue Diamond, Rage Filled Gem, Sandstorm Gem, Intermediate Combat Manual
		e.self:Say("I must say, this is a surprise. I was beginning to wonder if you would ever return with these. I'm glad you see you have though. Take this new book and use it well in your future journeys. You may also be interested to know that Tenada Jeried also has a few lesson plans for very advanced students. If you should see him, be sure to tell him you are interested in learning from him. Good luck to you, " .. e.other:GetCleanName() .. "!");
		e.other:QuestReward(e.self,0,math.random(10),math.random(10),math.random(0,5),28791,500000); --Advanced Combat Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
