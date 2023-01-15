--a_nobleman_of_the_past
--potimea

function event_spawn(e)	--mix up faces on male npcs
	if e.self:GetX() == -369 and e.self:GetY() == 629 then	
		e.self:SendIllusionPacket({luclinface=2});
	elseif e.self:GetX() == -917 and e.self:GetY() == 883 then	
		e.self:SendIllusionPacket({luclinface=4});
	end
end

function event_say(e)
	if(e.message:findi("hail") and not e.self:IsEngaged()) then
		if e.self:GetX() == -210 and e.self:GetY() == 988 then
			e.self:Say("It is not often that I see another humanoid here like yourself " .. e.other:GetName() .. ". I do wonder if you have found this place out of principal or if you are on some kind of a mission. Regardless I wish you the best of luck while you are here.");
		elseif e.self:GetX() == -369 and e.self:GetY() == 629 then
			e.self:Say("Pleased to meet you, " .. e.other:GetName() .. ". I have been placed here by my council. I was once a residing cabinet member in the Temple of Marr until something horrible happened. I was cursed to spend the rest of my days here.");
		elseif e.self:GetX() == -917 and e.self:GetY() == 883 then	
			e.self:Say("Pleased to meet you, " .. e.other:GetName() .. ". You must be careful while traveling throughout the other parts of this realm. It is unknown what the intentions are of the many different creatures.");
		elseif e.self:GetX() == -786 and e.self:GetY() == 1169 then	
			e.self:Say("Howdy " .. e.other:GetName() .. ", I am afraid I don't see many newcomers like yourself around these parts very often. My mind is very cloudy having been in this place for so long. I can hardly remember my old friends and family, but I hope to one day see them again.");
		end
	end
end
