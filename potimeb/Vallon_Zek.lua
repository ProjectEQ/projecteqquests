--Vallon_Zek (223078)
--Phase 4 Encounter
--potimeb

local box = require("aa_box")
local tether_box = box(229.2,-229.2,246,446.2)


function event_death_complete(e)
	eq.signal(223097,223078); -- Add Loot Lockout
	eq.signal(223097,5); -- send a signal to the zone_status that I died
end

function event_spawn(e)
	eq.set_next_hp_event(51);
	eq.set_timer("tether", 6 * 1000) -- 6s Check on tether
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("reset");
	else
		eq.set_timer("reset",5 * 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "reset" then
		eq.stop_timer("reset");
		e.self:SetHP(e.self:GetMaxHP())
		eq.set_next_hp_event(51);
		eq.depop_all(223164);	--reset clones
	elseif e.timer == "tether" then
		if not tether_box:contains(e.self:GetX(), e.self:GetY()) then
			e.self:GotoBind()
			e.self:WipeHateList()
			e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
		end	
	end
end

function event_hp(e)
	if (e.hp_event == 51) then
		-- spawn copies
		eq.spawn2(223164,0,0,360,75,358,384);
		eq.spawn2(223164,0,0,300,75,348,384);
	end
end
