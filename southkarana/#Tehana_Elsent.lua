--14191
function event_spawn(e)
	eq.set_timer("gate",6*60*1000);
end

function event_timer(e)
	if(e.timer=="dialog1") then
		eq.stop_timer("dialog1");
		e.self:Say("'It doesn't matter if it is any use to you, fathead. It's a matter of being able to do it at all. We've always needed the majority of the body to get it animated properly. The ability to animate parts of the body might lead to some new avenue that we haven't thought of yet.");
		eq.signal(14189,2);
	elseif(e.timer=="dialog2") then
		eq.stop_timer("dialog2");
		e.self:Say("That's true!");
		eq.signal(14190,3);			
	elseif(e.timer=="gate") then
		eq.stop_timer("gate");
		e.self:CastSpell(36, 0);
		eq.set_timer("depop",3000);
	elseif(e.timer=="depop") then
		eq.stop_timer("depop");
		eq.depop_with_timer();
	end
end

function event_signal(e)
	if(e.signal == 1) then
		eq.set_timer("dialog1",6*1000);		
	elseif(e.signal == 2) then
		eq.set_timer("dialog2",6*1000);
	end
end	