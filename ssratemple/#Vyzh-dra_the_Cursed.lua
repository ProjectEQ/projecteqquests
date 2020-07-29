function event_spawn(e)
	eq.set_timer('depop', 1800 * 1000);
end

function event_combat(e)
	if (e.joined == true) then
		if(not eq.is_paused_timer('depop')) then
			eq.pause_timer('depop');
		end
	else
		eq.resume_timer('depop');
		e.self:SaveGuardSpot(e.self:GetX(),e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	end
end

function event_timer(e)
	if (e.timer == 'depop') then
		eq.depop();
	end
end

function event_slay(e)
	eq.zone_emote(0,"Vyzh-dra the Cursed shouts, 'Tell your gods that I will be coming for them next!");
end

function event_death_complete(e)
	eq.zone_emote(0,"Vyzh-dra the Cursed shouts, 'I cannot die! I am the only true god!");
	e.self:Emote("crashes to the ground. A horrific sound fills the room, but vanishes as quickly as it came.");
	eq.signal(162255,3); -- NPC: #cursed_controller
end
