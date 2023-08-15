local deadtrash = 0;
local mitflag=1;

function Trash_Death(e) 
  deadtrash = deadtrash+1;
  if(deadtrash ==20) then
	eq.spawn2(186190,0,0,-460,-1597,70.2,0); -- NPC: a_Teir`Dal_guardian
  end
end

function Lanys_Say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["Fatestealer"] == "1") then
		if(e.message:findi("hail")) then
			e.self:TempName();
			e.other:Message(MT.Yellow,"The Teir`dal looks away, pretending not to notice you. However, beneath her facade of indifference you sense that she is suppressing unbridled anger. Perhaps you could taunt her into attacking by saying the right things... ");
		elseif(e.message:findi("Tunare")) then
			e.self:TempName("an_embodiment_of_hatred");
			e.self:Emote("glares at you angrily, Keep using your tongue like that and I will do you the pleasure of removing it.");
		elseif(e.message:findi("Firiona")) then
			e.self:TempName("a_child_of_hatred");
			e.self:Say("WHAT did you say!? You dare bring up the name of that tart in my presence?");
		elseif(e.message:findi("Kithicor")) then
			e.self:TempName("The_Child_of_Hate");
			e.self:Say("Never speak those words again.");		
		elseif(e.message:findi("Laarthik")) then
			e.self:TempName("Lanys_T`Vyl");
			e.self:SetLevel(73);
			e.self:Say("Innoruuk forgive me! I refuse to suffer these fool's arrogance any longer!");
			e.self:Say("The finest Teir`dal male that has ever existed. You sully his name by even thinking it.");
			e.self:SetSpecialAbility(19, 0);
			e.self:SetSpecialAbility(20, 0);			
			e.self:SetSpecialAbility(24, 0);
			e.self:SetSpecialAbility(25, 0);
			e.self:AddToHateList(e.other, 1);			
			eq.set_timer("pain",6*1000);
			eq.set_timer("power",14*1000);
			eq.set_timer("mit",20*1000);
		elseif(e.message:findi("Stanos")) then				
			eq.depop();
		end
	end
end

function Lanys_Timer(e)
	if(e.timer=="pain") then
		eq.stop_timer("pain");
		eq.set_timer("pain",35*1000);
		e.self:CastSpell(6489, e.self:GetHateTop():GetID()); --Pulse of Pain 35sec
	elseif (e.timer=="power") then
		eq.stop_timer("power");
		eq.set_timer("power",35*1000);	
		e.self:CastSpell(808, e.self:GetHateRandom():GetID()); --Avatar Power 35sec	
	elseif (e.timer=="mit") then
		if(mitflag==1) then
			e.self:Emote("falters. Her blinding offense ceases momentarily as she pauses to catch her breath.");
			e.self:ModSkillDmgTaken(14, 0); -- Conjuration
			e.self:ModSkillDmgTaken(24, 0); -- Evocation
			e.self:ModSkillDmgTaken(5, 0);  -- Alteration
			e.self:ModSkillDmgTaken(18,0); -- Divination
			e.self:ModSkillDmgTaken(0, -90); -- 1h blunt
			e.self:ModSkillDmgTaken(2, -90); -- 2h blunt
			e.self:ModSkillDmgTaken(28,-90); -- h2h
			e.self:ModSkillDmgTaken(36,-90); -- piercing
			e.self:ModSkillDmgTaken(1, -90); -- 1h slashing
			e.self:ModSkillDmgTaken(3, -90); -- 2h slashing
			mitflag=2;			
		else
			e.self:Emote("regains her strength. She unleashes a devastating barrage of swings that makes it difficult for you to counterattack.");
			e.self:ModSkillDmgTaken(14, -90); -- Conjuration
			e.self:ModSkillDmgTaken(24, -90); -- Evocation
			e.self:ModSkillDmgTaken(5, -90);  -- Alteration
			e.self:ModSkillDmgTaken(18,-90); -- Divination
			e.self:ModSkillDmgTaken(0, 0); -- 1h blunt
			e.self:ModSkillDmgTaken(2, 0); -- 2h blunt
			e.self:ModSkillDmgTaken(28,0); -- h2h
			e.self:ModSkillDmgTaken(36,0); -- piercing
			e.self:ModSkillDmgTaken(1, 0); -- 1h slashing
			e.self:ModSkillDmgTaken(3, 0); -- 2h slashing
			mitflag=1;
		end				
	end
end


function event_encounter_load(e)
  eq.register_npc_event('rogue_1_5', Event.death_complete, 186114, Trash_Death);
  eq.register_npc_event('rogue_1_5', Event.death_complete, 186100, Trash_Death);
  eq.register_npc_event('rogue_1_5', Event.death_complete, 186112, Trash_Death);
  eq.register_npc_event('rogue_1_5', Event.death_complete, 186116, Trash_Death);
  eq.register_npc_event('rogue_1_5', Event.death_complete, 186098, Trash_Death);
  eq.register_npc_event('rogue_1_5', Event.death_complete, 186115, Trash_Death);
  eq.register_npc_event('rogue_1_5', Event.timer,          186190, Lanys_Timer);
  eq.register_npc_event('rogue_1_5', Event.say,	   	   	   186190, Lanys_Say); 
end