local started = false;
local completed = false
local count = 0;

function event_spawn(e)
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self); 
	local x,y = e.self:GetX(), e.self:GetY();
	started = false;
	completed = qglobals[instance_id.. '_gaschmb1complete'] ~= nil
	count = 0;
	eq.set_proximity(x - 20, x + 20, y - 20, y + 20);
end

function event_timer(e)
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self);
	local emote_pc_1 = eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),300*300); -- Real Emote
	local emote_pc_2 = eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),300*300); -- Fake Emote
	local rand_emote = math.random(1,4); 

	if e.timer == "gaschamber" then
		started = true;

		eq.zone_emote(MT.White,"From somewhere behind the walls there is a deep rumbling.");

		if rand_emote == 1 then
			if emote_pc_1.valid then
				emote_pc_1:Message(MT.Yellow,"Out of the corner of your eye you perceive movement. Within the recession on the door a mechanical lock rotated counter-clockwise. It was visible for only a fraction of a second, but that was long enough to make an educated guess to which key it now accepts.")
				emote_pc_1:Message(MT.Yellow,"The Cracked Key must unlock the door to the next room.")
			end
			if emote_pc_2.valid then
				emote_pc_2:Message(MT.Yellow,"Amidst the ambient noise of grinding stone, your sharp hearing picks up the sound of several gears rotating into place. The pattern of repetitive clicks suddenly makes sense.")
				emote_pc_2:Message(MT.Yellow,"It must be either the Cracked Key or Dusty Key that unlocks the door to the next room.")
			end
			eq.set_global(instance_id.."_gaschmb1","67707",3,"M5");
		elseif rand_emote == 2 then
			if emote_pc_1.valid then
				emote_pc_1:Message(MT.Yellow,"Out of the corner of your eye you perceive movement. Within the recession on the door a mechanical lock rotated counter-clockwise. It was visible for only a fraction of a second, but that was long enough to make an educated guess to which key it now accepts.")
				emote_pc_1:Message(MT.Yellow,"The Dusty Key must unlock the door to the next room.")
			end
			if emote_pc_2.valid then
				emote_pc_2:Message(MT.Yellow,"Amidst the ambient noise of grinding stone, your sharp hearing picks up the sound of several gears rotating into place. The pattern of repetitive clicks suddenly makes sense.")
				emote_pc_2:Message(MT.Yellow,"It must be either the Polished Key or Dusty Key that unlocks the door to the next room.")
			end
			eq.set_global(instance_id.."_gaschmb1","67708",3,"M5");
		elseif rand_emote == 3 then
			if emote_pc_1.valid then
				emote_pc_1:Message(MT.Yellow,"Out of the corner of your eye you perceive movement. Within the recession on the door a mechanical lock rotated counter-clockwise. It was visible for only a fraction of a second, but that was long enough to make an educated guess to which key it now accepts.")
				emote_pc_1:Message(MT.Yellow,"The Polished Key must unlock the door to the next room.")
			end
			if emote_pc_2.valid then
				emote_pc_2:Message(MT.Yellow,"Amidst the ambient noise of grinding stone, your sharp hearing picks up the sound of several gears rotating into place. The pattern of repetitive clicks suddenly makes sense.")
				emote_pc_2:Message(MT.Yellow,"It must be either the Cracked Key or Jagged Key that unlocks the door to the next room.")
			end
			eq.set_global(instance_id.."_gaschmb1","67709",3,"M5");
		elseif rand_emote == 4 then
			if emote_pc_1.valid then
				emote_pc_1:Message(MT.Yellow,"Out of the corner of your eye you perceive movement. Within the recession on the door a mechanical lock rotated counter-clockwise. It was visible for only a fraction of a second, but that was long enough to make an educated guess to which key it now accepts.")
				emote_pc_1:Message(MT.Yellow,"The Jagged Key must unlock the door to the next room.")
			end
			if emote_pc_2.valid then
				emote_pc_2:Message(MT.Yellow,"Amidst the ambient noise of grinding stone, your sharp hearing picks up the sound of several gears rotating into place. The pattern of repetitive clicks suddenly makes sense.")
				emote_pc_2:Message(MT.Yellow,"It must be either the Cracked Key or Polished Key that unlocks the door to the next room.")
			end
			eq.set_global(instance_id.."_gaschmb1","67710",3,"M5");
		end
		if count == 99 then -- Wipe
			eq.signal(292051,1); -- Gas Chamber 1
			eq.signal(292051,1); -- Gas Chamber 1
			eq.signal(292051,1); -- Gas Chamber 1
			eq.signal(292051,1); -- Gas Chamber 1
			eq.signal(292051,1); -- Gas Chamber 1
			eq.set_timer("restart", 1 * 60 * 1000); -- 1 Minute to Reset
			eq.stop_timer("gaschamber");
		else 
			count = count + 1;
		end
	elseif e.timer == "restart" then
		eq.zone_emote(MT.Yellow,"You hear a series of clicks that indicate the intricate trap has reset.");
		started = false;
		count = 0;
		eq.stop_timer("restart");
	end
end

function event_enter(e)
	if completed then
		eq.get_entity_list():FindDoor(9):SetLockPick(0);
		eq.get_entity_list():FindDoor(9):ForceOpen(e.self);
		eq.signal(292080,1); -- #Gas_Chamber_Cheater
	elseif not started then
		eq.set_timer("gaschamber", 20 * 1000); -- 20 Seconds
	end		
end

function event_signal(e)
	if e.signal == 1 then
		eq.spawn2(292084,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); --a_jet_flame (292084)
		eq.set_timer("restart", 1 * 60 * 1000); -- 1 Minute to Reset
		eq.stop_timer("gaschamber");
	elseif e.signal == 2 then
		completed = true;
		eq.stop_timer("gaschamber");
		eq.spawn2(292010,0,0,-288,-940,-24,130); -- NPC: a_trusik_ritualist
		eq.spawn2(292007,0,0,-264,-940,-24,386); -- NPC: a_trusik_stalker
	end
end
