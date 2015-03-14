function event_spawn(e)
	e.self:Say("Well met again, Srafen. How goes it?");
	eq.signal(98046,0);
end

function event_say(e)
	if(e.message:findi("hail")) then -- Part of Shaman Epic 1.0
		e.self:Say("Hey Srafen, who is this weirdo talking to me? Or is it another one of those funny illusions Froham keeps talking about?");
		eq.signal(98046,1);
	elseif(e.message:findi("bore")) then -- Part of Shaman Epic 1.0
		e.self:Say("Well ok, I was sent here a long time ago to wait. When I got here, I couldn't believe all the violence going on. Why would the spirits send me here to wait when all this fighting and commotion was going on, I wondered. There were great battles on the ocean in splendid ships made of pine and shining with [magical enhancements]. While I was waiting below, blasted, bloody body parts were floating down to the bottom of the ocean all around me.");
	elseif(e.message:findi("magical enhancements")) then -- Part of Shaman Epic 1.0
		e.self:Say("Yes, their ships were very strange, constructed in very unusual designs and all seemed to shine with a multicolored glow. I heard there was even a ship that could stay completely underwater for long periods of time. It had huge steel spikes protruding from the top of its hull used to 'swim' under enemy ships and puncture their hulls. I always thought that someday all this magic would cause something [disastrous] and eventually, it did.");
	elseif(e.message:findi("disastrous")) then -- Part of Shaman Epic 1.0
		e.self:Say("Well, one time, I was here waiting as usual. The fighting was particularly heavy up top, lots of banging and rumbling around. And suddenly there was a tremendous screech! I had to cover my ears, it was so loud, even down here. It felt like the water itself was being torn asunder; I could imagine what was happening above. After a few seconds of the screeching came a terrible tremor and rumbling. Great cracks opened up around me and water rushed to fill them, almost dragging me down into the gods know what. It calmed down a little while after that and there hasn't been any real fighting ever since. I suspect they're all dead now. For weeks afterwards, the water had a kind of dead taste to it. I became ill during that time.");
	end
end

function event_timer(e)
	if (e.timer == "DillonDepop") then
		eq.depop();
		eq.stop_timer("DillonDepop");
	end
end

function event_signal(e)
	if(e.signal == 0) then
		e.self:Say("Again? Oh I don't know Srafen, I don't want to [bore] our company, even if it is an illusion.");
	elseif(e.signal == 1) then
		e.self:Say("Whatever.");
	elseif(e.signal == 2) then
		e.self:Say("Hey wait! I'm coming with!");
		eq.start(58);
		eq.set_timer("DillonDepop",20000);
	end
end

-- Dillon_the_Drowned