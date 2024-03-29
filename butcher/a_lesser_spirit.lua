-- Shaman Epic 1.0

function event_spawn(e)
	eq.set_timer("depop",10 * 60 * 1000);
end

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Did you take this person's life, shaman?");
	elseif e.message:findi("yes") then
		e.self:Say("Why have you taken this person's life, " .. e.other:GetName() .. "? Did he threaten your life? Did you dislike him? Or was his death a profit to you in some way?");
	elseif e.message:findi("disliked") then
		e.self:Say("I see, Farewell to you, " .. e.other:GetName() .. ".");
	elseif e.message:findi("profit") then
		e.self:Say("I see, Farewell to you, " .. e.other:GetName() .. ".");
	elseif e.message:findi("threatened my life") then
		e.self:Say("I see. It brings me sadness to see another die, but his heart was black and a great nothingness. His body will become the grass now. Thank you for what you have done, shaman.");
	elseif e.message:findi("what are you") then
		e.self:Say("What, or who, I am isn't as important as what, or who, WE are. Do you wish to know more, shaman?");
	elseif e.message:findi("know more") then
		e.self:Say("That is good, " .. e.other:GetName() .. ". Take this gem. It is a part of us like the clouds to the sky and is a wonderful gift from the grandfather. Take this gem to where the humans gather to spoil the land and water. Some call it a port. There you will find one of us, a shaman like yourself. Give him the gem and perhaps he will tell you more of the spirits.");
		e.other:SummonItem(1665); -- Item: Tiny Gem
	end
end

function event_timer(e)
	eq.depop();
end
