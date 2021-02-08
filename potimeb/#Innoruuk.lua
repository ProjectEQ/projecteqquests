function event_spawn(e)
	eq.set_next_hp_event(80);
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000);
		eq.stop_timer("reset");
	else
		eq.stop_timer("OOBcheck");
		eq.set_timer("reset", 6 * 1000);
	end
end


function event_timer(e)
if(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetX() < 157 or e.self:GetY() < 180) then
		e.self:GotoBind();
		e.self:WipeHateList();
		e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
	else
		eq.set_timer("OOBcheck", 6 * 1000);
	end
elseif(e.timer=="reset") then
		e.self:SetHP(e.self:GetMaxHP());
		eq.set_next_hp_event(80);
		eq.depop_all(223231); --guardian_of_the_dark_prince (223231)
		eq.depop_all(223232); --A_hatebringer_of_Innoruuk (223232)
end
end

function event_hp(e)
	if(e.hp_event == 80) then
		eq.spawn2(eq.ChooseRandom(223231,223232),0,0,320,216,3,386); -- NPC(s): guardian_of_the_dark_prince (223231), A_hatebringer_of_Innoruuk (223232)
		eq.spawn2(eq.ChooseRandom(223231,223232),0,0,226,230,3,312); -- NPC(s): guardian_of_the_dark_prince (223231), A_hatebringer_of_Innoruuk (223232)
		eq.spawn2(eq.ChooseRandom(223231,223232),0,0,212,327,3,255); -- NPC(s): guardian_of_the_dark_prince (223231), A_hatebringer_of_Innoruuk (223232)
		eq.set_next_hp_event(20);
	elseif (e.hp_event == 20) then
		eq.spawn2(eq.ChooseRandom(223231,223232),0,0,293,301,13,317); -- NPC(s): guardian_of_the_dark_prince (223231), A_hatebringer_of_Innoruuk (223232)
		eq.spawn2(eq.ChooseRandom(223231,223232),0,0,305,221,3,389); -- NPC(s): guardian_of_the_dark_prince (223231), A_hatebringer_of_Innoruuk (223232)
		eq.spawn2(eq.ChooseRandom(223231,223232),0,0,214,309,3,251); -- NPC(s): guardian_of_the_dark_prince (223231), A_hatebringer_of_Innoruuk (223232)
		eq.spawn2(eq.ChooseRandom(223231,223232),0,0,238,239,3,319); -- NPC(s): guardian_of_the_dark_prince (223231), A_hatebringer_of_Innoruuk (223232)
	end
end

function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,6); -- NPC: zone_status
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	-- load qglobals and set bit 4
	local qglobals = eq.get_qglobals();
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	eq.set_global(instance_id.."_potimeb_phase_bit",tostring(bit.bor(phase_bit,4)),7,"H13");
end
