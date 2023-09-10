--Ikkinz Raid #1: Chambers of Righteousness  
function event_spawn(e)
	eq.set_next_hp_event(50);
end

function event_hp(e)
  if(e.hp_event == 50) then
    e.self:SetSpecialAbility(4, 1); --turn aoe ramp on
    eq.zone_emote(MT.Red,"Priest of Righteousness is infuriated!");
    eq.set_next_hp_event(40);
  elseif(e.hp_event == 40) then
    e.self:SetSpecialAbility(4, 0); --turn aoe ramp off
    eq.zone_emote(MT.Red,"Priest of Righteousness is no longer infuriated.");
    eq.set_next_hp_event(10);
  elseif(e.hp_event == 10) then
    e.self:SetSpecialAbility(4, 1); --turn aoe ramp on
    eq.zone_emote(MT.Red,"Priest of Righteousness is infuriated!");
  end
end

function event_combat(e)
	if e.joined then
		eq.set_timer("OOBcheck", 3 * 1000);
		
	else
		eq.stop_timer("OOBcheck");
	end
end


function event_timer(e)
if(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetX() < 200 or e.self:GetX() > 500 or e.self:GetY() > -30 or e.self:GetY() < -250) then --(($x > 500) || ($x < 200) || ($y > -30) || ($y < -250)) {
		e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		e.self:GotoBind();
		e.self:WipeHateList();
	else
		eq.set_timer("OOBcheck", 3 * 1000);
	end
end
end

function event_death_complete(e)
  eq.signal(294141,1); -- NPC: #Trigger_Ikkinz_1
end
