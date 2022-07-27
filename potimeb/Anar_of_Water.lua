--Anar_of_Water (223104)
--Phase 1 - Anar of Water Trial
--potimeb


function event_death_complete(e)
	-- send a signal to the #water_trigger that I died
	eq.signal(223172,1);
end

function event_spawn(e)
	eq.set_next_hp_event(91);
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("reset");
	else
		eq.set_timer("reset", 5 * 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "reset" and not e.self:IsEngaged() then
		eq.set_next_hp_event(91);
	end
end

function event_hp(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	local heading = e.self:GetHeading();
	if (e.hp_event == 91) then
		-- spawn 2 a_deepwater_triloun
		eq.spawn2(eq.ChooseRandom(223100,223115),0,0,xloc,yloc + 5,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223100,223115),0,0,xloc,yloc - 5,zloc,heading);
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		-- spawn 2 a_deepwater_triloun
		eq.spawn2(eq.ChooseRandom(223100,223115),0,0,xloc,yloc + 5,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223100,223115),0,0,xloc,yloc - 5,zloc,heading);
		eq.set_next_hp_event(21);
	elseif (e.hp_event == 21) then
		e.self:Emote("swirls with newfound power, then begins lashing out furiously at those within reach.");
		e.self:ModifyNPCStat("min_hit","350");
		e.self:ModifyNPCStat("max_hit","1300");
		e.self:ModifyNPCStat("attack_delay","11");	--in percent (default is 15%)
		e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage,0,40);	--increase area rampage
	end
end
