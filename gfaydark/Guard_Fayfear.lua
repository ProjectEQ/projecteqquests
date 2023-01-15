function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["paladin_epic"] == "9") then
		if(e.message:findi("hail")) then
			e.self:Say("Salutations " .. e.other:GetName() .. ", nice to meet you. We have been getting reports of activity in Crushbone lately. The reports have indicated that an orc messenger was seen speaking to a being of some sort. . .some say it was a vampire. Maybe you should investigate.");
		end
	end
end

function event_combat(e)
	if e.joined==true then
		e.self:Say("Time to die " .. e.other:GetCleanName() .. ".");
	end
end