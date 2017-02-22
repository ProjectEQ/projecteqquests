--14190
function event_spawn(e)
	eq.set_timer("gate",6*60*1000);
	--eq.set_timer("dialog",5*59*1000);
	eq.set_timer("dialog1",2*1000)
end

function event_timer(e)
	if(e.timer=="gate") then
		eq.stop_timer("gate");
		e.self:CastSpell(36, 0);
		eq.set_timer("depop",3000);
	elseif(e.timer=="depop") then
		eq.stop_timer("depop");
		eq.depop_with_timer();
	elseif(e.timer=="dialog1") then
		eq.stop_timer("dialog1");
		e.self:Say("I can't believe that we're here waiting for that boy again. You know he should never have been given a spot in the coven, he's too unreliable.");
		eq.set_timer("dialog2",6*1000);
	elseif(e.timer=="dialog2") then
		eq.stop_timer("dialog2");
		e.self:Emote("mutters under his breath");
		eq.signal(14189,1);		
	elseif(e.timer=="dialog3") then
		eq.stop_timer("dialog3");
		e.self:Say("About that. I know it's importaint to all of you, but. . .");
		eq.signal(14189,3);
	end
end

function event_signal(e)
	if(e.signal == 2) then
		eq.set_timer("dialog2",6*1000);
	elseif(e.signal == 3) then
		eq.set_timer("dialog3",6*1000);		
	end
end	