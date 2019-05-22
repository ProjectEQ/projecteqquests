function event_spawn(e)
eq.set_timer('spawndrakes', 6 * 1000);
end

function event_timer(e)
if (e.timer == 'spawndrakes') then
eq.stop_timer('spawndrakes');
eq.spawn2(340391, 0, 0, 1848, 2365, -51.625, 442);
eq.spawn2(340391, 0, 0, 1830, 2380, -51.625, 442);
eq.spawn2(340391, 0, 0, 1870, 2390, -51.625, 442);
eq.spawn2(340391, 0, 0, 1843, 2397, -51.625, 442);
end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("'I could have tolerated you as long as you didn't disturb me.  Leave the Hall now and do not return.  I do not want to hear your voice again.'");
	elseif(e.message:findi("how am i disturbing you") and eq.get_entity_list():IsMobSpawnedByNpcTypeID(340412) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(340413) == false) then
		e.self:Say("'Unbelievable!  Even the intruders are incompetent, unable to follow simple instructions!'  The small drake makes a shrill whistle and three kirin appear. 'Destroy them. Be as messy as you must, but be quick about it and clean up when you are done.'");
		eq.spawn2(340413, 0, 0, e.self:GetX()-5, e.self:GetY()-5,  e.self:GetZ(),  e.self:GetHeading());
		eq.spawn2(340413, 0, 0, e.self:GetX()+5, e.self:GetY()+5,  e.self:GetZ(),  e.self:GetHeading());
		eq.spawn2(340412, 0, 0, e.self:GetX()-5, e.self:GetY()-5,  e.self:GetZ(),  e.self:GetHeading());
	end
end

function event_signal(e)
if (e.signal==1) then
e.self:SetSpecialAbility(24, 0);
e.self:SetSpecialAbility(35, 0);
e.self:Say("'You just can't find good servants these days.  I shall remove you myself.  If your goal was to disturb my work you may account yourself successful.'  As it speaks you sense tremendous anger building in the tiny creature like a great storm.  Its anger fills its body and it grows larger.'");
e.self:ChangeSize(35);
end
end
