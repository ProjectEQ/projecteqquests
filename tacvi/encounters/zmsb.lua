function ZMSB_Spawn(e)
	eq.set_next_hp_event(90);
end

function ZMSB_Combat(e)
	if e.joined then
		e.self:Say("Come you fools! Show me your strongest warrior and I will show you my first victim.");
		eq.set_timer("rage", 35 * 1000);
		eq.stop_timer("reset");
		if e.self:GetHPRatio() < 90 then
			eq.set_timer("check", 1 * 1000); -- set scorpion timer during wipe recovery if someone aggro's
		end
	else
		-- Wipe Mechanics
		eq.stop_timer("check");
		eq.stop_timer("rage");
		eq.stop_timer("rage_stop");
		eq.set_timer("reset", 30 * 1000);
	end
end

function ZMSB_Timer(e)
	if e.timer == "rage_stop" then
		eq.stop_timer("rage_stop");
		eq.set_timer("rage", 35 * 1000);
		eq.zone_emote(MT.Yellow,"Zun`Muram Shaldn Boc looks weakened as the rage ends.");
		e.self:ModifyNPCStat("min_hit", "1470");
		e.self:ModifyNPCStat("max_hit", "4700");
 		--attack delay to 1.9s
		e.self:ModifyNPCStat("attack_delay","19");
	elseif e.timer == "rage" then
		eq.stop_timer("rage");
		eq.zone_emote(MT.Yellow,"Zun`Muram Shaldn Boc starts to foam at the mouth as he enters a blind rage.");
		if e.self:GetHPRatio() >= 90 then
			e.self:ModifyNPCStat("min_hit", "1520");
			e.self:ModifyNPCStat("max_hit", "4850");
			e.self:ModifyNPCStat("attack_delay","16");
			eq.set_timer("rage_stop", 20 * 1000);
		elseif e.self:GetHPRatio() < 90 and e.self:GetHPRatio() >= 80 then
			e.self:ModifyNPCStat("min_hit", "1558");
			e.self:ModifyNPCStat("max_hit", "4978");
			e.self:ModifyNPCStat("attack_delay","15");
			eq.set_timer("rage_stop", 20 * 1000);
		elseif e.self:GetHPRatio() < 80 and e.self:GetHPRatio() >= 70 then
			e.self:ModifyNPCStat("min_hit", "1612");
			e.self:ModifyNPCStat("max_hit", "5127");
			e.self:ModifyNPCStat("attack_delay","14");
			eq.set_timer("rage_stop", 35 * 1000);
		elseif e.self:GetHPRatio() < 70 and e.self:GetHPRatio() >= 60 then
			e.self:ModifyNPCStat("min_hit", "1666");
			e.self:ModifyNPCStat("max_hit", "5276");
			e.self:ModifyNPCStat("attack_delay","13");
			eq.set_timer("rage_stop", 35 * 1000);
		elseif e.self:GetHPRatio() < 60 and e.self:GetHPRatio() >= 50 then
			e.self:ModifyNPCStat("min_hit", "1721");
			e.self:ModifyNPCStat("max_hit", "5426");
			e.self:ModifyNPCStat("attack_delay","12");
			eq.set_timer("rage_stop", 35 * 1000);
		elseif e.self:GetHPRatio() < 50 and e.self:GetHPRatio() >= 40 then
			e.self:ModifyNPCStat("min_hit", "1775");
			e.self:ModifyNPCStat("max_hit", "5575");
			e.self:ModifyNPCStat("attack_delay","12");
			eq.set_timer("rage_stop", 50 * 1000);
		elseif e.self:GetHPRatio() < 40 and e.self:GetHPRatio() >= 30 then
			e.self:ModifyNPCStat("min_hit", "1829");
			e.self:ModifyNPCStat("max_hit", "5724");
			e.self:ModifyNPCStat("attack_delay","11");
			eq.set_timer("rage_stop", 50 * 1000);
		elseif e.self:GetHPRatio() < 30 and e.self:GetHPRatio() >= 20 then
			e.self:ModifyNPCStat("min_hit", "1883");
			e.self:ModifyNPCStat("max_hit", "5873");
			e.self:ModifyNPCStat("attack_delay","10");
			eq.set_timer("rage_stop", 65 * 1000);
		elseif e.self:GetHPRatio() < 20 and e.self:GetHPRatio() >= 10 then
			e.self:ModifyNPCStat("min_hit", "1938");
			e.self:ModifyNPCStat("max_hit", "6023");
			e.self:ModifyNPCStat("attack_delay","9");
			eq.set_timer("rage_stop", 65 * 1000);
		elseif e.self:GetHPRatio() < 10 then
			e.self:ModifyNPCStat("min_hit", "1992");
			e.self:ModifyNPCStat("max_hit", "6172");
			e.self:ModifyNPCStat("attack_delay","8");
			eq.set_timer("rage_stop", 65 * 1000);
		end
	elseif e.timer == "check" then
		local instance_id = eq.get_zone_instance_id();
		e.self:ForeachHateList(
			function(ent, hate, damage, frenzy)
				if(ent:IsClient() and ent:GetX() < 293 or ent:GetX() > 448 or ent:GetY() < 270) then
					local currclient=ent:CastToClient();
					--e.self:Shout("You will not evade me " .. currclient:GetName())
					currclient:MovePCInstance(298,instance_id, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- Zone: tacvi
					currclient:Message(MT.Magenta,"Zun`Muram Shaldn Boc says, 'You cannot run from your fate, you must accept it.");
				end
			end
		);
	elseif e.timer == "reset" then
		eq.stop_timer("reset");
		e.self:SetHP(e.self:GetMaxHP());
		eq.set_next_hp_event(90);
		e.self:ModifyNPCStat("min_hit", "1470");
		e.self:ModifyNPCStat("max_hit", "4700");
		e.self:ModifyNPCStat("attack_delay","19");
		eq.signal(298223,2); -- Unlock Doors
	end
end

function ZMSB_Hp(e)
	if e.hp_event == 90 then
		eq.signal(298223,1); -- Lock Doors
		-- he should start checking for players on hate list outside room here
		eq.set_timer("check", 1 * 1000);
	end
end

function ZMSB_Death(e)
	eq.signal(298223, 298018); -- NPC: zone_status
	eq.signal(298223,2,1000); -- Unlock Doors
	--should there be a check here to see if zmmd door is already open for this emote?
	eq.zone_emote(MT.Yellow,"The chamber is filled with the sound of grinding stone. The path leading into the final chamber has been opened and it awaits your arrival. You hear a voice that sounds oddly familiar. 'Come now, fools, enter my chamber and learn the meaning of suffering from one bred to destroy and conquer. You have beaten the best of my army, but you have yet to see true power. Step into the abyss and cower at what stares back at you.");
end

function event_encounter_load(e)
	eq.register_npc_event('zmsb', Event.spawn,          298018, ZMSB_Spawn);
	eq.register_npc_event('zmsb', Event.combat,         298018, ZMSB_Combat);
	eq.register_npc_event('zmsb', Event.timer,          298018, ZMSB_Timer);
	eq.register_npc_event('zmsb', Event.hp,             298018, ZMSB_Hp);
	eq.register_npc_event('zmsb', Event.death_complete, 298018, ZMSB_Death);
end
