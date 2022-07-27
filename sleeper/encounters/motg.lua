--#Master_of_the_Guard (128145)
--#a_foreboding_sentry (128063)
-- the way this script functions is how it was parsed on live; he will run through the chronological order of signaling adds, if they(untargettable sentries) are not up it simply doesnt spawn anything and continues down the chain
-- Written by Huffin

function MOTG_Combat(e)
  if (e.joined == true) then
    eq.set_timer("adds", 3 * 1000);
  else
    eq.stop_timer("adds");
	eq.stop_timer("adds2");
	eq.stop_timer("adds3");
	eq.stop_timer("adds4");
  end
end

function MOTG_Timer(e)
  if(e.timer=="adds") then
    eq.stop_timer("adds");
    eq.signal(128005,1); --#a_foreboding_sentry1 (128005)
    eq.signal(128007,1); --#a_foreboding_sentry2 (128007)
    eq.set_timer("adds2", 50 * 1000);
  elseif(e.timer=="adds2") then
    eq.stop_timer("adds2");
    eq.signal(128006,1); --#a_foreboding_sentry3 (128006)
    eq.signal(128003,1); --#a_foreboding_sentry4 (128003)
    eq.set_timer("adds3", 50 * 1000);
  elseif(e.timer=="adds3") then
    eq.stop_timer("adds3");
    eq.signal(128001,1); --#a_foreboding_sentry5 (128001)
    eq.signal(128004,1); --#a_foreboding_sentry6 (128004)
    eq.set_timer("adds4", 50 * 1000);
  elseif(e.timer=="adds4") then
    eq.stop_timer("adds4");
    eq.signal(128000,1); --#a_foreboding_sentry7 (128000)
    eq.signal(128002,1); --#a_foreboding_sentry8 (128002)
  end
end

function Sentry_Signal(e)
  eq.spawn2(128063, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
  eq.spawn2(128063, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
  eq.depop_with_timer();
end

function Sentry_Combat(e)
	if (e.joined == true) then
		eq.stop_timer("aggro");
	else
    	eq.set_timer("aggro", 5 * 1000);
  	end
end

function Sentry_Spawn(e)
	eq.set_timer("aggro", 5 * 1000);
end

function Sentry_Timer(e)
if(e.timer=="aggro") then

	local get_client=eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),1440000);

	--get client within 1200 radius			
		if (get_client.valid and not get_client:GetFeigned()) then --need to add check for hide and improved hide (shroud of stealth)
			
			e.self:AddToHateList(get_client,1);
		end
end
end

function event_encounter_load(e)
    eq.register_npc_event('motg', Event.combat, 128145, MOTG_Combat);
    eq.register_npc_event('motg', Event.timer, 128145, MOTG_Timer);

    eq.register_npc_event('motg', Event.signal, 128000, Sentry_Signal);
  eq.register_npc_event('motg', Event.signal, 128001, Sentry_Signal);
  eq.register_npc_event('motg', Event.signal, 128002, Sentry_Signal);
  eq.register_npc_event('motg', Event.signal, 128003, Sentry_Signal);
  eq.register_npc_event('motg', Event.signal, 128004, Sentry_Signal);
  eq.register_npc_event('motg', Event.signal, 128005, Sentry_Signal);
  eq.register_npc_event('motg', Event.signal, 128006, Sentry_Signal);
  eq.register_npc_event('motg', Event.signal, 128007, Sentry_Signal);

	eq.register_npc_event('motg', Event.spawn, 128063, Sentry_Spawn);
	eq.register_npc_event('motg', Event.combat, 128063, Sentry_Combat);
	eq.register_npc_event('motg', Event.timer, 128063, Sentry_Timer);

end
