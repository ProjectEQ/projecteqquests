function event_enter_zone(e)
  	if(e.self:HasItem(12080)) then -- Player has Enchated Signet of Disciples on their character and Zones in.
    		e.self:Message(15, "The Signet begins to glow");
	end
	
	if(e.self:HasItem(69941) and e.self:HasItem(69952) and e.self:HasItem(69942) and e.self:HasItem(69983)) then -- Paladin 1.5 trigger
    	local qglobals = eq.get_qglobals(e.self);
		if(qglobals["paladin_wos"] ==  nil) then
			eq.spawn2(300087,0,0,-1118.76,1007,13.45,113);
			eq.set_global("paladin_wos","1",3,"H2");			
		end		
	end
end


function event_loot(e)
	if(e.self:Class() == "Warrior" and e.item:GetID() == 60312) then -- Stone of Eternal Power: Northeast Eye
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["warrior_epic"] == "10" and qglobals["warr_epic_wos"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("warr_epic_wos","1",5,"F");
		end
	elseif(e.self:Class() == "Wizard" and e.item:GetID() == 11445) then  --Fluxing Rod
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["wiz_epic"] == "1" and qglobals["wiz_wos_chest"] == nil) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("wiz_wos_chest","1",5,"F");
		end
	elseif(e.self:Class() == "Paladin" and e.item:GetID() == 69971) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["paladin_epic"] == "6" and qglobals["paladin_epic_wos"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("paladin_epic_wos","1",5,"F");
		end
		e.self:Message(6,"As you hold the sword, your soul is tugged for a few seconds and then all four soulstones speak in unison, 'This sword is the key, this sword is the misery, this sword is the instrument that took us away, and this sword is what will set us free. Take this cursed sword to Irak Altil, for he will know how to end our pain.");	
	end
end