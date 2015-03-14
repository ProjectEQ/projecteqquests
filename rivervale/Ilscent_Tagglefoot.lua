function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh hello. " .. e.other:GetName() .. ".  My name is Ilscent.   I am glad to see you. but I am in a bit of a [" .. eq.say_link("bind",false,"bind") .. "] right now.");
	elseif(e.message:findi("bind")) then
		e.self:Say("Well. I promised an ally of ours that I would send him a case of Jumjum juice for all the help he has given us.  I had planned on taking it to him myself but I have too many chores to do here on the farm. Will you take the [" .. eq.say_link("jumjum juice",false,"jumjum juice") .. "] to him?");
	elseif(e.message:findi("jumjum juice")) then
		e.self:Say("Oh. thank you so much!  His name is Xanuusus and he lives in the Plains of Karana. in the foothills along their northern edge. actually.  We are most grateful for your help.  Xanuusus normally rewards messengers well.");
		e.other:SummonItem(13411);
	end
end

-- END of FILE Zone:rivervale  ID:19102 -- Ilscent_Tagglefoot 

