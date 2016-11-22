function event_spawn(e)
	e.self:Shout("I feel some souls have returned for me. Redis, Rithnok, Drema, and Reiya. . . I feel your presence here. Come to me now and let us end this!");
	eq.set_timer("depop", 3600 * 1000);
end

function event_combat(e)
  if (e.joined == true) then
	e.self:CastSpell(13536, e.self:GetTarget():GetID());
	eq.set_timer("adds",30*1000);
	eq.set_timer("epoch",9*1000);
	eq.set_timer("gyro",3*1000);	
  end
end

function event_timer(e)
--depop
	if(e.timer=="depop") then
		eq.depop();
	elseif (e.timer=="adds") then
		eq.spawn2(300088, 0, 0, e.self:GetX()-15, e.self:GetY()-15,  e.self:GetZ(),  e.self:GetHeading());	
		eq.spawn2(300089, 0, 0, e.self:GetX()+15, e.self:GetY()-15,  e.self:GetZ(),  e.self:GetHeading());	
		eq.spawn2(300090, 0, 0, e.self:GetX()-15, e.self:GetY()+15,  e.self:GetZ(),  e.self:GetHeading());	
	elseif (e.timer=="epoch") then
	--3779 Epoch Conviction 60s
	e.self:CastSpell(3779, e.self:GetTarget():GetID());
		eq.stop_timer("epoch");
		eq.set_timer("epoch",60*1000);
	elseif (e.timer=="gyro") then
	--1078 Gyrosonic Disruption 60s
		e.self:CastSpell(1078, e.self:GetTarget():GetID());
		eq.stop_timer("gyro");
		eq.set_timer("gyro",60*1000);	
	end

end
