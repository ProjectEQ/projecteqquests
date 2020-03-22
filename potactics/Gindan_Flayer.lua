--[[ Drogerin


NPC: Gindan_Flayer NPCID: 214037
Spawns 2 x Gindan Flayer at 51% and depops itself.


--]]

function event_signal(e)
  if e.signal == 1 then
    eq.set_timer("depop", 10 * 60 * 1000); -- 10 min depop
  end
end


function event_timer(e)
  if e.timer == "depop" then
    eq.depop_all(214084);
    eq.depop_all(214128);
    eq.stop_timer("depop");
  end
end

function event_spawn(e)
	eq.set_next_hp_event(51);
end


function event_hp(e)
	if e.hp_event == 51 then
		eq.spawn2(214128,0,0,e.self:GetX()+ 10, e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); --#Gindan_Flayer
		eq.spawn2(214128,0,0,e.self:GetX()- 10, e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); --#Gindan_Flayer
		eq.depop_with_timer();
	end
end
