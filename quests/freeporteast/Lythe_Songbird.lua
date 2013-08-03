function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello %s, Such a beautiful day for music and tales. Don't you think?",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 9590})) then -- Notice to Cease and Desist
		e.self:Say("What's this? It says that you wish me to cease and desist spreading slander about the swashbuckler known as Stanos, or else . . .? You know, I am new in Freeport. Haven't been performing at this venue for long. I'm just a fledgling muse trying to make ends meet in this big city. My father told me that someday I'd have to put up my fists to protect my rights. I can see that day is today. What I have to say to you is . . . Guards, help!");
		e.other:Ding();
		eq.attack(e.other:GetName());
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporteast -- Lythe_Songbird