-- Juggernaut Death
-- items: 17833, 17898, 17399, 18976
function Juggernaut_Death(e)
  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(89193) then
     local clist = eq.get_entity_list():GetClientList();
     if ( clist ~= nil ) then
		 for currclient in clist.entries do
			if(currclient:GetClass() == Class.BERSERKER) then
				local qglobals = eq.get_qglobals(currclient);
				if(qglobals["berserk_epic"] == "3" and qglobals["berserker_seb"] == nil) then
					eq.spawn2(89194, 0, 0, -225.93, -1556.52, -173.84, 320); -- needs_heading_validation
					eq.spawn2(89195, 0, 0, -214, -1572, -173.84, 110); -- NPC: A_Sebilite_Guardian
					eq.spawn2(89195, 0, 0, -214, -1538, -173.84, 152); -- NPC: A_Sebilite_Guardian
					eq.set_global("berserker_seb","1",3,"H2");
					return; --only spawn 1
				end
			end
		 end
	 end
  end
end

function Protector_Spawn(e)
	eq.set_timer("depop", 30*60*1000); --30min
	eq.set_next_hp_event(75);
end

function Guardian_Spawn(e)
	eq.set_timer("depop", 30*60*1000); --30min
end

function Protector_Timer(e)
	if(e.timer=="depop") then
		eq.stop_timer("depop");
		eq.depop_all(89194); --protector
		eq.depop_all(89195); --guardian
	elseif(e.timer=="nuke") then
		e.self:CastSpell(2047, e.self:GetTarget():GetID()); -- Spell: Death Shackles
	elseif(e.timer=="checkaxe") then
			e.self:ForeachHateList(
				function(ent, hate, damage, frenzy)
					if(ent:IsClient()) then
						if(ent:CastToMob():GetClass() == Class.BERSERKER and damage > 0) then --berserker
							local currclient=ent:CastToClient();
							if(math.random(3)==1) then 
								if(currclient:GetItemIDAt(Slot.Primary)==16779) then
									eq.target_global("berserk_epic_test17759", "1", "F", 0,currclient:CharacterID(),0);
									currclient:Message(MT.Yellow,"After several heavy swings, the axe shatters into many fine pieces. Time for a new axe!");
									currclient:DeleteItemInInventory(Slot.Primary, 1, true);
									currclient:SummonItem(17833); -- Item: Broken Trial Taelosian Blood Axe
								elseif(currclient:GetItemIDAt(Slot.Primary)== 17759 ) then
									eq.target_global("berserk_epic_test17370", "1", "F", 0,currclient:CharacterID(),0);
									currclient:Message(MT.Yellow,"After raining down nearly two dozen blows you begin to notice small hairline fractures developing in the axe head. You think testing for this axe has been completed.");
									currclient:DeleteItemInInventory(Slot.Primary, 1, true);
									currclient:SummonItem(17898); -- Item: Damaged Trial Taelosian Blood Axe
								elseif(currclient:GetItemIDAt(Slot.Primary)==17700) then
									eq.target_global("berserk_epic_test17700", "1", "F", 0,currclient:CharacterID(),0);
									currclient:Message(MT.Yellow,"After many swings you can feel this axe is failing and think that it will fall apart at any moment. You think that testing for this axe has been completed.");
									currclient:DeleteItemInInventory(Slot.Primary, 1, true);
									currclient:SummonItem(17399); -- Item: Damaged Trial Taelosian Blood Axe
								elseif(currclient:GetItemIDAt(Slot.Primary)== 17370) then
									eq.target_global("berserk_epic_test16779", "1", "F", 0,currclient:CharacterID(),0);
									currclient:Message(MT.Yellow,"The rigors of battle have had no effect of this axe. Keras should be very pleased with the result of this particular axe.");
									currclient:DeleteItemInInventory(Slot.Primary, 1, true);
									currclient:SummonItem(18976); -- Item: Taelosian Alloy Blood Axe
								end
							end
						end
					end				
				end
			);
	end
end

function Protector_HP(e)
  if (e.hp_event == 75) then
	e.self:CastSpell(2047, e.self:GetTarget():GetID()); -- Spell: Death Shackles
	eq.set_timer("nuke", 36*1000);
	eq.signal(89195,75); -- NPC: A_Sebilite_Guardian
  end 
