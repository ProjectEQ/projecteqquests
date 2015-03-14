function event_say(e)
	fac = e.other:GetFaction(e.self);

	if(fac < 7) then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings, my friend! You may rest here if you like. There are many dangers in this land. May Tunare watch over you when you depart our camp.");
			eq.signal(70007,5);
		elseif(e.message:findi("healed")) then
			e.self:Say("I see. Then sit and rest a while. I must conserve my strength for our own interests. When you are ready to leave, go and ask Sigan to [escort you to the pass]. There, you can leave this dangerous land.");
		end
	else
		e.self:Say("You have some nerve to approach a loyal member of the Paladins of Tunare! Run, while you can!");
	end
end

function event_signal(e)
	e.self:Say("Leave our new friend alone, Ghilanbiddle.  He is quite welcome to rest amongst us.");
end

-- EOF Nyrien Lyrdarniel