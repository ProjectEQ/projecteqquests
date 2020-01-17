-- Swish Appletop //33145// ##Drogerin##

function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("I'm afraid I can't speak right now, " .. e.other:GetName() .. ". I'm waiting for someone very important to arrive.");
	end
end
