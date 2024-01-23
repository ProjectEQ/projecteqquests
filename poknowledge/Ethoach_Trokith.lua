--Advanced Stealth Manual

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:DoAnim(70);
		if(e.other:HasItem(28793)) then
			e.self:Say("Good day, " .. e.other:GetCleanName() .. ". It would appear you have learned much about the art of stealth already, and this is good. Are you ready to learn more? If so, listen closely. To graduate to the next level of precision and cunning you need to discover a few items. Bring forth a Blizzard Gem, a Symbol of the Diaku, a Blue Diamond, and your Intermediate Stealth Manual. I feel this will be an adequate test of your skill at this stage in your development. Good luck!");
		else
			e.self:Say("Good day, " .. e.other:GetCleanName() .. ". The pursuit of knowledge above all else is most important. It is good to see one such as yourself partaking in that pursuit simply by coming to me for guidance. I am afraid however that I must reject you, for you do not appear to be ready to learn what I have to offer. Please understand I mean no ill by this and I wish to see you again sometime when you are truly capable of my teachings.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetLevel() > 19 and item_lib.check_turn_in(e.trade, {item1 = 22503, item2 = 9423, item3 = 26709, item4 = 28793})) then--Blue Diamond, Blizzard Gem, Symbol of the Diaku, Intermediate Stealth Manual
		e.self:Say("Astounding! This certainly proves you are worth far more than you appear. Take this book, it can teach you many new things. Also know this, Tenada Jeried is available for further study, and only for advanced students such as yourself. Be sure to visit him and tell him you are interested in learning from him. Take care, " .. e.other:GetCleanName() .. ".");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,math.random(5),math.random(5),0,28794,500000); --Advanced Stealth Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
