function event_spawn(e)
	e.self:Shout("I feel some souls have returned for me. Redis, Rithnok, Drema, and Reiya. . . I feel your presence here. Come to me now and let us end this!");
	eq.set_timer("depop", 3600 * 1000);
end

function event_combat(e)
  if (e.joined == true) then
	e.self:CastSpell(13536, e.self:GetTarget():GetID()); -- Spell: Harm Touch
	eq.set_timer("adds",120*1000);
	eq.set_timer("epoch",9*1000);
	eq.set_timer("gyro",3*1000);
	eq.set_timer("thunder",15*1000);
	
  else
    	eq.stop_timer("adds");
	eq.stop_timer("epoch");
	eq.stop_timer("gyro");
	eq.stop_timer("thunder");
  end
end

function event_timer(e)
--depop
	if(e.timer=="depop") then
		eq.depop();
		eq.depop_all(300088);
		eq.depop_all(300089);
		eq.depop_all(300090);
	elseif (e.timer=="adds") then
		eq.spawn2(300088, 0, 0, e.self:GetX()-15, e.self:GetY()-15,  e.self:GetZ(),  e.self:GetHeading()); -- NPC: #Furious_Lightning_Elemental
		eq.spawn2(300089, 0, 0, e.self:GetX()+15, e.self:GetY()-15,  e.self:GetZ(),  e.self:GetHeading()); -- NPC: #Enraged Lightning Elemental
		eq.spawn2(300090, 0, 0, e.self:GetX()-15, e.self:GetY()+15,  e.self:GetZ(),  e.self:GetHeading()); -- NPC: #Vicious_Lightning_Elemental
	elseif (e.timer=="epoch") then
	--3779 Epoch Conviction 60s
	e.self:CastSpell(3779, e.self:GetTarget():GetID()); -- Spell: Epoch Conviction
		eq.stop_timer("epoch");
		eq.set_timer("epoch",60*1000);
	elseif (e.timer=="gyro") then
	--1078 Gyrosonic Disruption 60s
		e.self:CastSpell(1078, e.self:GetTarget():GetID()); -- Spell: Gyrosonic Disruption
		eq.stop_timer("gyro");
		eq.set_timer("gyro",60*1000);
	elseif (e.timer=="thunder") then		
		e.self:CastSpell(1026, e.self:GetTarget():GetID()); -- Spell: Thunder Call
		eq.stop_timer("thunder");
		eq.set_timer("thunder",90*1000);
	end

end
