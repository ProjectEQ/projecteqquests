--[[  


Volkara written by ##Drogerin


341063 ##Volkara


--]]

local egg_client=nil;
local count = 0;


function event_combat(e)
	if (e.joined == true) then
		eq.set_next_hp_event(80);
	elseif (e.joined == false) then
		eq.stop_timer("egg_client");
		eq.set_timer("Combat",15000);
		eq.set_timer("Respawn",20000);
		count=0;
	end
end


function event_hp(e)
	if (e.hp_event == 80)  then
		eq.zone_emote(10,"Volkara stamps its legs causing eggs to fall from the ceiling.");
		eq.set_timer("egg_client",1);
		eq.set_next_hp_event(60);
	elseif (e.hp_event == 60) then
		eq.zone_emote(10,"Volkara stamps its legs causing eggs to fall from the ceiling.");
		eq.set_timer("egg_client",1);
		eq.set_next_hp_event(40);
	elseif (e.hp_event == 40) then
		eq.zone_emote(10,"Volkara stamps its legs causing eggs to fall from the ceiling.");
		eq.set_timer("egg_client",1);
		eq.set_next_hp_event(20);
	elseif (e.hp_event == 20) then
		eq.zone_emote(10,"Volkara stamps its legs causing eggs to fall from the ceiling.");
		eq.set_timer("egg_client",1);
		eq.set_next_hp_event(10);
	elseif (e.hp_event == 10) then
		eq.zone_emote(10,"Volkara stamps its legs causing eggs to fall from the ceiling.");
		eq.set_timer("egg_client",1);
	end
end
	 
function event_timer(e)
	if (e.timer == "egg_client") then
		egg_client=eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),1000000);
			if (egg_client.valid) then
				local clientx=egg_client:GetX()
				local clienty=egg_client:GetY()
				local clientz=egg_client:GetZ()
				local clienth=egg_client:GetHeading()
					eq.spawn2(341064,0,0,clientx,clienty,clientz,clienth)
					count=count+1;
				if count == 5 then
					eq.stop_timer('egg_client');
					count=0;
				end
			end
	elseif (e.timer == "Combat") then
		eq.depop_all(341065);
		eq.depop_all(341064);
		eq.stop_timer("Combat");
	elseif (e.timer == "Respawn") then
		eq.depop(341063);
		eq.spawn2(341063,0,0,-1952.39,-1877.55,-156.35,93.0); -- NPC: Volkara
		eq.stop_all_timers();
	end
	
end
