function event_signal(e)
	if e.signal==1 then
		e.self:Say("How can you forgive me? I turned on you and I do remember trying to harm the very one you asked to save me. That shaman risked all to take part in saving me.");
	end
end

function event_spawn(e)
	eq.set_timer("setapp",1000);
end

function event_timer(e)
	e.self:SetAppearance(3);
end