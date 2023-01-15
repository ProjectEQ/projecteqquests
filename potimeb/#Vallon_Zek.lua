--Vallon_Zek (223164) - Add Version
--Phase 4 Encounter
--potimeb

local box = require("aa_box")
local tether_box = box(229.2,-229.2,246,446.2)

function event_spawn(e)
	eq.set_timer("tether", 6 * 1000) -- 6s Check on tether
end

function event_timer(e)
	if e.timer == "tether" then
		if not tether_box:contains(e.self:GetX(), e.self:GetY()) then
			e.self:GotoBind();
			e.self:WipeHateList();
		end	
	end
end
