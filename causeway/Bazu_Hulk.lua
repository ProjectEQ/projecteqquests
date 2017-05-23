--Bazu_Smasher (303081)
--2 Bazu Hulk spawn at the described HP numbers
function event_combat(e)
  if (e.joined == true) then
	eq.set_timer("breath", math.random(3,8) * 1000);
	eq.set_timer("grip", math.random(5,10) * 1000);
	eq.set_timer("symbol", math.random(5,10) * 1000);
  else
    eq.stop_timer("breath");
	eq.stop_timer("grip");
	eq.stop_timer("symbol");
  end
end


function event_timer(e)
  if e.timer=="breath" then
     e.self:CastSpell(5559,e.self:GetTarget():GetID());
	 eq.set_timer("breath", 30*1000);
  elseif e.timer=="grip" then
     e.self:CastSpell(5996,e.self:GetTarget():GetID());
	 eq.set_timer("grip", 15*1000);
  elseif e.timer=="symbol" then
     e.self:CastSpell(1154,e.self:GetTarget():GetID());
	 eq.set_timer("symbol", 60*1000);	 
  end
end

