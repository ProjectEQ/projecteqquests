function event_death(e)
	if(math.random(5)==1) then
		local clist = eq.get_entity_list():GetClientList();
		if ( clist ~= nil ) then
			for currclient in clist.entries do
				if(currclient:GetClass() ==7) then			
				local qglobals = eq.get_qglobals(currclient);
					if(qglobals["monk_epic"] == "5" and qglobals["monk_epic_scarlet"] == nil) then				
						eq.spawn2(175179,0,0,-1024,666,157,247);
						eq.set_global("monk_epic_scarlet","1",3,"H2");
						return; --only spawn 1
					end
				end
			end
		end
	end
end