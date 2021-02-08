-- #Rallos_Zek (214109) alive version, Huffin rewrite
function event_spawn(e)
	eq.zone_emote(0, "A tremor rumbles through the halls of Drunder. Terror wells up inside you as you struggle to keep your footing.");
	eq.set_next_hp_event(55);
	eq.set_timer('depop', 1020 * 1000); --17 minutes until depop
end

function event_hp(e)
	if(e.hp_event == 55) then
		e.self:Emote("laughs in an ominous tone of death.  'Flee whelps! Flee before the might of the Warlord!");
		eq.signal(214123,214052); --  tell trigger mob mini Rallos is dead
		eq.depop();
	end
end

function event_combat(e)
	if (e.joined == true) then
		if(not eq.is_paused_timer('depop')) then
			eq.pause_timer('depop');
		end
	eq.set_timer('adds', 45 * 1000);
	eq.set_timer("OOBcheck", 6 * 1000);
	else
		eq.resume_timer('depop');
		eq.stop_timer('adds');
		eq.stop_timer("OOBcheck");
	end
end

function event_timer(e)
	if (e.timer == 'depop') then
		eq.signal(214123,500); --  tell trigger mob mini Rallos depopped
		eq.depop();
	elseif (e.timer == 'adds') then
		eq.spawn2(214130,0,0,978,-560,133,385); -- NPC: A_Decorin_Elite
		eq.spawn2(214130,0,0,978,580,133,385); -- NPC: A_Decorin_Elite
	elseif(e.timer=="OOBcheck") then
		if (e.self:GetZ() < 50) then
			e.self:GMMove(365,11,181,129); -- does not wipe hate list
			eq.zone_emote(0, "Rallos begins to laugh, causing the earth to rumble around you. 'Enough of this foolishness! The warlord has better things to do then chase petty mortals all day!");
		else
			eq.set_timer("OOBcheck", 6 * 1000);
		end
	end
end
