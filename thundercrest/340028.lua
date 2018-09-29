--[[

##Yarlir Script by Drogerin##

Huffers notes:

-Rotates between 4 forms every 30 seconds when door locks at 96%(cycle is RNG, can choose the same form multiple times in a row)
-Door locks at 96%(also unlocks at 96% if you wipe)
-4d20hr lockout on win
-<Wind Shear> proc on all forms
-9 fangs/1 eye on corpse + chest with 3 loots

-YarLir the Living Storm --<YarLir's Cone of Storms> 15s
--<Icicle Blizzard> 25s

-YarLir the Hurricanes Eye
--spawns "an unstable storm" every 20 sec and they are non kos and run to a statue to explode immediately after spawning cast <Forcequake> if they reach statue (takes them 6 seconds from spawn to explode time if they arent touched, then they despawn)
--<Icicle Blizzard> 25s

-Yar`Lir the Mistress of Winds
--<Wing Buffet> 20s
--<Icicle Blizzard> 25s

-Yar`Lir the Matriarch
--spawns "a blizzard seeker" every 20 sec. These despawn after 60 seconds
--<Icicle Blizzard> 25s



#loc -3480.22,3146.58,302.91,420.0 (Porting purposes)





--]]

function event_combat(e)
	if (e.joined == true) then
		e.self:AddAISpell(0, 6603, 1, -1, 15,-425);
		eq.set_timer("Shapeshift",30000);
		eq.set_next_hp_event(96);
	elseif (e.joined == false) then
		e.self:SetHP(e.self:GetMaxHP());
		e.self:WipeHateList();
		eq.stop_all_timers();
		eq.get_entity_list():FindDoor(30):SetLockPick(0); -- unlock door upon fail
		eq.get_entity_list():FindDoor(31):SetLockPick(0); -- unlock door upon fail
	end
end

function event_hp(e)
	if (e.hp_event == 96) then
		eq.get_entity_list():FindDoor(30):SetLockPick(-1); -- lock door
		eq.get_entity_list():FindDoor(31):SetLockPick(-1); -- lock door
		eq.zone_emote(15,"Yar`Lir flaps her wings and the winds cause the doors behind you to slam shut."); -- emote to players doors shut, need exact statement.
	end
end

function event_timer(e)
	if (e.timer == "Shapeshift") then
		eq.stop_timer("Unstable");
		eq.stop_timer("Seekers");
	local which = math.random(4); -- Spawn one of these 4 Options
			if  (which == 1) then
				e.self:TempName("Yar`lir the Living Storm");
				e.self:AddAISpell(0, 6603, 1, -1, 15,-425);
				e.self:RemoveAISpell(6605);
			elseif (which == 2) then
				e.self:TempName("Yar`lir the Mistress of Winds");
				e.self:AddAISpell(0, 6605, 1, -1, 20,-425);
				e.self:RemoveAISpell(6603);
			elseif (which == 3) then
				e.self:TempName("Yar`lir the Matriarch");
				eq.set_timer("Seekers",20000);
				e.self:RemoveAISpell(6603);
				e.self:RemoveAISpell(6605);
			elseif (which == 4) then
				e.self:TempName("Yar`lir the Hurricane`s Eye");
				eq.set_timer("Unstable",20000);
				e.self:RemoveAISpell(6603);
				e.self:RemoveAISpell(6605);
			end
	elseif (e.timer == "Seekers") then
		eq.spawn2(340029,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	elseif (e.timer == "Unstable") then
		eq.spawn2(340030,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	end
end

function event_death_complete(e)
		eq.get_entity_list():FindDoor(30):SetLockPick(0); -- unlock door upon success
		eq.get_entity_list():FindDoor(31):SetLockPick(0); -- unlock door upon success
		eq.spawn2(340031,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
end
