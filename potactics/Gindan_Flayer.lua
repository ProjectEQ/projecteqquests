--[[ Drogerin


NPC: Gindan_Flayer NPCID: 214037
Spawns 2 x Gindan Flayer at 51% and depops itself.


--]]

function event_spawn(e)
	eq.set_next_hp_event(51);
end


function event_hp(e)
	if e.hp_event == 51 then
		eq.spawn2(214128,0,0,e.self:GetX()	+ 10, e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		eq.spawn2(214128,0,0,e.self:GetX()	- 10, e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		eq.depop();
	end
end
