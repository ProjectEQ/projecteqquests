-- #Tallon_Zek (214108) part of RZTWL script Huffin rewrite
function event_spawn(e)
    eq.set_timer('depop', 1020 * 1000); --17 minutes of no combat on either one until vz/tz depop happens
    e.self:SetRunning(true);
end

function event_death_complete(e)
    eq.signal(214123, 214108) -- tell trigger that Tallon is dead
    eq.signal(214086,1); -- tell the Hendin's to start their timer on depop
end

function event_combat(e)
	if (e.joined == true) then
		if(not eq.is_paused_timer('depop')) then
			eq.pause_timer('depop');
		end
	eq.set_timer("OOBcheck", 6 * 1000);
	eq.set_timer("barb", math.random(1, 4) * 1000)
	else
		eq.resume_timer('depop');
		eq.stop_timer("barb");
		eq.stop_timer("OOBcheck");
	end
end

function event_timer(e)
    if (e.timer == "barb") then
        e.self:CastSpell(eq.ChooseRandom(2449, 2450, 2451, 2452), e.self:GetTarget():GetID())
        eq.set_timer("barb", math.random(1, 6) * 1000)
    elseif (e.timer == 'depop') then
	eq.signal(214123,777); --  tell trigger mob tz/vz failed, reset sequence
	eq.depop_all(214129); -- depop VZ splits
	eq.depop_all(214111); -- #Vallon_Zek_ (214111)
	eq.depop_all(214086); --Hendin_Shadow_Master (214086)
	eq.depop_all(214084); --Gindan_Flayer 214084
	eq.depop();
elseif(e.timer=="OOBcheck") then
	if (e.self:GetX() > 650) then
		e.self:GMMove(365,11,181,129); -- does not wipe hate list
	else
		eq.set_timer("OOBcheck", 6 * 1000);
	end
    end
end

function event_waypoint_arrive(e)
	if(e.wp == 9) then
        eq.spawn2(214086,0,0,301,-57,169,0); --Hendin_Shadow_Master (214086)
        eq.spawn2(214086,0,0,271,-57,169,0); --Hendin_Shadow_Master (214086)
        eq.spawn2(214086,0,0,361,-57,169,0); --Hendin_Shadow_Master (214086)
        eq.spawn2(214086,0,0,391,-57,169,0); --Hendin_Shadow_Master (214086)
    end
end
