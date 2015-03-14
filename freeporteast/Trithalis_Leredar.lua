function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I am Trithalis Leredar. I am the first amongst us to create a set of robes that is very powerful. Using my ability to research and tailoring I have sewn mystical patterns into the robe. This infuses the robes with a great power. If you would like to try to do this yourself I will give you some of the patterns that I have been using. Let know if you need a rob pattern. If you need a book detailing the steps I took to create the robes I have them for a small fee.");
	elseif(e.message:findi("robe pattern")) then
		if(e.other:Race() == "Human") then
			e.self:Say("As you wish, here is the pattern to tailor the robe.");
		else
			e.self:Say("I only share the pattern with those that deserve it. You may walk amongst us but you will never truly be from our race. Begone.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Trithalis_Leredar