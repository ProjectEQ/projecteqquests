function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you! Sit and have a drink. I shall be playing soon enough.");
	end
end

function event_signal(e)
	-- Signal sent from Henna Treghost saying "Sing us a melody."
	e.self:Say("Here's one for Sir Lucan... He's just a ruler. In a long line of rulers. Looking for a few more orcs to slay. They say that he fights them with one hand tied to his back. And he won't leave Freeport till you remember his name. Thank you.");
	e.self:DoAnim(58);
end

-- END of FILE Zone:freporte -- Branis_Noolright