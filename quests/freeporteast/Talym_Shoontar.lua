function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello %s, I hope your hunt is going well.",e.other:GetName()));
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Antonius Bayle is a blithering fool.");
	elseif(e.signal == 2) then
		e.self:Say("All right, Tlin! I am going to smash your face in!");
	end
end

-- END of FILE Zone:freporte  ID:10182 -- Talym_Shoontar