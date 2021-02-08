function event_combat(e)
  if (e.joined == true) then
    eq.stop_timer('reset');
    eq.set_timer('adds', 50 * 1000);
  else
    eq.set_timer('reset', 300 * 1000);
	eq.stop_timer('adds');
  end
end

function event_timer(e)
  if (e.timer == 'reset') then
    eq.depop_all(207068);
    eq.stop_timer('reset');
  else
  local rand = math.random(1,4);
		if (rand == 1) then
eq.spawn2(207068, 0, 0, e.self:GetX()-5, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX(), e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX()-2, e.self:GetY()+3,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
		elseif (rand == 2) then
eq.spawn2(207068, 0, 0, e.self:GetX()-5, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX(), e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX()-2, e.self:GetY()+3,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: a_construct_seedling
		elseif (rand == 3) then
eq.spawn2(207068, 0, 0, e.self:GetX()-5, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX(), e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX()-2, e.self:GetY()+3,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX()+3, e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: a_construct_seedling
		elseif (rand == 4) then
eq.spawn2(207068, 0, 0, e.self:GetX()-5, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX(), e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX()-2, e.self:GetY()+3,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX()+3, e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: a_construct_seedling
eq.spawn2(207068, 0, 0, e.self:GetX()-1, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_construct_seedling
    end
eq.get_entity_list():MessageClose(e.self, false, 100, 0, "The bizarre pool begins to splash and churn with activity!");
  end
end


function event_death_complete(e)
eq.depop_all(207068);
end
