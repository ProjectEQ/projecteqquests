--Ikkinz Raid #2: Chambers of Glorification
--2nd guardian of glorification in the final sequence
local reduce_regen = 0;
local reduce_dmg = 0;
local reduce_hp = 0;

function event_spawn(e)
	eq.set_next_hp_event(90);
	reduce_regen = 0;
	reduce_dmg = 0;
	reduce_hp = 0;
end

function event_hp(e)
	if(e.hp_event == 90) then
		eq.signal(294474,1); --Glorified_Bolsterer remove immunity
		eq.signal(294475,1); --Glorified_Bolsterer remove immunity
		eq.signal(294478,1); --Glorified_Bolsterer remove immunity
		eq.set_next_hp_event(50);
	elseif(e.hp_event == 50) then
		eq.zone_emote(0, "Guardian of Glorification splits into two smaller stone workers!");
		eq.spawn2(294583,0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: ##Guardian_of_Glorification
		eq.spawn2(294583,0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: ##Guardian_of_Glorification
		eq.depop();
	end
end
				
function event_signal(e)
	if (e.signal == 1) then
 		if (reduce_regen == 0) then
			reduce_regen = reduce_regen + 1;
			e.self:ModifyNPCStat("hp_regen", "1000");
		elseif (reduce_regen == 1) then
			reduce_regen = reduce_regen + 1;
			e.self:ModifyNPCStat("hp_regen", "1");
		end
	elseif (e.signal == 2) then
		eq.modify_npc_stat("max_hp", tostring(e.self:GetMaxHP() - 70000)); --reduce max hp by 70k per signal (2 total)
	elseif (e.signal == 3) then
		 if (reduce_dmg == 0) then
			reduce_dmg = reduce_dmg + 1;
			e.self:ModifyNPCStat("max_hit", "2912");
  			e.self:ModifyNPCStat("min_hit", "1126");
		elseif (reduce_dmg == 1) then
			reduce_dmg = reduce_dmg + 1;
			e.self:ModifyNPCStat("max_hit", "2538");
   			e.self:ModifyNPCStat("min_hit", "980");
		end
	end
end

function event_combat(e)
	if(e.joined) then
		eq.set_timer("random", 5 * 1000);
	else
		eq.stop_timer("random");
	end
end

function event_timer(e)
	if (e.timer == "random") then
		local rand = math.random(1,100);
		if (rand >= 85) then -- 15 % to cast throw
		local instance_id = eq.get_zone_instance_id();
		e.self:ForeachHateList(
		  function(ent, hate, damage, frenzy)
			if(ent:IsClient() and ent:GetX() < 868) then
			  local currclient=ent:CastToClient();
				e.self:Shout("You will not evade me " .. currclient:GetName())
				currclient:MovePCInstance(294,instance_id, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- Zone: ikkinz
			end
		  end
		);
		e.self:Emote("tosses its foes away wildly!");
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom());	-- Spell: Throw
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom());	-- Spell: Throw
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom());	-- Spell: Throw
		elseif (rand < 85) and (rand >= 70) then -- 15 % to cast manabolt
			e.self:Emote("lets loose a bolt of energy toward his enemy!");
				e.self:CastedSpellFinished(1046, e.self:GetHateRandom());	-- Spell: Manabolt
		elseif (rand < 70) and (rand >= 55) then -- 15 % to cast Fling
			local npc1 = eq.get_entity_list():GetMobByNpcTypeID(294466);
			local npc2 = eq.get_entity_list():GetMobByNpcTypeID(294469);

				if (npc1.valid and npc2.valid) then

					if ( npc1:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) < npc2:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ())) then
						eq.signal(294466,1);
					
					else
						eq.signal(294469,1);
					
					end
				end
		end
	end
end
