--Ikkinz Raid #3: Chambers of Transcendence  
--at a much later point in the timeline, nixki does not HP flux
function event_spawn(e)
	eq.set_timer("hpflux", 5 * 1000);
	eq.set_next_hp_event(4);
end

function event_hp(e)
  if(e.hp_event == 4) then
    e.self:SetSpecialAbility(4, 1); --turn aoe ramp on
    eq.zone_emote(13, e.self:GetCleanName() .. " is infuriated!");
	eq.set_timer("removeae", 5 * 1000);
  end
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3 * 1000);
		eq.stop_timer("hpflux");
	else
		eq.stop_timer("OOBcheck");
		eq.set_timer("hpflux", 5 * 1000);
	end
end


function event_timer(e)
if(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetX() < 500 or e.self:GetX() > 700 or e.self:GetY() > -120 or e.self:GetY() < -300) then
		e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		e.self:GotoBind();
		e.self:WipeHateList();
	else
		eq.set_timer("OOBcheck", 3 * 1000);
	end
elseif(e.timer=="hpflux") then
	if (e.self:GetHPRatio() < 10) then
	e.self:SetHP(3300000);
	else
	e.self:SetHP(165000);
	end
elseif(e.timer=="removeae") then
	eq.stop_timer("removeae");
	eq.zone_emote(13, e.self:GetCleanName() .. " is no longer infuriated.");
	e.self:SetSpecialAbility(4, 0); --turn aoe ramp off
end
end

function event_death_complete(e)
	eq.spawn2(294596,0,0,519,-247,-50,70); -- NPC: a_pile_of_bones
	eq.spawn2(294596,0,0,521,-156,-50,170); -- NPC: a_pile_of_bones
	eq.spawn2(294596,0,0,556,-266,-50,486); -- NPC: a_pile_of_bones
	eq.spawn2(294596,0,0,618,-232,-50,4); -- NPC: a_pile_of_bones
	--should be based on number of players in zone
	eq.signal(294631,6); --set lockout
	eq.zone_emote(0,"Vrex Xalkak Nixki has been defeated! The whole time you were led to believe that this guardian was just another stone sentinel left as a test by the trusik priests of the past. Congratulations on a most difficult task indeed!");
	eq.ZoneMarquee(10,510,1,1,6000,"Vrex Xalkak Nixki has been defeated! Congratulations!");
end
