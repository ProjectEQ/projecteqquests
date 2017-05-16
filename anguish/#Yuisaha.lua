function event_spawn(e)
	e.self:Shout("I am Yuisaha, spirit of rain and storms.' A great thundering voice booms across the land like a thunderstorm breaking. 'You have endured much to free me. I thank you for rescuing and reviving me. Take this, a small portion of my essence. May it aid you, and may none forget the great deed you have done.");
	eq.set_timer("depop",15000);
end

function event_timer(e)
	eq.depop();
end