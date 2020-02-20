function event_say(e)
	if (e.other:GetFaction(e.self) >= 5) then
		if(e.message:findi("hail")) then
		e.self:Say("Why are you here, " .. e.other:Race() .. "  There is nothing you can gain from this land but an unsung death at the talons of your betters.  If you want to prove your worth to Dragonkind, it will take more than slaying a few giants to accomplish it.  Far more.");
		elseif(e.message:findi("prove my worth")) then
		e.self:Say("Slaying all the Kromzek would be a good start.  But that may be asking too much of such weak creatures.");
		elseif(e.message:findi("king is dead")) then
		e.self:Say("Yes, morsel?  You mean to tell me you have accomplished the task I set before you?  Then it is proof I shall be having,  or it is lunch I shall be having, do you understand?");
		end
	end
end
