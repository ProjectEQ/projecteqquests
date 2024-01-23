-- Volkara's Bite - Dragons of Norrath Tier 3 Progression

local egg_count	= 0;
local hp_event	= 0;

function Volkara_Spawn(e)
	hp_event		= 80;
end

function Volkara_Combat(e)
	if e.joined then
		eq.set_next_hp_event(80);
	else
		eq.stop_timer("egg_spawn");
		eq.set_timer("Combat",15 * 1000);
		eq.set_timer("Respawn",20 * 1000);
		count = 0;
	end
end

function Volkara_HP(e)
	if e.hp_event == 80 or e.hp_event == 60 or e.hp_event == 40 or e.hp_event == 20 or e.hp_event == 10 then
		if hp_event > 20 then
			hp_event = hp_event - 20;
		elseif hp_event == 10 then
			hp_event = 100
		else
			hp_event = 10;
		end
		eq.set_next_hp_event(hp_event);

		eq.zone_emote(MT.NPCQuestSay,"Volkara stamps its legs causing eggs to fall from the ceiling.");
		eq.set_timer("egg_spawn",1);
	end
end
	 
function Volkara_Timer(e)
	if e.timer == "egg_spawn" then
		local egg_client = eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),1000000);
		if egg_client.valid then
			local egg_clientx,egg_clienty,egg_clientz,egg_clienth = egg_client:GetX(), egg_client:GetY(), egg_client:GetZ(), egg_client:GetHeading();
			eq.spawn2(341064,0,0,egg_clientx,egg_clienty,egg_clientz,egg_clienth);
			egg_count = egg_count + 1;
			if egg_count == 5 then
				eq.stop_timer('egg_spawn');
				egg_count = 0;
			end
		end
	elseif e.timer == "Combat" then
		eq.depop_all(341065);
		eq.depop_all(341064);
		eq.stop_timer("Combat");
	elseif e.timer == "Respawn" then
		eq.depop(341063);
		eq.spawn2(341063,0,0,-1952.39,-1877.55,-156.35,93.0); -- NPC: Volkara
		eq.stop_all_timers();
	end
end

function Egg_Spawn(e)
	eq.set_timer("Hatch",30 * 1000);
end

function Egg_Timer(e)
	if e.timer == "Hatch" then
		eq.zone_emote(MT.Yellow,"Egg Sac bursts open releasing spiders.");
		eq.spawn2(341065,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: Magma_Spiderling
		eq.spawn2(341065,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: Magma_Spiderling
		eq.depop();
	end
end

function event_encounter_load(e)
	eq.register_npc_event(Event.timer,			341063, Volkara_Timer);
	eq.register_npc_event(Event.hp,				341063, Volkara_HP);
	eq.register_npc_event(Event.combat,			341063, Volkara_Combat);
	eq.register_npc_event(Event.spawn,			341063, Volkara_Spawn);

	eq.register_npc_event(Event.spawn,			341064, Egg_Spawn);
	eq.register_npc_event(Event.timer,			341064, Egg_Timer);
end
