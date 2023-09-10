--[[

##Yarlir Script by Drogerin##
--]]
local don = require("dragons_of_norrath")

local had_gm = false

function event_combat(e)
	if e.joined then
		e.self:AddAISpell(0, 6603, 1, -1, 15,-425);
		eq.set_timer("Shapeshift",30000);
		eq.set_next_hp_event(96);
	else
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
		eq.zone_emote(MT.Yellow,"Yar`Lir flaps her wings and the winds cause the doors behind you to slam shut."); -- emote to players doors shut, need exact statement.
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
		eq.spawn2(340029,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_blizzard_seeker
	elseif (e.timer == "Unstable") then
		eq.spawn2(340030,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #an_unstable_storm
	end
end

function event_death(e)
	-- try to prevent gms from triggering nest unlock while testing
	if not don.is_nest_unlocked() then
		local hate_list = e.self:GetHateListClients()
		for entry in hate_list.entries do
			if entry.valid and entry.ent.valid and entry.ent:CastToClient():GetGM() then
				eq.debug(("GM %s was on hate list for kill, NOT unlocking Accursed Nest"):format(entry.ent:GetName()))
				had_gm = true
				break
			end
		end
	end
end

function event_death_complete(e)
		eq.get_entity_list():FindDoor(30):SetLockPick(0); -- unlock door upon success
		eq.get_entity_list():FindDoor(31):SetLockPick(0); -- unlock door upon success
		eq.spawn2(340031,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: a_chest

		-- first server kill unlocks the Accursed Nest zone
		if not had_gm and not don.is_nest_unlocked() then
			eq.debug("Unlocking the Accursed Nest")
			don.unlock_nest()
		end
end
