--a_nomadic_gnome
--potimea

function event_say(e)
	if(e.message:findi("hail") and not e.self:IsEngaged()) then
		if e.self:GetX() == 1029 and e.self:GetY() == -97 then	
			e.self:Say("Well if my trusty spectacles don't fail me I would say for sure that you are a new traveler to these parts.  I must warn you to watch where you tread for a lot of us have never left our snowy home. I could not be sure what dangers exist here.");
		elseif e.self:GetX() == 1022 and e.self:GetY() == -238 then
			e.self:Say("I remember like yesterday the events that led up to my arriving here in this mysterious plane. I was working on my fabled time travel machine.  A very smart gnomish conjurer I was indeed.  When I went to look for a specific part I saw a shimmering wall in my study.  Curiosity overtook me and I attempted to touch the wall.  That's the last thing I remember before I awoke here.  I cannot tell you how long ago that was because I have no sense of time here for some reason. But I can tell you it does not seem like it occurred too long ago.");
		elseif e.self:GetX() == 1114 and e.self:GetY() == -387 then	
			e.self:Say("I am pleased to meet you, " .. e.other:GetName() .. ".  We do not get many visitors to our most lonely of dwellings.  I curse the day I decided to follow that faulty clockwork into the caves of Steamfont.  I do not know what has become of me.");
		elseif e.self:GetX() == 1138 and e.self:GetY() == -626 then	
			e.self:Say("Deraos, is that you?  I have waited very long to see you, my brother.  I sure hope that you have brought good news from home!");
		elseif e.self:GetX() == 1172 and e.self:GetY() == -696 then	
			e.self:Say("Well hello there, stranger!  I can't begin to express how pleasant it is to see a new face around these parts.  I have been stuck here for as long as I can remember.  I don't know what my purpose is here, for I was just exploring when I stumbled upon a magical portal that transported me here.");
		elseif e.self:GetX() == 1025 and e.self:GetY() == -719 then	
			e.self:Say("An exploring gnome I was and an exploring gnome I always will be.  Howdy there " .. e.other:GetName() .. ".  I welcome you to my small dwelling.  I do not know if you have taken the time to walk around this plane but it is very mysterious in every way, for that reason I have never left this area but I hope to one day muster up the courage to leave my dwelling.");
		end
	end
end