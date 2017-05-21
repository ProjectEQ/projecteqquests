local new_hp;

function event_spawn(e)
	eq.set_timer("depop",30*60*1000);
	eq.set_next_hp_event(70);
end

function event_hp(e)
	if (e.hp_event == 70) then
		e.self:Emote("produces a bright red crystal and tosses it to the ground near her feet. The crystal shatters and a fire elemental surges forth and attacks.");
		e.self:Shout("Meet Flamegore the Destroyer! Eliminate them, my servant.");
		eq.set_next_hp_event(45);
	elseif (e.hp_event == 45) then
		e.self:Emote("produces a bright red crystal and tosses it to the ground near her feet. The crystal shatters and a fire elemental surges forth and attacks.");
		e.self:Shout("If Flamegore was not enough to destroy you, then I shall unleash Sizzle! His heat is extravagant and even he can barely control it!");	
		eq.set_next_hp_event(20);
	elseif (e.hp_event == 20) then
		e.self:Emote("produces a bright red crystal and tosses it to the ground near her feet. The crystal shatters and a fire elemental surges forth and attacks.");
		e.self:Shout("If Flamegore was not enough to destroy you, then I shall unleash Sizzle! His heat is extravagant and even he can barely control it!");
		eq.set_next_hp_event(10);
	elseif (e.hp_event == 10) then
		local npc = eq.get_entity_list():GetMobByNpcTypeID(300099);			
		if (npc.valid) then
			npc:Damage(e.self, 1000000, 0, 1);					
			new_hp= e.self:GetHP()+e.self:GetMaxHP()/10;
			e.self:SetHP(new_hp);
			eq.set_next_hp_event(10);
		end;
		
	end
end

function event_timer(e)
local new_hp;
	if e.timer=="check_hp" then
		if (e.self:GetHPRatio() <=10) then
			local npc = eq.get_entity_list():GetMobByNpcTypeID(300099);			
			if (npc.valid) then
				npc:Damage(e.self, 1000000, 0, 1);					
				new_hp= e.self:GetHP()+e.self:GetMaxHP()/10;
				e.self:SetHP(new_hp);					
			end;
		end
	elseif e.timer=="eshock" then
		e.self:CastSpell(5810,e.self:GetID());
	end
end
	