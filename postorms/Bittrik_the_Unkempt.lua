-- Bittrik the Unkempt Druid 1.5 Prequest NPC -- Plane of Storms #Drogerin

function event_say(e)
	local Bittrik = 0
    if (e.other:GetGlobal("Bittrik") ~= "Undefined") then
        Bittrik = tonumber(e.other:GetGlobal("Bittrik"));
    end
	if (e.message:findi("hail")) then
		if (Bittrik == 8) then
            e.self:Say("That's all there is to the story of the ornery giant who lived in the forest. I happen to think that it's a wonderful story, but to each their own I guess. I have other stories, if you're interested though! Perhaps you'd like to hear about the Kingdom of Lok and the tribulations of a once proud land? Or maybe you'd like to be dragged into the stories of how the Storms came to be in these lands? Of course if you like, I can tell you the story of the ornery giant again. So what'll it be, friend?");
			else
				e.self:Say("Oh me oh my! A visitor! Pardon me for not cleaning up, but I wasn't expecting company so early! Bittrik's the name, stories are my game. Looking to unmask the secret of the Kingdom of Lok? I might indeed have that story tucked away somewhere. Perhaps you'd fancy a smaller story, one revolving around an ill-tempered giant? That one happens to be one of my favorites! Of course, there are the stories of raging Storms to be found through this land, which I know plenty about as well. So, what'll it be, friend?");
		end
	
	elseif(e.message:findi("ill tempered giant")) then
			e.self:Say("Ah, you're interested in one of the most peculiar stories I know, eh? Most would say that the story is a fluke, derived from a crazed mind. We'll see what you think. Of course I'm sure you're aware of the fact that this place has been in existence long before any of our time. But, in the beginning, there were only a small population of beasties and creatures that lived in the plains, desert and forest. One day though, after a particularly nasty storm, a large mountain giant washed ashore. He was battered and beaten, weathered by the storm, and nearly dead [" .. eq.say_link("continue") .. "].");
			e.other:SetGlobal("Bittrik", "1", 5, "F");
	elseif (Bittrik > 0 and e.message:find("continue")) then
		if (Bittrik == 1) then
			e.self:Say("I'm sure you can believe that this massive creature felt slightly out of place, being so far from his mountainous homelands, however he took it upon himself to find suitable living areas in the region he was now in. His journey started in the Plains of Lost Souls, Srerendi; the mild trees and vegetation, while appealing, weren't enough to satiate his hunger for a land close to that of his home. The trees were sparsely packed, the wildlife was mundane, and he felt that the rivers that flowed through the plains were far too gloomy. Not only that, but he couldn't stand to be so close to the shipwreck that landed him here in the first place [" .. eq.say_link("continue") .. "].");
			e.other:SetGlobal("Bittrik", "2", 5, "F");
		elseif (Bittrik == 2) then
			e.self:Say("Dissatisfied with the look and feel of the plains, the giant looked westward for greener pastures. As he walked through the hills making his way west, he thought back to days gone past, of his comrades in arms and his cohorts in exploration. He was known to be a strong and proud warrior, but he was not known to be the most friendly of giants, certainly not to outsiders and certainly not when he was outnumbered. The younger giants in the tribe thought of him as very ornery and somewhat short-tempered, yet very noble and well versed in the ways of the world. These things harked back to more pleasant times long before he arrived in this wretched place of vast storms [" .. eq.say_link("continue") .. "].");
			e.other:SetGlobal("Bittrik", "3", 5, "F");
		elseif (Bittrik == 3) then
			e.self:Say("As he reminisced about days of yore, the ground under his feet changed from a pale green to that of blistering white sands. Rocks encased this deserted area, long forgotten except for the sparse collection of desert-going creatures. He was amazed at the sudden climate change he found; that rolling plains could twist and contort so quickly into a desert region puzzled him. One thing he was sure of, he wasn't going to live in a dry, overheated place like this. He decided he would go north to see if there was another climate change nearby, perhaps one that was more closely linked to his home climate in the mountains [" .. eq.say_link("continue") .. "].");
			e.other:SetGlobal("Bittrik", "4", 5, "F");
		elseif (Bittrik == 4) then
			e.self:Say("He saw the scorched, burning sand below his feet and pondered what could do such a thing to this land. Had there been such severe storms that it caused all the vegetation and trees in this area to be swept away into nothing? Or was this a foreshadowing of events that would eventually engulf him and these lands in a shroud of death and demise? He shuddered at the questions rolling around in his mind; why was he so afraid of these questions anyway? He was a mighty warrior with decades of training and experience. He figured he was just being paranoid from being so far away from home and shrugged it off as just that -- paranoia [" .. eq.say_link("continue") .. "].");
			e.other:SetGlobal("Bittrik", "5", 5, "F");
		elseif (Bittrik == 5) then
			e.self:Say("The longer he walked, the more he thought that this may be it; he thought that there was endless desert from here on out. After some time, he came upon a small oasis, filled with glistening water. He gulped down the water as though he had not had any for years. When he was thoroughly quenched, he stopped to think about the logic of such cool, clear water in the middle of a desert before finally realizing that there must be cooler lands nearby. He moved on through the heat, hoping that his next step would bring him to the edge of the next climate [" .. eq.say_link("continue") .. "].");
			e.other:SetGlobal("Bittrik", "6", 5, "F");
		elseif (Bittrik == 6) then
			e.self:Say("He ran a few more steps when out of nowhere, he found himself in the middle of a densely packed, lush and fertile forest. He could hardly believe his eyes as he looked around at the tall trees and their very green leaves. He strolled through the forest glowing at the thought of having found a new home for himself, even though he was so far from the reaches of civilization. It was high time he started to build a place to live [" .. eq.say_link("continue") .. "].");
			e.other:SetGlobal("Bittrik", "7", 5, "F");
		elseif (Bittrik == 7) then
			e.self:Say("He spent many weeks laboring away, cutting down nearby trees and turning them into lumber for a cabin. The end result was a modest cabin that he could live in without disturbing the peace and tranquility of the surrounding forest area. He was to live there for a long time, living among the forest and in peace... alone. That is until the Storms came, but that is another story altogether [" .. eq.say_link("continue") .. "].");
			e.other:SetGlobal("Bittrik", "8", 5, "F");
		elseif (Bittrik == 8) then
			e.self:Say("That's all there is to the story of the ornery giant who lived in the forest. I happen to think that it's a wonderful story, but to each their own I guess. I have other stories, if you're interested though! Perhaps you'd like to hear about the Kingdom of Lok and the tribulations of a once proud land? Or maybe you'd like to be dragged into the stories of how the Storms came to be in these lands? Of course if you like, I can tell you the story of the ornery giant again. So what'll it be, friend?");
		end
	end
end
