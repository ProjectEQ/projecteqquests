-- Dark Disciple Master event in Wakening Lands // Cleric 1.5 Epic Quest // Harmony of the Soul // -- Drogerin

local addspawn;

function event_spawn(e)
	e.self:Emote("glances at you, and you see a moment of recognition flash across his face. 'Fool! Do you know who that is? You have jeopardized everything and you shall pay with your life.' He turns to Plavo and slashes his throat quickly with the tips of his fingers. 'Now, on to you. You will not foil my plans again! Your life ends here!");
	addspawn = math.random(60,70);
	eq.set_next_hp_event(addspawn);
end

function event_hp(e)
	if(eq.hp_event == addspawn) then
		e.self:Say("You actually expect to win? Flee now and I will spare your lives.");
		eq.spawn2(0,0,e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ(),e.self:GetHeading()); 
		-- This is to spawn Plavo`s Remains //need NPCID// he will spawn between 70% and 60%
		-- of Dark Disciple Master's HP @ the Dark Disciple Masters Location
		eq.set_next_hp_event(30);
	elseif(eq.hp_event == 30) then
		e.self:Emote("chants for a moment, animating fallen soldiers from the ground around him.");
		-- There is conflicting data on how many skeletons will spawn during this event
		-- The trigger is at 30% and some reports say they only got 2, some reports say that they got more than 2
		-- I would assume this is based upon dps. I have started with what I know. 2 Brown skeletons will spawn.
		eq.spawn2(0,0,e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ(),e.self:GetHeading());		-- need NPCID on 'Minions of the Master'
		eq.spawn2(0,0,e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ(),e.self:GetHeading()); 		-- need NPCID on 'Minions of the Master'
		eq.set_next_hp_event(10);
	elseif(eq.hp_event == 10) then
		e.self:Say("You have underestimated me! I will not fall this day!");
		e.self:CastSpell(1248, e.self:GetID()); -- He will cast Spiritual Echo on himself at this point.
		e.self:CastSpell(4746, e.self:GetID()); -- He will also cast Protection of Discord III on himself at this point.
	end
end

function event_death_complete(e)
		e.self:Emote("screams in pain! No! This cannot be! I will not fall! Do not think that this is the end!");
		local xloc = e.self:GetX();
		local yloc = e.self:GetY();
		local zloc = e.self:GetZ();
		local heading = e.self:GetHeading();
		eq.spawn2(NPCID,0,0,xloc,yloc,zloc,heading); -- Need NPCID of Chest that spawns here.
end
		
		