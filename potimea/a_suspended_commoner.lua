--a_suspended_commoner
--potimea

function event_say(e)
	if(e.message:findi("hail") and not e.self:IsEngaged()) then
		if e.self:GetX() == 606 and e.self:GetY() == 104 then	
			e.self:Say("Who are you and what are your intentions here " .. e.other:GetName() .. "! This is a realm that is beyond any that you have ever seen before. Tread lightly for danger could possibly lie behind every corner.");
		elseif e.self:GetX() == 1020 and e.self:GetY() == 195 then
			e.self:Say("Greetings, stranger! I have been here for as long as I can remember. It's a lot like home though you know nice and cool which is just how I like it.");
		elseif e.self:GetX() == 1066 and e.self:GetY() == 105 then	
			e.self:Say("I am pleased to meet a newcomer to this realm, do you by chance know why you have been placed here. I certainly do not and hope to find out what has become of me someday.");
		elseif e.self:GetX() == 502 and e.self:GetY() == -589 then	
			e.self:Say("Cold it sure is in these parts " .. e.other:GetName() .. ". But lucky for me I am very used to my surroundings. I do not know why I was placed here and I have no idea how to return to my normal existence.");
		elseif e.self:GetX() == 626 and e.self:GetY() == -699 then	
			e.self:Say("A new face, not something I see often. I have seen the same folks here for all of my days, including the day I was first banished. It is very odd because I still do not remember much of my separation from the mortal world.");
		elseif e.self:GetX() == 756 and e.self:GetY() == -591 then	
			e.self:Say("It's very nice to see a new visitor to this land, I have not seen anyone else besides my companions here for a very long time. Although I was placed here involuntarily I am sure it would be very difficult to arrive here purposely.");
		end
	end
end