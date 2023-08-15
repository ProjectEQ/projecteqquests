function event_combat(e)
	if(e.joined) then
		eq.set_timer("check", 5 * 1000);
	else
		eq.stop_timer("check");
	end
end

function event_timer(e)
	if (e.timer == "check") then
		
		e.self:ForeachHateList(
		  function(ent, hate, damage, frenzy)
			if(ent:IsClient() and ent:GetX() < -402 or ent:GetX() > 70 or ent:GetY() > 645 or ent:GetY() < 475) then
			  local currclient=ent:CastToClient();
				eq.zone_emote(MT.White,"An officiator shouts, 'Keep it in the arena! If fools are to be slaughtered, do us the courtesy of allowing the crowd to observe!");
				currclient:MovePC(282,-168,330,4.3,0);
				e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
				e.self:WipeHateList();
			end
		  end
		);
		
	end
end
