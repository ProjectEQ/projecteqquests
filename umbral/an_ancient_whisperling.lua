function event_spawn(e)
	eq.set_timer("delay",2000);
end

function event_timer(e)
	eq.stop_timer("delay");
	eq.set_proximity(e.self:GetX()-45, e.self:GetX()+45, e.self:GetY()-45, e.self:GetY()+45, -999999, 999999, true);
	eq.enable_proximity_say();
end

function event_proximity_say(e)
	if (e.message:findi("am i worthy")) then
		e.self:Say("The squishy mortal has proven itself by releasing Elysian spirits. We greet the Elysian spirits to our realm and rejoice in their freedom. Go on fleshling, ask the bone man to tell you of Vex Thal.");
	end
end
