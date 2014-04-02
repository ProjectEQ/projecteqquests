function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. "! We've got the best prices in town..  No need to shop around..  Heh, heh. I think I'll make that my new slogan!");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		eq.stop();
	elseif(e.signal == 2) then
		eq.start(61);
	elseif(e.signal == 3) then
		e.self:Say("Heh.. Why don't you try Freeport.. or Erudin.. ANYwhere but here!");
	end
end
