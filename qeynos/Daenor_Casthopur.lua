function event_say(e)
	local fac = e.other:GetFaction(e.self);
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Ah, hello there, %s, and welcome to the Hall of Sorcery! I'm Daenor, a wizard of the Order of Three. I can help you practice your skills and learn some new ones.",e.other:GetName()));
	elseif(e.message:findi("neclo")) then
		if(fac < 6) then
			e.self:Say("Neclo Rheslar is an old friend of mine. Right now, he's out working in the Qeynos Hills. In fact, if you have some free time, you should go out and meet him. Here, if you go, take this note to him for me. Thanks, friend.");
			e.other:SummonItem(18823);
		else
			e.self:Say("The Order of Three has been monitoring your recent activities, and we are appalled by you and your actions! Now, begone!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
