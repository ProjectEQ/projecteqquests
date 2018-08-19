--[[
## Elite Dragorn Jekisia -- Written by Drogerin ##

Level 70

root
95 two adds
unroot
run
root

a dragon flunky level 60 (x2)

80

run
two adds
root

70

run
two adds
root

50

run
two adds
root


30
run
two adds
root

20
run
two adds
root


5
run
two adds
root


//Summons after re-root.

--]]

local Agro=0;


function Jek_Combat(e)
	if (e.joined == true) and Agro == 0 then
	eq.set_next_hp_event(95);
	eq.set_timer("Reset",1200000) -- Reset myself after 20 minutes of event starting.
	end
end

function Jek_Spawn(e)
	e.self:SetPseudoRoot(true);
	Agro=0;
end

function Jek_Timer(e)
	if e.timer == "Agro_One" then
		eq.stop_timer('Agro_One');
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
		e.self:SetPseudoRoot(true);
		e.self:AddToHateList(e.self:GetTarget(),1);
	elseif e.timer == "Agro_Two" then
		eq.stop_timer('Agro_Two');
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
		e.self:SetPseudoRoot(true);
		e.self:AddToHateList(e.self:GetTarget(),1);
	elseif e.timer == "Agro_Three" then
		eq.stop_timer('Agro_Three');
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
		e.self:SetPseudoRoot(true);
		e.self:AddToHateList(e.self:GetTarget(),1);
	elseif e.timer == "Agro_Four" then
		eq.stop_timer('Agro_Four');
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
		e.self:SetOOCRegen(1);
		e.self:AddToHateList(e.self:GetTarget(),1);
	elseif e.timer == "Agro_Five" then
		eq.stop_timer('Agro_Five');
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
		e.self:SetPseudoRoot(true);
		e.self:AddToHateList(e.self:GetTarget(),1);
	elseif e.timer == "Agro_Six" then
		eq.stop_timer('Agro_Six');
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
		e.self:SetPseudoRoot(true);
		e.self:AddToHateList(e.self:GetTarget(),1);
	elseif e.timer == "Agro_Seven" then
		eq.stop_timer('Agro_Seven');
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
		e.self:SetPseudoRoot(true);
		e.self:AddToHateList(e.self:GetTarget(),1);
	elseif e.timer == "Reset" then
		eq.stop_timer('Reset');
		eq.depop_all(301080);
		e.self:WipeHateList();
		e.self:GotoBind();
		Agro=0;
		--eq.zone_emote(15,"You Failed");
	end
