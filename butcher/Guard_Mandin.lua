function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["paladin_epic"] == "9") then
		if(e.message:findi("hail")) then
			e.self:Say("Hail, " .. e.other:Race() .. ". Lately there has been odd occurrences happening at night at the Chessboard area in these mountains. Rumor has it some goblins have been found dead the next morning near there, with their blood sucked dry. You should investigate the area.");
		end
	end
end