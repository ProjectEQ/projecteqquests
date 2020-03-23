sub EVENT_SPAWN {
	quest::setnexthpevent(51);
	quest::SetRunning(1);
}

sub EVENT_DEATH_COMPLETE {
	quest::stoptimer("despawn");
	quest::signalwith(214123, 214111, 0);	# Tell trigger that Vallon is dead
	quest::signalwith(214084,1);
}

sub EVENT_HP {
	if($hpevent == 51) {
    quest::spawn2(214129,0,0,($x + 10),$y,$z,$h);
    quest::spawn2(214129,0,0,($x + 10),$y,$z,$h);
  }
}	

sub EVENT_SIGNAL {
  quest::stoptimer("despawn");
  quest::depop();
  quest::depopall(214084);
  quest::depopall(214128);
}

sub EVENT_TIMER {
	if ($timer eq "despawn") {
		quest::stoptimer("despawn");
		quest::depop();
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 9) {
		quest::spawn2(214084,0,0,359,73,169,255); # Gindan_Flayer 214084
		quest::spawn2(214084,0,0,383,73,169,255); # Gindan_Flayer 214084
		quest::spawn2(214084,0,0,308,73,169,255); # Gindan_Flayer 214084
		quest::spawn2(214084,0,0,283,73,169,255); # Gindan_Flayer 214084
	}
}

# End of File  Zone: PoTactics  ID: 214111 -- #Vallon_Zek_ part of rztwl script
# Used in Rallos Zek event

function event_spawn(e)
	eq.set_next_hp_event(51);
	e.self:SetRunning(true);
	eq.set_timer('depop', 1020 * 1000); --17 minutes of no combat on either one until vz/tz depop happens
end

function event_hp(e)
	if(e.hp_event == 51) then
		eq.spawn2(214129,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --VZ split
		eq.spawn2(214129,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --VZ split
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 9) then
		eq.spawn2(214084,0,0,359,73,169,255); --Gindan_Flayer 214084
		eq.spawn2(214084,0,0,383,73,169,255); --Gindan_Flayer 214084
		eq.spawn2(214084,0,0,308,73,169,255); --Gindan_Flayer 214084
		eq.spawn2(214084,0,0,283,73,169,255); --Gindan_Flayer 214084
	end
end

function event_death_complete(e)
	eq.signal(214123,214111); -- Tell trigger that Vallon is dead
	eq.signal(214084,1); --signal gindan flayers for depop script
end

function event_combat(e)
	if (e.joined == true) then
		if(not eq.is_paused_timer('depop')) then
			eq.pause_timer('depop');
		end
	else
		eq.resume_timer('depop');
	end
end

function event_timer(e)
if (e.timer == 'depop') then
	eq.signal(214123,777); --  tell trigger mob tz/vz failed, reset sequence
	eq.depop_all(214129); -- depop VZ splits
	eq.depop_all(214108); -- depop #Tallon_Zek (214108)
	eq.depop_all(214086); --Hendin_Shadow_Master (214086)
	eq.depop_all(214084); --Gindan_Flayer 214084
	eq.depop();
end
end
