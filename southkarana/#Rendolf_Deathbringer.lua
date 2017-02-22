--14188
function event_spawn(e)
	eq.set_timer("gate",6*60*1000);
end

function event_timer(e)
	if(e.timer=="dialog1") then
		eq.stop_timer("dialog1");
		e.self:Say("Haven't you heard? One of your Erudite cohorts in Paineel has already done it. Silly, if you ask me. Animating heads? What good is that?");
		eq.signal(14191,1);
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
	end
end	