--a_nomadic_barbarian
--potimea

function event_say(e)
	if(e.message:findi("hail") and not e.self:IsEngaged()) then
		if e.self:GetX() == 570 and e.self:GetY() == -571 then	
			e.self:Say("You must excuse me " .. e.other:GetName() .. ", I must remain on guard here until my brother returns from his patrol.");
		elseif e.self:GetX() == 570 and e.self:GetY() == -606 then
			e.self:Say("I remember as if it was yesterday how I happened upon the portal that led me here. It seems as nothing has changed so it could have very well been yesterday.");
		elseif e.self:GetX() == 608 and e.self:GetY() == -637 then	
			e.self:Say("Pleased to meet you, traveler. How exactly was it that you found yourself here stuck in time? Almost all the inhabitants here have a story that led to their disappearance.");
		elseif e.self:GetX() == 647 and e.self:GetY() == -637 then	
			e.self:Say("A great soldier I once was in the Halas army. Until one day we went up against a very odd group of shamanistic Ice Orcs. One of these orcs was able to open what seemed like a ripple in time during our battle and jumped into it. Giving chase to this orc that had slain my brother I jumped through the shimmering portal and ended up here.");
		elseif e.self:GetX() == 698 and e.self:GetY() == -611 then	
			e.self:Say("Please do not come any closer " .. e.other:GetName() .. ". The sword that you see sheathed by my side is one of great power and mystery. I received it when I did battle with a ferocious group of gnolls in Blackburrow. When I cut down the dastardly gnoll that used this sword to kill many of my companions it seemed like his life force was sucked into the blade. Once I picked up the sword to inspect it I was transported here. I have kept it sheathed ever since that day out of fear of what it is capable of.");
		elseif e.self:GetX() == 697 and e.self:GetY() == -571 then	
			e.self:Say("It sure is cold here today but that sure reminds me of home so I do not mind it all too much. It seems like ages since I have last seen my family and friends back home. All that I can remember is I received a knock on my cottage and I was greeted by 2 gypsies asking for a place to stay for the evening. When I went to sleep that night I awoke here.");
		end
	end
end