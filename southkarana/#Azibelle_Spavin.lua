--14196
function event_spawn(e)
	eq.set_timer("gate",6*60*1000);
end

function event_timer(e)
	if(e.timer=="gate") then
		e.self:CastSpell(36, 0); -- Spell: Gate
		eq.set_timer("depop",3000);
	elseif(e.timer=="gate") then
		eq.stop_timer("gate");
		e.self:CastSpell(36, 0); -- Spell: Gate
		eq.set_timer("depop",3000);
	elseif(e.timer=="depop") then
		eq.stop_timer("depop");
		eq.depop_with_timer();
	elseif(e.timer=="dialog1") then
		eq.stop_timer("dialog1");
		e.self:Say("That's long enough. Let's go. It's his fate if he doesn't show up soon.");		
	end
end

function event_signal(e)
	if(e.signal == 1) then
		eq.set_timer("dialog1",5*60*1000);			
	end
end
	