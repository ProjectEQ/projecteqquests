function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("State your business or leave our [compound].");
	elseif(e.message:findi("compound")) then
		e.self:Say("This is the primary command center for Che Virtuson. We fall under the leadership and guidance of Captain Ryglot. I must now ask you to leave.");
	end
end
