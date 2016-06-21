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