end

function Guardian_Signal(e)
	if(e.signal==75) then
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(25, 0);		
		local npc = eq.get_entity_list():GetMobByNpcTypeID(89194);
		if (npc.valid) then
			e.self:AddToHateList(npc:CastToMob():GetHateTop(),1);
		end
		e.self:CastSpell(4123, e.self:GetHateRandom():GetID()); --Blurring Focus
		eq.set_timer("blurringfocus",48*1000);
		e.self:CastSpell(6100, e.self:GetHateRandom():GetID()); --Curse of the Protector 		
		eq.set_timer("curseofprot",45*1000);		
		eq.set_timer("ch",math.random(2)*1000+10*1000); --Complete Heal Protector
	elseif(e.signal==1) then
		e.self:SetSpecialAbility(35, 0);
		e.self:SetSpecialAbility(39, 0);
	end
end

function Guardian_Timer(e)
	if(e.timer=="blurringfocus") then
		e.self:CastSpell(4123, e.self:GetHateRandom():GetID()); --Blurring Focus		
	elseif (e.timer=="curseofprot") then
		e.self:CastSpell(6100, e.self:GetHateRandom():GetID()); --Curse of the Protector 		
	elseif (e.timer=="ch") then
		local npc = eq.get_entity_list():GetMobByNpcTypeID(89194);	
		if (npc.valid) then
			e.self:CastSpell(13, npc:GetID(),1,10000); --Complete Heal
		end			
	end
end

function Protector_Combat(e)
  if e.joined then
	eq.set_timer("checkaxe",6000);
  end  
end

function Protector_Death(e)
	e.self:ForeachHateList(
		function(ent, hate, damage, frenzy)
			if(ent:IsClient()) then
				if(ent:CastToMob():GetClass() == Class.BERSERKER and damage > 0) then --berserker
					local currclient=ent:CastToClient();
					if(currclient:HasItem(17833) and currclient:HasItem(17898) and currclient:HasItem(17399) and currclient:HasItem(18976)) then
						currclient:Message(MT.Red,"Stepping back for a moment, you look over the axes that you have crafted. Two of them seem to be no more durable than any other axe you've seen, another is completely broken, yet the fourth catches your eye. The blade has nary a nick anywhere on it, the handle seemingly able to withstand immense amounts of punishment.");
						eq.target_global("berserk_epic", "4", "F", 0,currclient:CharacterID(),0);
						local qglobals = eq.get_qglobals(currclient);
						if(qglobals["berserk_epic_sebchest"] == nil or qglobals["berserk_epic_sebchest"] =="0") then	
							--eq.world_emote(15,"in global if ");
							eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
							eq.target_global("berserk_epic_sebchest", "1", "F", 0,currclient:CharacterID(),0);
						end								
					end
				end
			end				
		end
	);
	eq.signal(89195,1); -- NPC: A_Sebilite_Guardian
end


function event_encounter_load(e)
  eq.register_npc_event('berserkerepic_1_5', Event.death_complete, 89193, Juggernaut_Death);
  eq.register_npc_event('berserkerepic_1_5', Event.timer,          89194, Protector_Timer);
  eq.register_npc_event('berserkerepic_1_5', Event.spawn,          89194, Protector_Spawn);
  eq.register_npc_event('berserkerepic_1_5', Event.spawn,          89195, Guardian_Spawn);  
  eq.register_npc_event('berserkerepic_1_5', Event.combat,         89194, Protector_Combat);
  eq.register_npc_event('berserkerepic_1_5', Event.hp,         	   89194, Protector_HP);  
  eq.register_npc_event('berserkerepic_1_5', Event.death, 		   89194, Protector_Death);
  eq.register_npc_event('berserkerepic_1_5', Event.timer,		   89195, Guardian_Timer);
  eq.register_npc_event('berserkerepic_1_5', Event.signal,	   	   89195, Guardian_Signal); 
  eq.register_npc_event('berserkerepic_1_5', Event.timer,          89195, Guardian_Timer);
end
