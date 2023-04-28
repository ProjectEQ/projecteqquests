
function event_spawn(e)
	eq.set_timer("anim", 3 * 1000) -- 3s to make npc lay down
	eq.set_timer("tether", 3 * 1000) -- 3s Check on tether
	eq.set_next_hp_event(70)
	
	-- mods enthralled destroyer/noc bloodluster

	e.self:ModSkillDmgTaken(0, 25); -- 1h blunt
	e.self:ModSkillDmgTaken(2, 25); -- 2h blunt
	e.self:ModSkillDmgTaken(1, -25); -- 1h slashing
	e.self:ModSkillDmgTaken(3, -25); -- 2h slashing
	e.self:ModSkillDmgTaken(7, -25); -- archery

end

function event_combat(e)
	if e.joined then
		eq.unique_spawn(292028,0,0,-867, 178, 60, 266); --#Aura_of_Destruction (292028)
	end
end

function event_timer(e)
	if e.timer == "tether" then
		if e.self:GetY() < -184 then
			e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
			e.self:GotoBind();
			e.self:WipeHateList();
		end	
	elseif e.timer == "anim" then
		e.self:SetAppearance(3); -- Dead
		eq.stop_timer("anim");
	end
end

function event_hp(e)
    if e.hp_event == 70 then
		eq.depop(292068); -- NPC: Vrex_Barxt_Qurat (Non-Aggro)
		eq.spawn2(292069,0,0,-869,-16,65,250); -- NPC: #Vrex_Barxt_Qurat
		eq.zone_emote(15,"Realizing that his avatar of destruction is fighting a losing battle, Barxt enters the fray. At the same time, you hear the shuffle of feet in the hallway leading to the entrance of the chamber and an ominous sound from behind the door indicates that it has been locked.  You have been sealed in and have no choice but to deal with this madman.  Barxt yells,  'You will die here this day whether it be by my hands or this massive construct. Trushar's will shall be done.  Your corpses shall rot here.  This chamber shall become your eternal grave!");
    end
end

function event_signal(e)
	if e.signal == 1 then
		local npc_list = eq.get_entity_list():GetNPCList();
		if npc_list ~= nil then
			-- loop through the list entries
			for npc in npc_list.entries do
				if npc:GetNPCTypeID() == 292074 or npc:GetNPCTypeID() == 292075 then
					-- for each destructive channeler, add 7500 hp
					if e.self:GetHPRatio() <= 99 then 
						e.self:SetHP( e.self:GetHP() + 7500 );
					end
				end
			end
		end
	elseif e.signal == 2 then -- go inactive 
		e.self:SetSpecialAbility(25, 1); --turn on immune to aggro
		e.self:SetSpecialAbility(24, 1); --turn on anti aggro
		e.self:SetSpecialAbility(35, 1); --turn on immunity
		e.self:SetOOCRegen(0);
		e.self:WipeHateList();
		e.self:SetAppearance(3); -- Dead
	elseif e.signal == 3 then -- awaken
		e.self:SetSpecialAbility(25, 0); --turn off immune to aggro
		e.self:SetSpecialAbility(24, 0); --turn off anti aggro
		e.self:SetSpecialAbility(35, 0); --turn off immunity
	end
end
