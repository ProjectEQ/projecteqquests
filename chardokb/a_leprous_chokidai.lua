function event_combat(e)
  if (e.joined == true) then
	eq.set_next_hp_event(25);
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
								currclient:SummonItem(62645);
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
 eq.set_timer("check",15000);
end

function event_death(e)
	e.self:CastSpell(5688, e.self:GetHateRandom():GetID());
end
