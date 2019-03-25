function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s!  Guard Corshin Kiniss, at your service. You should be careful in Qeynos after dark. We have had several [bodies] wash up under the docks over the past few weeks. We wouldn't want anything to happen to you.",e.other:GetName()));
		eq.signal(1090,5); -- NPC: Guard_Beren
	elseif(e.message:findi("bodies")) then
		e.self:Say("We think the bodies are washing out of the aqueducts beneath Qeynos. It is a dangerous place to go and Commander Bayle refuses to send regular patrols down there.");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Yes, sir!");
	end
end