end

	
function Jek_HP(e)
	if (e.hp_event == 95) then
		Agro=1;
		e.self:WipeHateList();
		eq.set_timer("Agro_One",5000);
		e.self:Say("Help me, while I escape!");
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		e.self:SetPseudoRoot(false);
		e.self:SetRunning(true);
		e.self:MoveTo(-1011.34, 1181.00, -796.67,374.0,true);
		eq.spawn2(301080,0,0,-1011.34,1181.00,-796.67,374.0):AddToHateList(e.self:GetTarget(),1);
		eq.spawn2(301080,0,0,-1185.64,1188.02,-797.20,202.5):AddToHateList(e.self:GetTarget(),1);
		eq.set_next_hp_event(80);
	elseif (e.hp_event == 80) then
		e.self:WipeHateList();
		eq.set_timer("Agro_Two",12000);
		e.self:Say("Help me, while I escape!");
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		e.self:SetPseudoRoot(false);
		e.self:SetRunning(true);
		e.self:MoveTo(-741.96,1500.63,-775.38,172.8,true);
		eq.spawn2(301080,0,0,-818.22,1337.98,-797.53,44.3):AddToHateList(e.self:GetTarget(),1);
		eq.spawn2(301080,0,0,-608.04,1415.31,-795.92,433.8):AddToHateList(e.self:GetTarget(),1);
		eq.set_next_hp_event(70);
	elseif (e.hp_event == 70) then
		e.self:WipeHateList();
		eq.set_timer("Agro_Three",15000);
		e.self:Say("Help me, while I escape!");
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		e.self:SetPseudoRoot(false);
		e.self:SetRunning(true);
		e.self:MoveTo(-375.58,1392.45,-767.52,379.3,true);
		eq.spawn2(301080,0,0,-274.36,1393.50,-742.61,377.5):AddToHateList(e.self:GetTarget(),1);
		eq.spawn2(301080,0,0,-493.40,1315.91,-775.38,26.5):AddToHateList(e.self:GetTarget(),1);
		eq.set_next_hp_event(50);
	elseif (e.hp_event == 50) then
		e.self:WipeHateList();
		eq.set_timer("Agro_Four",15000);
		e.self:Say("Help me, while I escape!");
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		e.self:SetPseudoRoot(false);
		e.self:SetRunning(true);
		e.self:MoveTo(-258.53,1173.08,-689.41,390.5,true);
		eq.spawn2(301080,0,0,-125.30,1126.13,-659.20,501.8):AddToHateList(e.self:GetTarget(),1);
		eq.spawn2(301080,0,0,-294.53,1312.90,-713.80,329.5):AddToHateList(e.self:GetTarget(),1);
		eq.set_next_hp_event(30);
	elseif (e.hp_event == 30) then
		e.self:WipeHateList();
		eq.set_timer("Agro_Five",15000);
		e.self:Say("Help me, while I escape!");
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		e.self:SetPseudoRoot(false);
		e.self:SetRunning(true);
		e.self:MoveTo(-134.00,892.68,-639.63,3.8,true);
		eq.spawn2(301080,0,0,-150.46,1194.71,-662.03,197.5):AddToHateList(e.self:GetTarget(),1);
		eq.spawn2(301080,0,0,-163.99,656.34,-585.89,21.5):AddToHateList(e.self:GetTarget(),1);
		eq.set_next_hp_event(20);
	elseif (e.hp_event == 20) then
		e.self:WipeHateList();
		eq.set_timer("Agro_Six",10000);
		e.self:Say("Help me, while I escape!");
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		e.self:SetPseudoRoot(false);
		e.self:SetRunning(true);
		e.self:MoveTo(-178.16,475.92,-569.78,506.8,true);
		eq.spawn2(301080,0,0,-169.57,293.36,-611.36,9.3):AddToHateList(e.self:GetTarget(),1);
		eq.spawn2(301080,0,0,-132.06,881.63,-639.63,268.8):AddToHateList(e.self:GetTarget(),1);
		eq.set_next_hp_event(5);
	elseif (e.hp_event == 5) then
		e.self:WipeHateList();
		eq.set_timer("Agro_Seven",5000);
		e.self:Say("Help me, while I escape!");
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
		e.self:SetPseudoRoot(false);
		e.self:SetRunning(true);
		e.self:MoveTo(-164.66,319.41,-602.64,509.8,true);
		eq.spawn2(301080,0,0,-180.49,528.32,-568.11,256.8):AddToHateList(e.self:GetTarget(),1);
		eq.spawn2(301080,0,0,-167.13,281.34,-611.35,5.8):AddToHateList(e.self:GetTarget(),1);
	end
end

function Jek_Death(e)
	Agro=0;
end

function event_encounter_load(e)
	eq.register_npc_event('Jekisia', Event.combat, 			301032, Jek_Combat);
	eq.register_npc_event('Jekisia', Event.spawn,			301032,	Jek_Spawn);
	eq.register_npc_event('Jekisia', Event.hp,				301032,	Jek_HP);
	eq.register_npc_event('Jekisia', Event.timer,			301032,	Jek_Timer);
	
	
	eq.register_npc_event('Jekisia', Event.death_complete,  301032, 			Jek_Death);
end
