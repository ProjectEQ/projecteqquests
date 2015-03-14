--BeginFile: eastkarana\Nella_Taraiss.lua (15190)
--Quest file for East Karana - Nella Taraiss: By the Stones

function event_say(e)
	if(e.message:findi("hail")) then
		if(eq.is_task_activity_active(139,2)) then
			e.self:Say("Thanks for contacting me. Your information on this matter has been most useful.");
			e.self:Message(15, "The search for the Morticalidon won't end, not as long as entrepid explorers like you are on the trail. With this type of creature, you never know when or where you'll find it, but one thing is for sure -- finding this creature will be the most rewarding experience you'll ever have. In the meantime, here's payment for the time you spent searching.");
		end
	else
		e.self:Say(string.format("Hello, %s.",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

--EndFile: eastkarana\Nella_Taraiss.lua (15190)