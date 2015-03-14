function event_say(e)
	fac = e.other:GetFaction(e.self);

	if(fac < 7) then
		if(e.message:findi("hail")) then
			e.self:Say("Hail!! You are welcome to rest here.");
			eq.signal(70007,5);
		elseif(e.message:findi("escort")) then
			e.self:Say("Yes. Follow me closely!!");
			eq.move_to(-141.75, 1201.45, 141.42, 0);
		end
	else
		e.self:Say("Your shifty eyes tell me that you are no ally of the Stormguard.");
	end
end

-- EOF Sigan Ilbirku