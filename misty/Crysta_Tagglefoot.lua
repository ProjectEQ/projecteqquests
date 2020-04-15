--[[



Halloween2018 by Drogerin

--]]

local event_started=0;

function event_spawn(e)
	event_started=0;
	eq.debug("Event Started " .. event_started);
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if (e.message:findi("hail") and qglobals["Halloween2018"] == "4") then
		e.self:Say("I'm so happy you were able to find me, just around the corner is the thief, We can end his parade of theft right this minute!");
		eq.set_global("Halloween2018","5",5,"h3");
		e.self:Say("We only have a few hours, so make sure to be quick!");
		e.self:Say("Tell me when you're ready! [" .. eq.say_link("Extreme") .. "] (Recommended 36+ players)");
	elseif (e.message:findi("extreme") and event_started == 0 and qglobals["Halloween2018"] == "5") then
		e.self:Say("Lets try to summon him first, I don't know what I'm doing by the way. Lets just wing it! I call upon you, whoever has been stealing my goods. Show yourself!");
		e.self:Say("This may take a few seconds!");
		eq.set_timer("Summonone", 15000);
		event_started=1;
		eq.debug("Event Started " .. event_started);
	end
end


function event_timer(e)
	if (e.timer == "Summonone") then
	eq.spawn2(357010,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: Sendaii,_the_Hive_Queen
	eq.stop_timer("Summonone");
	eq.set_timer("Uhoh",8000);
	elseif (e.timer == "Uhoh") then
	e.self:Say("OH GOD, WRONG EXPANSION!!");
	eq.stop_timer("Uhoh");
	eq.depop(357010);
	eq.set_timer("Retry",10000);
	event_started=0;
	eq.debug("Event Started " .. event_started);
	elseif (e.timer == "Retry") then
	e.self:Say("Yuck I hate spiders!!  Look over there by the entrance of Rivervale, I think I see someone coming out of the city. Could that be him?");
	eq.stop_timer("Retry");
	eq.spawn2(33165,0,0,-2395.99,757.44,-2.00,253.3); -- NPC: Crysta_Tagglefoot
	eq.spawn2(33161,0,0,-2395.84,496.42,-453,123.3); -- NPC: Deputy?
	e.self:Shout("Hey over here, thief!! Don't think we can't see you!");
	e.self:Say("I hope you're ready for this!");
	eq.depop_with_timer(33164);
	end
end
	
