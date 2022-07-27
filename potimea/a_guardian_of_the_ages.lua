--a_guardian_of_the_ages
--potimea

function event_say(e)
	if(e.message:findi("hail") and not e.self:IsEngaged()) then
		if e.self:GetX() == -426 and e.self:GetY() == 885 then
			e.self:Say("A knight serving in the great Freeport army I once was. I do not know what I have become now, for I awoke one day in this land and have been a victim of its mystery for as long as I can remember.");
		elseif e.self:GetX() == -515 and e.self:GetY() == 848 then
			e.self:Say("Hello, " .. e.other:GetName() .. ", I am a former member of the Collation of Trade Folk from the Commonlands. I was placed here by a group of gypsies that became quite angry when I questioned them on the goods that they were attempting to carry through my guard post. When I asked to inspect them they all obliged and as I looked into the mysterious hourglass I fell into a deep sleep and awoke here. I hope sometime to return to my friends and family.");
		elseif e.self:GetX() == -596 and e.self:GetY() == 881 then	
			e.self:Say("I am pleased to meet you " .. e.other:GetName() .. ". It is not often that I am graced by the presence of strangers at my lonely guard post here. I regret everyday that I am here for the terrible crime I committed while I was back home. Please leave me be.");
		elseif e.self:GetX() == -511 and e.self:GetY() == 922 then	
			e.self:Say("Hi there " .. e.other:GetName() .. ". Are you new to this realm? I have many questions that I would love to get answered myself for I still do not know how I was placed here. I believe I was in a great accident while I was exploring a leak in the Qeynos aquaducts.");
		end
	end
end
