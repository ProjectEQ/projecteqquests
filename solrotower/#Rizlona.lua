function event_death_complete(e)
eq.unique_spawn(202368, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: A_Planar_Projection
eq.spawn2(212076,0,0,-1118,2024,-908,258); --a_warder_of_Rizlona (212076)
eq.spawn2(212076,0,0,-1101,1978,-920,258); --a_warder_of_Rizlona (212076)
eq.spawn2(212076,0,0,-1086,2024,-908,258); --a_warder_of_Rizlona (212076)
end

function event_combat(e)
if (e.joined == true) then
eq.set_timer("OOBcheck", 6 * 1000);
eq.stop_timer("depop");
else
eq.stop_timer("OOBcheck");
eq.set_timer("depop", 1800 * 1000);
end
end


function event_timer(e)
	if(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetY() < 2076) then
				e.self:Say("If you wish to challenge me, you must do it on my terms!");
				e.self:CastSpell(2830, e.self:GetID())
				e.self:SetHP(e.self:GetMaxHP());
				e.self:GMMove(-1104,2384,-905,256);
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 6 * 1000);
			end
	elseif(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end
