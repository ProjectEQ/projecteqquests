-- This is for the second of the two greater spirits in North Freeport.
-- items: 1666

function event_say(e)
	if(e.message:findi("hail")) then -- Part of Shaman Epic 1.0
		e.self:Say("Greetings, shaman. Tell me, do you follow [Justice], [War], [Honor], [Fear], or [Hate]?");
	elseif(e.message:findi("i follow justice")) then -- Part of Shaman Epic 1.0
		e.self:Say("Ah, it does me much good to meet with one who holds respect and reverence for the spirits. [Trust] that your place in the whole is important. Rather than trying to enslave and command others with the powers the gods grant you, you live in harmony and balance with the world around you. There are times when we, the [true spirits] and those like you, can work together to achieve goals. Individuals who help us are known as [Heyokah].");
	elseif(e.message:findi("i follow fear")) then -- Part of Shaman Epic 1.0
		e.self:Say("You would be best served by speaking to my brother in the next room, " .. e.other:GetName() .. ".");
	elseif(e.message:findi("i follow war")) then -- Part of Shaman Epic 1.0
		e.self:Say("You would be best served by speaking to my brother in the next room, " .. e.other:GetName() .. ".");
	elseif(e.message:findi("i follow hate")) then -- Part of Shaman Epic 1.0
		e.self:Say("You would be best served by speaking to my brother in the next room, " .. e.other:GetName() .. ".");
	elseif(e.message:findi("i follow honor")) then -- Part of Shaman Epic 1.0
		e.self:Say("Ah, it does me much good to meet with one who holds respect and reverence for the spirits. [Trust] that your place in the whole is important. Rather than trying to enslave and command others with the powers the gods grant you, you live in harmony and balance with the world around you. There are times when we, the [true spirits] and those like you, can work together to achieve goals. Individuals who help us are known as [Heyokah].");
	elseif(e.message:findi("trust")) then -- Part of Shaman Epic 1.0
		e.self:Say("Trust is the glue of the universe. When one trusts others to do their part, it allows them to focus on what they must do themselves. The trust that others have in us also gives us the confidence to do our parts effectively, thus maintaining harmony. When one becomes dissatisfied with his part and pursues his own desires, this is called greed. And greed destroys the glue of the universe. This is why we wished the bandits under the grass.");
	elseif(e.message:findi("true spirits")) then -- Part of Shaman Epic 1.0
		e.self:Say("As a shaman, spirits are known to you. They aid you if you pay them homage and respect the world around you. They also will bend to your will if you are powerful enough. We are a part of the entire universe and we exist because people believe and feel us. However [very few] know us in this form. To mortals we are but ideas, [wisps of consciousness] in an expanse of emptiness and as difficult to grasp as breath in Everfrost.");
	elseif(e.message:findi("very few")) then -- Part of Shaman Epic 1.0
		e.self:Say("There are only a handful of mortals we've judged worthy to be friends and, reluctantly, masters. We call them the [Heyokah]. Bondl is one of them and he helps to test those we believe might be able to grasp our existence. There are many troubles that threaten us and our home. We seek those with the wisdom, patience, and might to help us ensure the health of the cosmos. Whether you seek balance or personal power, this is important to you.");
	elseif(e.message:findi("wisps of consciousness")) then -- Part of Shaman Epic 1.0
		e.self:Say("It is difficult for mortals to grasp what we are for we are not material that can be held or consumed. We are the spirit that drives beings to do what beings do. The wolf lives to run and hunt. When you ask for his aid, his spirit enters your body and you 'become' wolf. The ox is the personification of endurance and when he enters your body, you do not become an ox, you become all that is ox. I myself am the spirit of understanding.");
	elseif(e.message:findi("heyokah")) then -- Part of Shaman Epic 1.0
		e.self:Say("The Heyokah are our mortal counterparts. Some are our friends who seek to help us in whatever goals we deem important. Some seek nothing more than to enslave and command us to do their bidding. We accept this and often make deals with those we realize are powerful enough to accomplish what needs to be done. To judge such individuals, we have prepared a test. We ask that before we enter into these contracts, the shaman walk the [path of the Heyokah]. We see you may be worthy. Will you walk the path? You will be rewarded for your efforts, albeit grudgingly.");
		e.other:SummonItem(1666); -- Item: Opaque Gem
	elseif(e.message:findi("i will walk the path")) then -- Part of Shaman Epic 1.0
		e.self:Say("That is good. You will need to walk three paths before you can reach that of the Heyokah. The paths of patience, wisdom, and might. First, you must learn patience. Take this gem and go on a pilgrimage to an island in the great water the wasichu call Erud's Crossing. The Kerrans there are our allies and can show you to our next contact, Ooglyn. Give Ooglyn the gem and do what she asks. As you walk the path, remember what you've learned about trust.");
		eq.signal(8117,0); -- NPC: a_greater_spirit
		e.other:AddEXP(1000);
		eq.depop();
	end
end

function event_signal(e)
	if(e.signal == 0) then
		eq.depop();
	end
end

-- EOF a_greater_spirit_