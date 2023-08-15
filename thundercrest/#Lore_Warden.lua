function event_spawn(e)
	eq.set_timer('spawndrakes', 6 * 1000);
	eq.set_timer('depopevent', 7200 * 1000);
	eq.set_timer('flavor', 240 * 1000);
end

function event_timer(e)
	if (e.timer == 'spawndrakes') then
		eq.stop_timer('spawndrakes');
		eq.spawn2(340391, 0, 0, 1848, 2365, -51.625, 442); -- NPC: Messenger_Drake
		eq.spawn2(340391, 0, 0, 1830, 2380, -51.625, 442); -- NPC: Messenger_Drake
		eq.spawn2(340391, 0, 0, 1870, 2390, -51.625, 442); -- NPC: Messenger_Drake
		eq.spawn2(340391, 0, 0, 1843, 2397, -51.625, 442); -- NPC: Messenger_Drake
	elseif (e.timer == 'depopevent') then
			eq.stop_timer('depopevent');
			eq.depop_all(340391);
			eq.depop_with_timer();
	elseif (e.timer == 'flavor') then
		if (math.random(100)<=12) then
			e.self:Emote("mutters, 'Unbelievable.  I give them simple tasks and expect them to get done.  I tell the mistress that they will be done.  Then I learn that all of them are incompetent.  I should know better by now.'");
		elseif (math.random(100)>12 and math.random(100)<=24) then
			e.self:Emote("glares around the room.");
		elseif (math.random(100)>24 and math.random(100)<=36) then
			e.self:Emote("says, 'Incompetent, all of them!'");
		elseif (math.random(100)>36 and math.random(100)<=48) then
			e.self:Emote("says, 'Yes, I want you to do what I told you to do!'");
		elseif (math.random(100)>48 and math.random(100)<=60) then
			e.self:Emote("bites at the air with frustration.");
		elseif (math.random(100)>60 and math.random(100)<=72) then
			e.self:Emote("growls.");
		elseif (math.random(100)>72 and math.random(100)<=84) then
			e.self:Emote("flaps his wings angrily.");
		elseif (math.random(100)>84 and math.random(100)<=100) then
			e.self:Emote("spits, 'Worthless!'");
		end
	elseif(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() < 1712 and e.self:GetY() < 2433) then
				e.self:GotoBind();
				e.self:WipeHateList();
				e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
			else
				eq.set_timer("OOBcheck", 3 * 1000);
			end
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I could have tolerated you as long as you didn't disturb me.  Leave the Hall now and do not return.  I do not want to hear your voice again.");
	elseif(e.message:findi("how am i disturbing you") or e.message:find("i will not leave") and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(340412) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(340413)) then
		e.self:Say("Unbelievable!  Even the intruders are incompetent, unable to follow simple instructions!'  The small drake makes a shrill whistle and three kirin appear. 'Destroy them. Be as messy as you must, but be quick about it and clean up when you are done.");
		eq.spawn2(340413, 0, 0, e.self:GetX()-5, e.self:GetY()-5,  e.self:GetZ(),  e.self:GetHeading()); -- NPC: Guardian_of_the_Past
		eq.spawn2(340413, 0, 0, e.self:GetX()+5, e.self:GetY()+5,  e.self:GetZ(),  e.self:GetHeading()); -- NPC: Guardian_of_the_Past
		eq.spawn2(340412, 0, 0, e.self:GetX()-5, e.self:GetY()-5,  e.self:GetZ(),  e.self:GetHeading()); -- NPC: Sentinel_of_Antiquity
	end
end

function event_signal(e)
	if (e.signal==1) then
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(35, 0);
		e.self:Say("You just can't find good servants these days.  I shall remove you myself.  If your goal was to disturb my work you may account yourself successful.'  As it speaks you sense tremendous anger building in the tiny creature like a great storm.  Its anger fills its body and it grows larger.");
		e.self:ChangeSize(35);
	end
end

function event_combat(e)
	if e.joined then
		eq.set_timer("OOBcheck", 3 * 1000);
	else
		eq.stop_timer("OOBcheck");
	end
end

