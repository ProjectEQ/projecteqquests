function event_spawn(e)
	e.self:SetRunning(true);
end

function event_signal(e)
	if(e.signal == 1) then
		eq.stop();
	elseif(e.signal == 2) then
		eq.start(59);		
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("If you are a fellow merchant. I must warn you of the inevitable tax increase.  Antonius Bayle is soon to make a [deal] with the people of Surefall Glade.");
	elseif(e.message:findi("deal")) then
		e.self:Say("Bayle is soon to sign a law which will raise the taxes on all bear hides.  This is to keep the purchase of the hides to a minimum.  All this to keep the treehuggers happy!!");
	end
end
