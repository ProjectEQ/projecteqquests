--Akksstaff`s Minion 44108
local numadds=0;
function event_combat(e)
	if(e.joined) then
		eq.set_timer("adds",5*1000)
	else
		eq.set_timer("depop",1000)
	end
end

function event_timer(e)
	if(e.timer=="adds" and numadds <10) then
		numadds=numadds+1;
		eq.spawn2(44109,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: Host_of_Akksstaff
	elseif(e.timer=="depop") then
		eq.depop();
	end
end

function event_death_complete(e)
	eq.set_global("ask_minion_dead","1",3,"M5");
end