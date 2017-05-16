function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 100, e.self:GetX() + 100, e.self:GetY() - 100, e.self:GetY() + 100);
end

function event_enter(e)
	if(e.other:Class() == "Druid") then
		local qglobals = eq.get_qglobals(e.self,e.other);
		if(qglobals["druid_epic"] == "10" and qglobals["druid_qin"] == nil and eq.get_entity_list():IsMobSpawnedByNpcTypeID(281089) == false ) then	
			eq.spawn2(281089, 0, 0, -886,-733,27.2,0); --#Mastruq_Commander_Gorlakt 
			eq.spawn2(281091, 0, 0, -873,-719.5,28.5,0); --#Spiritlord_Body
			eq.spawn2(281090, 0, 0, -901,-719.5,28.5,0); --#Spiritlord_Mind
			eq.set_timer("depop",30*60*1000);
			eq.set_global("druid_qin","1",3,"H2");
		end
	end
end

function event_timer(e)
	if e.timer=="depop" then
		eq.stop_timer("depop");
		eq.depop_all(281089);
		eq.depop_all(281091);
		eq.depop_all(281090);
	end
end