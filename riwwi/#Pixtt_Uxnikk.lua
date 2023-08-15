local TM_minimum_players = 18; --changed to 6 much later (2017)


function event_say(e)
	if(e.message:findi("hail")) then
			e.self:Say("It's a good thing Taskmistress Krisz doesn't know what we're up to.  Wow, does she have a temper, and enough skill with a blade to back it up.  No one would [" .. eq.say_link("dare") .. "] cross her.");
	elseif(e.message:findi("dare")) then
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(282115) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(282105) then
			if (e.other:GetRaidMemberCountInZone() >= TM_minimum_players) then
			-- if TM trigger is up and TM is not currently spawned and 18 or more in raid, spawn TM
				e.self:Emote("laughs, 'Think you could teach that old goat a lesson!?");
				eq.unique_spawn(282105,21,0,-1117,-408,33,502); -- #Taskmistress_Krisz
			else
				e.self:Say("There's a reason no one stands up to her, " .. e.other:GetCleanName() .. ".");
				e.other:Message(MT.Yellow,"You must assemble at least three groups to attract the attention of Taskmistress Krisz.");
			end
		else
			e.self:Say("She hasn't been around much lately, but I'm sure she'll be back.");
		end
	end
end

function event_spawn(e)
	eq.set_timer("emote", 660 * 1000); -- 11 min random flavor
end

function event_timer(e)
local rand = math.random(1,20); 
	if (rand == 1) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk shouts, 'I could stay here all day and watch this bloodsport.");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'You DO stay here all day.");
	elseif (rand == 2) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk shouts, 'Is that the best you can do, worms?");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'Don't hold back.  Come on, show us what you've got!");
	elseif (rand == 3) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk shouts, 'These people have no idea what it's like to be real warriors.");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'Putting them out of their misery would be doing us all a favor.");
	elseif (rand == 4) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk shouts, 'What is that odd taste in my mouth? It's strangely like... the bitter taste of disappointment.");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'You sure it wasn't something Vuzcv cooked up?");
	elseif (rand == 5) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk shouts, 'I do enjoy listening to those screams of pain.");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'Yes, yes.  There is no music more beautiful.");
	elseif (rand == 6) then
	eq.zone_emote(MT.White,"Pixxt Uxnikk mutters, 'You think the decor in this miserable place could be any more drab?");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'I can't possibly imagine how.");
	elseif (rand == 7) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk shouts, 'Let's have some of those slaves beg for their lives again.");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'Mmm, yes.  That's always good.");
	elseif (rand == 8) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk shouts, 'Can someone tell me when the fun is going to begin?  Please tell me it gets better than this.");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'Well, look at it this way, it can't possibly get any worse.");
	elseif (rand == 9) then
	eq.zone_emote(MT.White,"Pixxt Uxnikk scowls, 'Bah, I am incensed.  Who could call this fighting and keep a straight face?");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'With only minutes left to live, you'd think they would exert a little effort.");
	elseif (rand == 10) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk shouts, 'Hit him!  Hit him again!");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'Get him while he's down!");
	elseif (rand == 11) then
	eq.zone_emote(MT.White,"Pixxt Uxnikk breaks into laughter, 'Pathetic!");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'Ah, come on!  Let's see a real fight!");
	elseif (rand == 12) then
	eq.zone_emote(MT.White,"Pixxt Uxnikk feigns an exaggerated yawn. 'Bah, wake me up when something exciting happens.");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'Does something exciting ever happen?");
	elseif (rand == 13) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk shouts, 'How long do you slugs think you can last out there?");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'Ha ha.  They're already sweating.");
	elseif (rand == 14) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk shouts, 'Looks like I was passed up for promotion again.");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'What?  So was I.  The work we do here is unappreciated.");
	elseif (rand == 15) then
	eq.zone_emote(MT.White,"Pixxt Uxnikk screams mockingly. 'Oh no, have mercy!  Pfah.  Just die and get it over with.");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'Ha ha, 'have mercy' indeed.");
	elseif (rand == 16) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk shouts, 'Remember when that wild animal tore a slave to shreds?");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'How could I forget?  Ha ha.");
	elseif (rand == 17) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk spits in disgust. 'I thought we were going to see a real battle?!");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'Looks like our low expectations weren't quite low enough.");
	elseif (rand == 18) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk toss a chunk of rubble into the arena pit. 'Did you see that? I almost hit them!");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'Ha ha, nice toss.");
	elseif (rand == 19) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk shouts, 'Officiator, why so many delays? What is the holdup? Hmph. This is unacceptable. I demand a refund for the downtime between matches.");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'We don't care if it amounts to a few paltry coins. It's the principle of it.");
	elseif (rand == 20) then
	eq.zone_emote(MT.White,"Pixtt Uxnikk shouts, 'I'll wager everything I own that a three-legged hynid could kill that scrawny one in the corner.");
	eq.zone_emote(MT.White,"Pixtt Kekken shouts, 'Hmph.");
	end
end
