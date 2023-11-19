function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Greetings!  Keep your eyes open for trouble.  Along with the honor of standing under the banner of the Wayfarers Brotherhood comes the [" .. eq.say_link("responsibility") .. "] to the brotherhood.");
	elseif e.message:findi("responsibility") then
		e.self:Say("We are only responsible to each other.  At least under ordinary circumstances.  Because we, as a brotherhood, have decided to fight this battle, we may also have taken on the responsibility of saving the world.  I'm not sure if I truly believe that there is such a great risk.  After all, we have managed to defeat the very gods, what could challenge us?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end