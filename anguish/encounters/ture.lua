--[[
Ture (317003)

5807
Stone Breath Targeted AE 200', Chromatic (-200) 
1: Stun(3.00 sec) 
2: Decrease Hitpoints by 500 
3: Cancel Magic(9) 

5806
Swamp Breath Targeted AE 200', Poison (-300) 
1: Decrease HP when cast by 200 
2: Decrease Hitpoints by 300 per tick 
3: Increase Poison Counter by 18 

5804
Thunder Breath Targeted AE 200', Magic (-250) 
1: Decrease Hitpoints by 1500 
2: Cancel Magic(9) 
3: Cancel Magic(9) 

1250
Wanton Destruction PB AE 300', Magic (-300) 
1: Decrease HP when cast by 4000 
2: Decrease Mana Pool by 1000 
3: Decrease Hitpoints by 500 per tick 
4: Increase Curse Counter by 36 
5: Decrease ATK by 500 
6: Decrease AC by 60 
7: Decrease Mana by 100 per tick

[21:19:56] Ture roars with fury as it surveys its attackers.
[21:20:01] Ture's eyes roll into its head as it goes into a frenzy.
[21:20:02] Ture goes on a WILD RAMPAGE!
[21:20:04] Ture goes on a WILD RAMPAGE!
[21:20:06] Ture goes on a WILD RAMPAGE!
[21:20:08] Ture goes on a WILD RAMPAGE!
[21:20:10] Ture goes on a WILD RAMPAGE!
[21:20:11] Ture calms and regains its focus.

[21:30:56] Ture roars with fury as it surveys its attackers.
[21:31:56] Ture roars with fury as it surveys its attackers.
[21:32:56] Ture roars with fury as it surveys its attackers.

--]]

--function Ture_Spawn(e)
  --eq.set_next_hp_event(90);
--end

function Ture_Combat(e)
  if (e.joined == true) then
    --e.self:Say("");
	eq.set_timer("wanton", math.random(30,60) * 1000);
	eq.set_timer("breath", math.random(10,30) * 1000);
	eq.set_timer("aeramp_warn", math.random(30,60) * 1000);	
  else
    --eq.set_timer("wipecheck", 1 * 1000);
	eq.stop_timer("wanton");
	eq.stop_timer("breath");
	eq.stop_timer("aeramp");
  end
end

function Ture_Timer(e)
	if (e.timer == "wanton") then
		e.self:CastSpell(1250, e.self:GetTarget():GetID());
		eq.stop_timer("wanton");
		eq.set_timer("wanton",75*1000); 
	elseif (e.timer == "breath") then
	--is breath target random or tank?
	--local client = eq.get_entity_list():GetRandomClient(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 300);
    --if (client:IsClient() == false) then
		e.self:CastSpell(eq.ChooseRandom(5804,5806,5807), e.self:GetTarget():GetID());
		eq.set_timer("breath",30*1000);
	elseif (e.timer == "aeramp_warn") then
		e.self:Emote(" roars with fury as it surveys its attackers.");
		eq.set_timer("aeramp_warn",60*1000);
		eq.set_timer("aeramp_on",5*1000);
	elseif (e.timer == "aeramp_on") then
		eq.stop_timer("aeramp_on");
		e.self:Emote("'s eyes roll into its head as it goes into a frenzy.");
		e.self:ModifyNPCStat("attack_delay", "18"); 
		e.self:SetSpecialAbility(SpecialAbility.flurry, 0);
		e.self:SetSpecialAbility(SpecialAbility.rampage, 0);	
	    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
		e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 0, 100);
		eq.set_timer("aeramp_off",11*1000);
	elseif (e.timer == "aeramp_off") then
		eq.stop_timer("aeramp_off");
		e.self:Emote(" calms and regains its focus.");
		e.self:ModifyNPCStat("attack_delay", "14");	
		e.self:SetSpecialAbility(SpecialAbility.area_rampage, 0);
		e.self:SetSpecialAbility(SpecialAbility.flurry, 1);
		e.self:SetSpecialAbility(SpecialAbility.rampage, 1);	
	end
  --if (e.timer == "wipecheck") then
  --  local client = eq.get_entity_list():GetRandomClient(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 8000);
  --  if (client:IsClient() == false) then
      -- Wipe Mechanics
  --    eq.spawn2(298023, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
  --    eq.depop();
  --  end
  --end
  
  --
end

function event_encounter_load(e)
--  eq.register_npc_event('ture', Event.spawn,          317003, Ture_Spawn); 
  eq.register_npc_event('ture', Event.combat,         317003, Ture_Combat); 
  eq.register_npc_event('ture', Event.timer,          317003, Ture_Timer);
  eq.register_npc_event('ture', Event.death_complete, 317003, Ture_Death); 
end

function event_encounter_unload(e)
end