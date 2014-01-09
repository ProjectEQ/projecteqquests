--Galremos (212033)
--Spawn percents and quantities per live 01/09/14

local xloc = 0;
local yloc = 0;
local zloc = 0;

function event_spawn(e)
	eq.set_next_hp_event(90);
end

function event_hp(e)
	if (e.hp_event == 90) then
		xloc = e.self:GetX();
		yloc = e.self:GetY();
		zloc = e.self:GetZ();
		eq.spawn2(212064,0,0,xloc,yloc,zloc,0); -- a_magmite
		eq.set_next_hp_event(60);
	elseif (e.hp_event == 60) then
		xloc = e.self:GetX();
		yloc = e.self:GetY();
		zloc = e.self:GetZ();
		eq.spawn2(212064,0,0,xloc,yloc,zloc,0); -- a_magmite
		eq.spawn2(212064,0,0,xloc,yloc,zloc,0); -- a_magmite
		eq.set_next_hp_event(35);
	elseif (e.hp_event == 35) then
		xloc = e.self:GetX();
		yloc = e.self:GetY();
		zloc = e.self:GetZ();
		eq.spawn2(212064,0,0,xloc,yloc,zloc,0); -- a_magmite
		eq.set_next_hp_event(20);
	elseif (e.hp_event == 20) then
		xloc = e.self:GetX();
		yloc = e.self:GetY();
		zloc = e.self:GetZ();
		eq.spawn2(212064,0,0,xloc,yloc,zloc,0); -- a_magmite
		eq.spawn2(212064,0,0,xloc,yloc,zloc,0); -- a_magmite
		eq.spawn2(212064,0,0,xloc,yloc,zloc,0); -- a_magmite
		eq.spawn2(212064,0,0,xloc,yloc,zloc,0); -- a_magmite
		eq.set_next_hp_event(5);
	elseif (e.hp_event == 5) then
		xloc = e.self:GetX();
		yloc = e.self:GetY();
		zloc = e.self:GetZ();
		eq.spawn2(212064,0,0,xloc,yloc,zloc,0); -- a_magmite
		eq.spawn2(212064,0,0,xloc,yloc,zloc,0); -- a_magmite
		eq.spawn2(212064,0,0,xloc,yloc,zloc,0); -- a_magmite
		eq.spawn2(212064,0,0,xloc,yloc,zloc,0); -- a_magmite
		eq.spawn2(212064,0,0,xloc,yloc,zloc,0); -- a_magmite
		eq.spawn2(212064,0,0,xloc,yloc,zloc,0); -- a_magmite
	end
end
