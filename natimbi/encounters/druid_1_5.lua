--280069 Reborn
--280090 #Ritual_Conduit
--280091 #Noc_Juggernaut

function RC_Spawn(e)
	eq.spawn2(280069,0,0,1511,974,518,190);
	eq.spawn2(280069,0,0,1468,897,518,246);
	eq.spawn2(280069,0,0,1376,948,518,216);
	eq.spawn2(280069,0,0,1381,988,518,90);
	eq.spawn2(280069,0,0,1378,1006,517,90);
	eq.spawn2(280069,0,0,1397,1012,518,90);
	eq.spawn2(280069,0,0,1274,1165,468,152);
	eq.spawn2(280069,0,0,1257,1030,468,216);
	eq.spawn2(280069,0,0,1308,1115,468,216);
	eq.spawn2(280069,0,0,1202,1055,468,25);
	eq.set_timer("depop",15*60*1000);	
	--eq.spawn2(280091,0,0,1451.65,957.84,517.86,216);
end

function RC_Timer(e)
	if(e.timer=="depop") then
		eq.stop_timer("depop");
		eq.depop();
		eq.depop_all(280069);
		eq.depop_all(280091);
	end
end

function Jugg_Spawn(e)
	eq.set_timer("depop",15*60*1000);
end

function Jugg_Combat(e)
	if (e.joined == true) then		
		eq.set_timer("conduit",7*1000); --Energy Conduit:
		eq.set_timer("checkleash",1*1000);
	else
		eq.stop_timer("conduit");
		eq.stop_timer("checkleash");
	end
end

function Jugg_Timer(e)
	if(e.timer=="depop") then
		eq.stop_timer("depop");
		eq.depop();
		eq.depop_all(280069);
		eq.depop_all(280090);
	elseif (e.timer=="conduit") then
		eq.stop_timer("conduit");
		e.self:CastSpell(5800, e.self:GetHateTop():GetID());
		eq.set_timer("conduit",20*1000);
	elseif (e.timer == "checkleash") then
		if (e.self:CalculateDistance(1451,957,517) > 95) then
			e.self:GotoBind()
			e.self:SetHP(e.self:GetMaxHP())
			e.self:CastSpell(3791, e.self:GetID())
			e.self:WipeHateList();
		end
	end
end

function Reborn_Death(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(280069) == false) then
		eq.spawn2(280091,0,0,1451.65,957.84,517.86,216);
		eq.depop_all(280090);
	end
end


function event_encounter_load(e)
  eq.register_npc_event('druid_1_5', Event.timer,          280090, RC_Timer); 
  eq.register_npc_event('druid_1_5', Event.spawn,          280090, RC_Spawn);
  eq.register_npc_event('druid_1_5', Event.combat,         280091, Jugg_Combat);   
  eq.register_npc_event('druid_1_5', Event.timer,         	280091, Jugg_Timer);
  eq.register_npc_event('druid_1_5', Event.spawn,         	280091, Jugg_Spawn);
  eq.register_npc_event('druid_1_5', Event.death_complete,  280069, Reborn_Death); 
end