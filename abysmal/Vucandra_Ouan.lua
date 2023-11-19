function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello, traveler. I am Vucandra of the noble city of [Felwithe]. I stand here to fight against those that would destroy such a fair and magical place.");
	elseif e.message:findi("Felwithe") then
		e.self:Say("I left my home as a child. In my youth I tried to distance myself from Felwithe and all that it stood for. I suppose that such rebellion is common, but it is not in my family. It wasn't until I returned home recently that I understood what I was running from, what I was leaving behind. All of the power and knowledge that I have gained over the years mean little to me now if I cannot use them to [protect Norrath].");
	elseif e.message:findi("protect Norrath") then
		e.self:Say("All of us should be united to stand against the evil that comes. Such a danger has never been faced on Norrath. When it will burst forth from where it hides to destroy us, I can't say, but I hope you will be standing there with us to fight when it does.");
	end
end

function event_signal(e)
	if e.signal == 1 then
		e.self:Emote("calms Toae with her words. 'Easy there, Toae!  There is no trouble.  Just relax.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end