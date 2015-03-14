-- Pixtt Xxeric Kex - First Encounter in Tacvi
-- Pixtt_Xxeric_Kex (298039)

-- 100 to 50% hits max 5700, flurry, procs "Trample" see's invis but not SoS


local door = 0;
local entity_list = eq.get_entity_list();

function event_spawn(e)
	eq.set_next_hp_event(98);
end

---
-- @param NPC#event_combat e
function event_combat(e)
	if (e.joined == false) then
		-- Wipe mechanics
		-- Depop adds and their controller, repop myself
		eq.depop_all(298044);
		eq.depop_all(298043);
		eq.depop_all(298042);
		eq.depop_all(298041);
		eq.depop_all(298222);
		eq.spawn2(298039,0,0,151,-162,-6,192.5);
		eq.depop();
		
	end
end

---
-- @param NPC#event_combat e
function event_hp(e)
	--98pct 
	if (e.hp_event == 98) then
		--locks door leading into her chamber
		door = entity_list:FindDoor(2);
		if (door ~= nil) then door:SetLockPick(-1); end
		e.self:Emote("begins to froth at the mouth as her skin becomes more rigid and her rage begins to grow. You feel a force from behind you as the door is once again sealed.");
		eq.set_next_hp_event(90);
	end
	
	--90pct unroot, increase runspeed
	if (e.hp_event == 90) then
		--check this syntax
		
		--eq.modify_npc_stat("runspeed", "1.5");
		--eq.modify_npc_stat("runspeed",2);
		e.self:ModifyNPCStat("runspeed","2");
		eq.set_next_hp_event(50);
	end
	
	-- At 50% you see
	if (e.hp_event == 50) then
		eq.zone_emote(15,"Raising her head to the sky, Xxeric lets out a battle cry that shakes the walls and calls forth a pack of raging ukun hounds. 'Prepare yourself for the afterlife this is the reality of the Mata Muram army.'");
		
		-- she begins casting Spirit Cleaver & Wave of Rage
		-- void AddAISpell(int priority, int spell_id, int type, int mana_cost, int recast_delay, int resist_adjust);
		e.self:AddAISpell(0, 4729, 1, -1, -1, -350);
		e.self:AddAISpell(0, 4728, 1, -1, -1, -350);
		-- Begins to AE Ramp (r or 4)
		--eq.modify_npc_stat("special_attacks", "1,2,4,5,12,13,14,15,16,17,21");
		eq.modify_npc_stat("special_attacks", "SErFUMCNIDf");
		-- PXK_Pets controller to make adds spawn 3 times each
		eq.spawn2(298222,0,0,200,-175,-5,0);
		eq.set_next_hp_event(30);
	end
			
	--Below 30%
	if (e.hp_event == 30) then
		--At 30%, she gains some strength:
		--Emotes at 30% and DPS picks up.
		eq.modify_npc_stat("min_hit", 2500);
		e.self:Say("I commend you on your tenacity, infidels. However I am through playing games. Witness the true fighting power of an Ixt Berserker.");
		eq.set_next_hp_event(10);
	end
	
	--10%
	if (e.hp_event == 10) then
	--When she hits 10%, she will regenerate to 40% health and strip her debuffs
		-- Balance of the nameless, strip self debuffs
		e.self:CastSpell(3230,e.self:GetID());
		e.self:SetHP(e.self:GetMaxHP()*0.40);
		eq.modify_npc_stat("min_hit", 1500);
		eq.modify_npc_stat("special_attacks", "1,2,5,12,13,14,15,16,17,21");
		e.self:Say("You may yet have the strength to defeat me but I am not through with you yet.");
		e.self:Emote("'s eyes turn blood red as she enters an uncontrollable rage. Focusing on her wounds, she begins to recover some health.");
	end
end
	
function event_death_complete(e)
	-- re-open door leading into her chamber
	door = entity_list:FindDoor(2);
	if (door ~= nil) then door:SetLockPick(0); end
	
	-- open doors leading out of her chamber
	door = entity_list:FindDoor(3);
	if (door ~= nil) then door:SetLockPick(0); end
	door = entity_list:FindDoor(4);
	if (door ~= nil) then door:SetLockPick(0); end
	
	eq.zone_emote(15, "Swinging her weapon one last time, the massive entity falls to her side with a thud. While she was a creature consumed with destruction, her death is still graceful. As her bloodstained braids come to a rest on the floor and her muscles relax, you can't help but wonder what could make such a magnificent creature so deadly.");
	--Loot from this event includes 3 items from this loot table
end