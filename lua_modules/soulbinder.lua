local soulbinder = {}

function soulbinder.say(e)
    if (e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". When a hero of our world is slain their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity, it is my duty to [" .. eq.say_link("bind my soul",false,"bind your soul") .. "] to this location if that is your wish.");
    elseif (e.message:findi("bind my soul")) then
	    e.self:Say("Binding your soul. You will return here when you die.");
	    eq.SelfCast(2049);
	end
end

return soulbinder;