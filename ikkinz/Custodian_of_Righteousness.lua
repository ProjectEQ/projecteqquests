--Ikkinz Raid #1: Chambers of Righteousness  

function event_spawn(e)
	eq.set_next_hp_event(50);
end

function event_hp(e)
  if(e.hp_event == 50) then
    e.self:SetSpecialAbility(4, 1); --turn aoe ramp on
    eq.zone_emote(13,"Custodian of Righteousness is infuriated!");
    eq.set_next_hp_event(40);
  elseif(e.hp_event == 40) then
    e.self:SetSpecialAbility(4, 0); --turn aoe ramp off
    eq.zone_emote(13,"Custodian of Righteousness is no longer infuriated.");
    eq.set_next_hp_event(10);
  elseif(e.hp_event == 10) then
    e.self:SetSpecialAbility(4, 1); --turn aoe ramp on
    eq.zone_emote(13,"Custodian of Righteousness is infuriated!");
  end
end

function event_combat(e)
if (e.joined == true) then
eq.set_timer("OOBcheck", 3 * 1000);
eq.set_timer("blur", 45 * 1000);
else
eq.stop_timer("OOBcheck");
eq.stop_timer("blur");
end
end


function event_timer(e)
	if(e.timer=="OOBcheck") then
	  eq.stop_timer("OOBcheck");
	    if (e.self:GetY() > -350) then
		    e.self:CastSpell(3791, e.self:GetID())
		    e.self:GotoBind();
		    e.self:WipeHateList();
	    else
		    eq.set_timer("OOBcheck", 3 * 1000);
	    end
	elseif(e.timer=="blur") then
		e.self:Emote("shifts its weight and turns its attention to someone new.");
		e.self:WipeHateList();
	end
end
