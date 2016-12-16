function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["monk_epic"] >= "4" and e.message:findi("hail")) then
		e.self:Say("I have nothing for you unless say you have the  [" .. eq.say_link("right price") .. "].");
	elseif(qglobals["monk_epic"] >= "4" and e.message:findi("right price")) then
			e.self:Say("I have just placed my 'ands on this 'ere book and I'd be willin to part with it for a mighty price else you could try and [" .. eq.say_link("defeat") .. "] me crew.");
	elseif(qglobals["monk_epic"] >= "4" and e.message:findi("defeat")) then
			e.self:Say("I am sorry, we don't currently have any work available. We are still setting up, and cleaning up the orcish filth from this area. Return later, I should have some work available.");
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(25, 0);
		e.self:AddToHateList(e.other,1);
		eq.set_timer("adds",5*1000);
		eq.set_timer("depop",900*1000);
	elseif(e.message:findi("hail")) then
			e.self:Say("Go away!");
	end		
end

function event_timer(e)
	if(e.timer=="adds") then
		eq.stop_timer("adds");
		e.self:Say("You sorry sacks of vermin come aid me now!");
		eq.spawn2(225380,0,0,e.self:GetX()-20,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(225381,0,0,e.self:GetX()-20,e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(225381,0,0,e.self:GetX()-20,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(225382,0,0,e.self:GetX()-20,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading());
		
	elseif(e.timer=="depop") then
		eq.depop_with_timer();
		eq.depop_all(225380);
		eq.depop_all(225381);
		eq.depop_all(225382);
	end
end

function event_death_complete(e)
		eq.depop_all(225380);
		eq.depop_all(225381);
		eq.depop_all(225382);
end