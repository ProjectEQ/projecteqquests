function event_aggro(e)
    e.self:Say("Guards! Guards! Help me!!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there " .. e.other:GetName() .. ". I don't suppose you can spare some coins? I'm just a poor halfling that is far away from home. I can't afford anything to eat or drink. Anything you can offer me will be of help.");
		e.self:SetAppearance(0); -- Stand
		eq.follow(e.other:GetID()); -- Follow the player who triggered the event
	end
end

function event_trade(e) -- Note that we are intentionally accepting any trade
	e.self:Say("Oh thank you. You are too kind to this poor halfling. Do you have anything else to give me?");
	e.self:SetAppearance(0); -- Stand
	eq.follow(e.other:GetID()); -- Follow the player who triggered the event
end
