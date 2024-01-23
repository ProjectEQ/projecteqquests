local hp_event	= 0;

function Jurek_Combat(e)
	if e.joined then
		eq.stop_timer("reset_event");
	else
		eq.set_timer("reset_event", 2 * 60 * 1000);
	end
end

function Jurek_HP(e)
	if e.hp_event == 95 or e.hp_event == 80 or e.hp_event == 60 or e.hp_event == 40 or e.hp_event == 20 then
		if hp_event == 95 then
			hp_event = 80;
		else
			hp_event = hp_event - 20;
		end
		eq.set_next_hp_event(hp_event);

		eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
		eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
		eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Harsh wind is kicked up from Ju`Rek's wings.");
	end
end

function Jurek_Timer(e)
	if e.timer == "reset_event" then
		eq.depop_all(343027);
		eq.set_next_hp_event(95);
		e.self:SetHP(e.self:GetMaxHP());
		e.self:WipeHateList();
		eq.stop_timer(e.timer);
	end
end

function Jurek_Spawn(e)
	eq.set_next_hp_event(95);
end

function Add_Combat(e)
	if not e.joined then
		e.self:SaveGuardSpot(e.self:GetX(),e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	end
end

function event_encounter_load(e)
	eq.register_npc_event(Event.spawn,	343447,		Jurek_Spawn);
	eq.register_npc_event(Event.timer,	343447,		Jurek_Timer);
	eq.register_npc_event(Event.combat,	343447,		Jurek_Combat);
	eq.register_npc_event(Event.hp,		343447,		Jurek_HP);
	eq.register_npc_event(Event.combat,	343027,		Add_Combat);
  end
