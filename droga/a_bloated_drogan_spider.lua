function event_combat(e)
  if (e.joined == true) then
	eq.set_next_hp_event(75);
  end  
end

function event_timer(e) 
  if(e.timer=="check") then
	if(math.random(4)==1) then 
			e.self:ForeachHateList(
				function(ent, hate, damage, frenzy)
					if(ent:IsClient()) then
						if(ent:CastToMob():GetClass()==4 and damage > 0) then
							local currclient=ent:CastToClient();
							if(currclient:GetItemIDAt(13)==62648) then
								currclient:SummonItem(62644);
								eq.depop_with_timer();
							end
						end
					end				
				end
			);
	end
  end
end

function event_hp(e)
	if (e.hp_event == 75) then
		eq.spawn2(81166,0,0,e.self:GetX()+5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(81166,0,0,e.self:GetX()-5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(81166,0,0,e.self:GetX()+5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); 
		eq.set_next_hp_event(55);
	end
	if (e.hp_event == 55) then
		eq.spawn2(81166,0,0,e.self:GetX()+5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(81166,0,0,e.self:GetX()-5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(81166,0,0,e.self:GetX()+5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); 
		eq.set_next_hp_event(30);
	end
	if (e.hp_event == 30) then
		eq.spawn2(81166,0,0,e.self:GetX()+5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(81166,0,0,e.self:GetX()-5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(81166,0,0,e.self:GetX()+5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); 
		eq.set_next_hp_event(25);
	end	
	if (e.hp_event == 25) then
		eq.set_timer("check",15000);
	end

		local entity_list = eq.get_entity_list();
		-- aggro guards
		local npc_list = entity_list:GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and npc:GetNPCTypeID() == 81166 ) then
				npc:AddToHateList(e.self:GetHateTop(),1);
			end
		end		
end

function event_death(e)
	e.self:CastSpell(5688, e.self:GetHateRandom():GetID());
end