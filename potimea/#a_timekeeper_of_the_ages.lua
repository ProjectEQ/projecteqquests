--#a_timekeeper_of_the_ages(219022 & 219028)  -- 5 spawned versions with different dialogues (2 with different face models)
--potimea

function event_spawn(e)
	if e.self:GetX() == -152 and e.self:GetY() == -369 then	--bridge to sphinx/shissar area
		e.self:SendIllusionPacket({luclinface=2});
	elseif e.self:GetX() == -384 and e.self:GetY() == 13 then	--bridge to earth area
		e.self:SendIllusionPacket({luclinface=4});
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if e.self:GetX() == 289 and e.self:GetY() == 346 then	--geonid/golem bridge
			e.self:Say("Greetings, " .. e.other:GetName() .. ". Over this bridge lies an area forged by the future. Inside it you will find weapons and creature capable of mass destruction, all chosen to defend the precious gems that lie scattered everywhere.");
		elseif e.self:GetX() == 358 and e.self:GetY() == -150 then	--bridge to snow area
			e.self:Say("Greetings to you, " .. e.other:GetName() .. "! This bridge here will lead you to the home of many interesting people and creatures. All of us are here for one reason or another but all of our journeys here have been quite mysterious and left us with many questions. I hope while you are here that you are able to gather the knowledge that you seek.");
		elseif e.self:GetX() == -384 and e.self:GetY() == 13 then	--bridge to earth area
			e.self:Say("Hello, " .. e.other:GetName() .. ", Behind me you will find a section of time that was carved from the very bowels of the earth. There are a number of creatures here that are quite mysterious and believed to be the oldest in existence.");
		elseif e.self:GetX() == -152 and e.self:GetY() == -369 then	--bridge to sphinx/shissar area
			e.self:Say("I welcome you to the most cryptic areas of Time. Behind me is home to the most ancient Shissar and Sphinx. They were all placed here because of their supreme intelligence and uncanny battle prowess. If you should venture into this area please take care if you value your life.");
		elseif e.self:GetX() == -198 and e.self:GetY() == 340 then	--bridge to knight armors/cats area
			e.self:Say("It is nice to meet you " .. e.other:GetName() .. ", I am Gerala Hirelsaob. I was once a Paladin of Marr in the early armies that defended our temple from the Dark Elves of Nektulos. When an original expedition of noblemen were asked to try and open the portal to this realm I was among them. Behind me is an area that is mostly inhabited by humanoids that founded this area and built it as a representation of where they come from. You will find most areas follow this same vision.");
		end
	end
end

