function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["paladin_epic"] == "9") then
		if(e.message:findi("hail")) then
			e.self:Say("Hail, " .. e.other:GetName() .. ". I got a tip from one of our patroling guards that they saw a meeting in Lesser Faydark between the Teir`Dal and Vampires there. Perhaps you should check it out.");
		end
	end
end

function event_combat(e)
	if e.joined==true then
		e.self:Say("Time to die " .. e.other:GetCleanName() .. ".");
	end
end