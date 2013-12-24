function event_combat(e)
	if(e.joined == true) then
		e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
	end
end

function event_say(e)
	if(e.other:GetLevel() >= 20 and e.other:GetLevel() <= 30) then
		if(e.message:findi("hail")) then
			e.self:Say(string.format("Oh, hello %s. Would you like to assist me in a [task]?",e.other:GetName()));
		elseif(e.message:findi("task")) then
			e.self:Say("Excellent! I was hoping you would be able to help me.");
			eq.task_selector(143); -- Task: Bringing Goods to the Karanas
		end
	else
		e.self:Say(string.format("Sorry, %s. I am quite busy...",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end