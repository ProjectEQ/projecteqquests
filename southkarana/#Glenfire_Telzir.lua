--14189
function event_spawn(e)
	eq.set_timer("gate",6*60*1000);
end

function event_timer(e)
	if(e.timer=="dialog1") then
		eq.stop_timer("dialog1");
		e.self:Emote("glares at Finnelzi.");
		eq.signal(14188,1); -- NPC: #Rendolf_Deathbringer
	elseif(e.timer=="dialog2") then
		eq.stop_timer("dialog2");
		e.self:Say("In a few weeks none of that will matter.");
		eq.signal(14191,2); -- NPC: #Tehana_Elsent
	elseif(e.timer=="dialog3") then
		eq.stop_timer("dialog3");
		e.self:Say("Shut up, Fin.");
		eq.signal(14196,1); -- NPC: #Azibelle_Spavin
	elseif(e.timer=="gate") then
		eq.stop_timer("gate");
		e.self:CastSpell(36, 0); -- Spell: Gate
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
	elseif(e.signal == 3) then
		eq.set_timer("dialog3",6*1000);		
	end
end	