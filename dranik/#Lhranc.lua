--dranik/#Lhranc.lua NPCID 
--Shadowknight Epic 2.0
function event_death_complete(e)
	eq.signal(336098,2);
end


function event_combat(e)
    if (e.joined == true) then
        eq.stop_all_timers();
		e.self:CastSpell(17042, e.self:GetTarget():GetID());
		--eq.set_timer("harmtouch", 1000);
        eq.set_timer("defiled", 4000);
		e.self:Say("You are powerful indeed, but I am the first of the shadowknights! The first to walk in shadow and command the dead! Now you shall witness true power!");
    else
        eq.stop_all_timers();
        eq.set_timer("reset", 900000); -- 15 mins
    end
end

function event_timer(e)
    if (e.timer == "reset") then
		eq.depop();
	--elseif (e.timer == "harmtouch") then
		
    elseif (e.timer == "defiled") then
        e.self:CastSpell(3955, e.self:GetTarget():GetID()); --Defiled Insanity
        eq.set_timer("defiled", 60*1000);
    end
end