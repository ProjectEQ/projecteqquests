function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.other:HasItem(69960)) then
		if(e.message:findi("hail")) then
			e.self:Say("That looks like an interesting set of beads you have around your hand " .. e.other:GetName() .. ". Where did you get them from?");
		elseif(e.message:findi("camlend")) then
			e.self:Say("Camlend from Qeynos?");
		elseif(e.message:findi("yes")) then
			e.self:Say("I see, I see. Well what brings you and those beads here to Freeport " .. e.other:GetName() .. "? Are you seeking more [" .. eq.say_link("special gems") .. "]?");			
		elseif(e.message:findi("gem")) then
			e.self:Say("I might know of such a gem that would fit inside one of those sockets. A knight in the palace watches it over it. You're welcome to use it if it's for a good cause. Are you [" .. eq.say_link("looking for others") .. "]?");
			eq.create_ground_object(69961,386.77,132.4,2.2,0); --Freeport Prayer Bead, freportn
		elseif(e.message:findi("others")) then
			e.self:Say("Very well, I know it's only one gem but head to the high elf city. I've heard many jewels come from there and you might be able to find some of use for your cause.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end