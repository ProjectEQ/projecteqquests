function Air_Spawn(e)
	eq.set_timer("depop", 30*60*1000); --30min
	eq.set_next_hp_event(80);
end

function Air_Timer(e)
	if(e.timer=="depop") then
		eq.stop_timer("depop");	
		eq.depop_all(303105); 
		eq.depop_all(303104);
		eq.depop_all(303103);
		eq.depop_all(303102);
		eq.depop_all(303101);
		eq.depop_all(303100);		
	end
end

function Air_HP(e)
  if (e.hp_event == 80) then
	e.self:SetSpecialAbility(19, 1);
	e.self:SetSpecialAbility(20, 1);  
	e.self:SetSpecialAbility(24, 1);
	e.self:SetSpecialAbility(25, 1);
	e.self:SetInvisible(2);
	e.self:SetTargetable(false);
	e.self:WipeHateList();
	eq.set_next_hp_event(60);
	eq.spawn2(303101,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(303101,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	e.self:GMMove(-1109,-1880,328,0);
  end
  if (e.hp_event == 60) then
	e.self:SetSpecialAbility(19, 1);
	e.self:SetSpecialAbility(20, 1);    
	e.self:SetSpecialAbility(24, 1);
	e.self:SetSpecialAbility(25, 1);	
	e.self:SetInvisible(2);
	e.self:SetTargetable(false);
	e.self:WipeHateList();
	eq.set_next_hp_event(40);
	eq.spawn2(303102,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(303102,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(303102,0,0,e.self:GetX(),e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading());	
	e.self:GMMove(-1109,-1880,328,0);
  end 
  if (e.hp_event == 40) then
	e.self:SetSpecialAbility(19, 1);
	e.self:SetSpecialAbility(20, 1);    
	e.self:SetSpecialAbility(24, 1);
	e.self:SetSpecialAbility(25, 1);
	e.self:SetInvisible(2);
	e.self:SetTargetable(false);
	e.self:WipeHateList();
	eq.set_next_hp_event(20);
	eq.spawn2(303103,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(303103,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(303103,0,0,e.self:GetX(),e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(303103,0,0,e.self:GetX(),e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());
	e.self:GMMove(-1109,-1880,328,0);
  end 
  if (e.hp_event == 20) then
	e.self:SetSpecialAbility(19, 1);
	e.self:SetSpecialAbility(20, 1);   
	e.self:SetSpecialAbility(24, 1);
	e.self:SetSpecialAbility(25, 1);
	e.self:SetInvisible(2);
	e.self:SetTargetable(false);
	e.self:WipeHateList();
	eq.set_next_hp_event(10);
	eq.spawn2(303104,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(303104,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(303104,0,0,e.self:GetX(),e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(303104,0,0,e.self:GetX(),e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(303104,0,0,e.self:GetX()-10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading());
	e.self:GMMove(-1109,-1880,328,0);
  end 
  if (e.hp_event == 10) then
	e.self:SetSpecialAbility(19, 1);
	e.self:SetSpecialAbility(20, 1);   
	e.self:SetSpecialAbility(24, 1);
	e.self:SetSpecialAbility(25, 1);
	e.self:SetInvisible(2);
	e.self:SetTargetable(false);
	e.self:WipeHateList();
	eq.spawn2(303105,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(303105,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(303105,0,0,e.self:GetX(),e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(303105,0,0,e.self:GetX(),e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(303105,0,0,e.self:GetX()-10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading());		
	eq.spawn2(303105,0,0,e.self:GetX()+10,e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());
	e.self:GMMove(-1109,-1880,328,0);
  end   
end

function Air_Signal(e)
	if(e.signal==303101) then
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(303101) == false ) then
			e.self:GMMove(-1097,-1732,254,0);
			e.self:WipeHateList();
			e.self:SetSpecialAbility(19, 0);
			e.self:SetSpecialAbility(20, 0);		
			e.self:SetSpecialAbility(24, 0);
			e.self:SetSpecialAbility(25, 0);
			e.self:SetInvisible(0);
			e.self:SetTargetable(true);	
		end
	elseif(e.signal==303102) then
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(303102) == false ) then
			e.self:GMMove(-1097,-1732,254,0);
			e.self:WipeHateList();
			e.self:SetSpecialAbility(19, 0);
			e.self:SetSpecialAbility(20, 0);
			e.self:SetSpecialAbility(24, 0);
			e.self:SetSpecialAbility(25, 0);
			e.self:SetInvisible(0);
			e.self:SetTargetable(true);	
		end
	elseif(e.signal==303103) then
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(303103) == false ) then
			e.self:GMMove(-1097,-1732,254,0);
			e.self:WipeHateList();
			e.self:SetSpecialAbility(19, 0);
			e.self:SetSpecialAbility(20, 0);		
			e.self:SetSpecialAbility(24, 0);
			e.self:SetSpecialAbility(25, 0);
			e.self:SetInvisible(0);
			e.self:SetTargetable(true);	
		end
	elseif(e.signal==303104) then
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(303104) == false ) then
			e.self:GMMove(-1097,-1732,254,0);
			e.self:WipeHateList();
			e.self:SetSpecialAbility(19, 0);
			e.self:SetSpecialAbility(20, 0);			
			e.self:SetSpecialAbility(24, 0);
			e.self:SetSpecialAbility(25, 0);
			e.self:SetInvisible(0);
			e.self:SetTargetable(true);	
		end
	elseif(e.signal==303105) then
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(303105) == false ) then
			e.self:GMMove(-1097,-1732,254,0);
			e.self:WipeHateList();
			e.self:SetSpecialAbility(19, 0);
			e.self:SetSpecialAbility(20, 0);		
			e.self:SetSpecialAbility(24, 0);
			e.self:SetSpecialAbility(25, 0);
			e.self:SetInvisible(0);
			e.self:SetTargetable(true);	
		end		
	end
end


function Zeph_Death(e)
	eq.signal(303100,303101);			
end

function Gust_Death(e)
	eq.signal(303100,303102);			
end

function Breeze_Death(e)
	eq.signal(303100,303103);			
end

function Wind_Death(e)
	eq.signal(303100,303104);			
end

function Current_Death(e)
	eq.signal(303100,303105);			
end


function event_encounter_load(e)
  eq.register_npc_event('mageepic_1_5', Event.timer,          303100, Air_Timer);
  eq.register_npc_event('mageepic_1_5', Event.spawn,          303100, Air_Spawn);
  eq.register_npc_event('mageepic_1_5', Event.hp,         	  303100, Air_HP);  
  eq.register_npc_event('mageepic_1_5', Event.signal,	   	  303100, Air_Signal); 
  eq.register_npc_event('mageepic_1_5', Event.death_complete, 303101, Zeph_Death);
  eq.register_npc_event('mageepic_1_5', Event.death_complete, 303102, Gust_Death);
  eq.register_npc_event('mageepic_1_5', Event.death_complete, 303103, Breeze_Death);
  eq.register_npc_event('mageepic_1_5', Event.death_complete, 303104, Wind_Death);
  eq.register_npc_event('mageepic_1_5', Event.death_complete, 303105, Current_Death);
  
end
