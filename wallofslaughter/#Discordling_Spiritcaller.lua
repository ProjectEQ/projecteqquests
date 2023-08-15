--#a_spiritbound_chimera (300093)
function event_spawn(e)
	eq.set_timer("depop",30*60*1000)
	eq.spawn2(300092, 0, 0, e.self:GetX(), e.self:GetY()+15, e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_spiritbound_feran
	eq.spawn2(300092, 0, 0, e.self:GetX(), e.self:GetY()-15, e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_spiritbound_feran
end

function event_combat(e)
	if e.joined then
		eq.set_timer("symbol", math.random(3,30) * 1000);
		eq.set_timer("chant", math.random(3,18) * 1000);
		eq.set_timer("grip", math.random(3,45) * 1000);
	else
		eq.stop_timer("symbol");
		eq.stop_timer("chant");
		eq.stop_timer("grip");
	end
end
  
function event_timer(e)
	if e.timer=="depop" then
		eq.stop_timer("depop")
		eq.depop_all(300093);
		eq.depop_all(300092);
		eq.depop();
	elseif e.timer=="symbol" then
		e.self:CastSpell(1155, e.self:GetTarget():GetID()); -- Spell: Black Symbol of Agony
		eq.set_timer("symbol", 60 * 1000);
	elseif e.timer=="chant" then
		e.self:CastSpell(2046, e.self:GetTarget():GetID()); -- Spell: Deathly Chants
		eq.set_timer("chant", 18 * 1000);	
	elseif e.timer=="grip" then
		e.self:CastSpell(3644, e.self:GetTarget():GetID()); -- Spell: Grip of Mental Reality
		eq.set_timer("grip", 60 * 1000);		
	end
end