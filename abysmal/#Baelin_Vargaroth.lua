function event_say(e)
	if e.message:findi("Hail") then
		e.self:Emote("appears to be deeply involved with his work. 'Just a moment,' he says, as he scribbles down what appears to be a new song on a fresh piece of parchment. 'It is nearly finished.' He takes a moment to finish his work, then turns towards you. 'My apologies, friend, I was working on a new song and had to write it down before I had forgotten it! My name is Baelin, is there something I may do for you?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_spawn(e)
	eq.set_timer("flavor", 20 * 60 * 1000); -- Random Emote every 20s
end

function event_timer(e)
	if e.timer == "flavor" then
		e.self:Emote(eq.ChooseRandom("hums a soft tune as he picks at his lute.","hums a catchy, rhythmic tune.","strums his lute, periodically adjusting the knobs at the end, obviously tuning the instrument."));
	end
end
