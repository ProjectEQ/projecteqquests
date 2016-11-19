--draniksscar
local recepactive=false;

function event_enter_zone(e)
	if(e.self:Class() == "Warrior" ) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["warrior_epic"] >= "2") then                                
			eq.set_timer("borer",5000);
		end
	end
end

function event_timer(e)
	if(e.timer == "borer") then
		if(e.self:GetItemIDAt(30)==60300 and recepactive==false) then --energy receptor on cursor
			e.self:Message(4,"The energy receptor appears to be active");		
			eq.depop_all(302050);
			eq.spawn2(302050, 0, 0, 155,-1053,29.5, 76);
			eq.create_ground_object(60301,155,-1053,29.5,0,150000);	
			recepactive=true;
		end
	end
end

function event_loot(e)
	if(e.self:Class() == "Beastlord" and e.item:GetID() == 52907) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["beast_epic"] == "15" and qglobals["beast_epic_ds"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("beast_epic_ds","1",5,"F");
		end
	end	
end