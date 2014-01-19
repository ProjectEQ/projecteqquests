-- Ikkinz Group 1 Expedition
-- Diabolic_Destroyer NPCID: 294043

function event_spawn(e)
	eq.depop_all(294137);
	eq.set_next_hp_event(76);
end

function event_hp(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	local heading = e.self:GetHeading();
	-- spawn #Dire_Illusion x2
	eq.spawn2(294137,0,0,xloc,yloc + 25,zloc,heading);
	eq.spawn2(294137,0,0,xloc,yloc - 25,zloc,heading);
	-- set next HP event threshold
	if (e.hp_event == 76) then
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		eq.set_next_hp_event(26);
	end
end

function event_aggro(e)
	eq.spawn2(294137,0,0,450,-119,6,200);
	eq.spawn2(294137,0,0,457,-139,6,193);
	eq.spawn2(294137,0,0,438,-158,6,192);
 end
 
function event_death_complete(e)
	-- depop the #Dire_Illusions
	eq.depop_all(294137);
	-- spawn the #Cruel_Illusion
	eq.spawn2(294136,0,0,442,-141,11,192);
end
