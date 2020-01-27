function event_spawn(e)
eq.set_next_hp_event(98);
end

function event_combat(e)
if (e.joined == true) then
eq.stop_timer('reset');
else
eq.set_timer('reset', 30 * 1000);
end
end

function event_timer(e)
if(e.timer == 'reset') then
eq.signal(215486,1);
eq.stop_timer('reset');
eq.depop();
elseif(e.timer == 'xegohelp') then
help_xegony(e);
eq.stop_timer('xegohelp');
end
end

function event_hp(e)
if(e.hp_event == 98) then
eq.depop_all(215050); -- untargettable An_Air_Infused_Defender
eq.spawn2(215465,0,0,-401,-327,1440.25,49); --  An_Air_Infused_Defender
eq.spawn2(215465,0,0,-433,-306,1440.25,49); --  An_Air_Infused_Defender
eq.spawn2(215465,0,0,-487,-270,1445.38,49); --  An_Air_Infused_Defender
eq.spawn2(215465,0,0,-433,-306,1440.25,49); --  An_Air_Infused_Defender
eq.spawn2(215465,0,0,-487,-270,1445.38,49); --  An_Air_Infused_Defender
eq.spawn2(215472,0,0,-460.7,-355.6,1437.1,42.4); --#An_Elemental_Arbitor
eq.set_timer('xegohelp', 1 * 1000);
eq.set_next_hp_event(82);
elseif (e.hp_event == 82) then
eq.depop_all(215052); -- untargettable #A_Knight_of_Air
eq.spawn2(215466,0,0,-480,240,1445.38,231); --  #A_Knight_of_Air
eq.spawn2(215466,0,0,-582,207,1460.5,231); --  #A_Knight_of_Air
eq.spawn2(215466,0,0,-550,217,1457.5,231); --  #A_Knight_of_Air
eq.spawn2(215466,0,0,-582,207,1460.5,231); --  #A_Knight_of_Air
eq.spawn2(215466,0,0,-550,217,1457.5,231); --  #A_Knight_of_Air
eq.spawn2(215434,0,0,-551.8,258.6,1455,231); --#Rindaler_Egulrtan
eq.set_timer('xegohelp', 1 * 1000);
eq.set_next_hp_event(66);
elseif (e.hp_event == 66) then
eq.depop_all(215049); --  untargettable #An_Air_Phoenix_Scout
eq.spawn2(215464,0,0,-257,-294,1440.25,437); -- #An_Air_Phoenix_Scout
eq.spawn2(215464,0,0,-223,-251,1440.25,437); -- #An_Air_Phoenix_Scout
eq.spawn2(215464,0,0,-195,-213,1440.25,437); -- #An_Air_Phoenix_Scout
eq.spawn2(215464,0,0,-223,-251,1440.25,437); -- #An_Air_Phoenix_Scout
eq.spawn2(215464,0,0,-195,-213,1440.25,437); -- #An_Air_Phoenix_Scout
eq.spawn2(215440,0,0,-173,-290.7,1437.1,431); --#Weruis_Herfadban
eq.set_timer('xegohelp', 1 * 1000);
eq.set_next_hp_event(50);
elseif (e.hp_event == 50) then
eq.depop_all(215051); --  untargettable #Servant_of_Air
eq.spawn2(215479,0,0,-296,323,1440.25,261); --#Servant_of_Air
eq.spawn2(215479,0,0,-351,326,1443.25,261); --#Servant_of_Air
eq.spawn2(215479,0,0,-407,329,1447.13,261); --#Servant_of_Air
eq.spawn2(215479,0,0,-351,326,1443.25,261); --#Servant_of_Air
eq.spawn2(215479,0,0,-407,329,1447.13,261); --#Servant_of_Air
eq.spawn2(215445,0,0,-352.8,372.7,1440.35,261); --#Wesreh_Galleantan
eq.set_timer('xegohelp', 1 * 1000);
eq.set_next_hp_event(34);
elseif (e.hp_event == 34) then
eq.depop_all(215048); -- untargettable #A_Deadly_Cloudwalker
eq.spawn2(215463,0,0,14,-280,1437.13,386); --#A_Deadly_Cloudwalker
eq.spawn2(215463,0,0,-3,-231,1437.13,386); --#A_Deadly_Cloudwalker
eq.spawn2(215463,0,0,-2,-187,1437.13,386); --#A_Deadly_Cloudwalker
eq.spawn2(215463,0,0,-3,-231,1437.13,386); --#A_Deadly_Cloudwalker
eq.spawn2(215463,0,0,-2,-187,1437.13,386); --#A_Deadly_Cloudwalker
eq.spawn2(215437,0,0,39,-232.5,1437.13,386); --#Huridaf_Vorgaasna
eq.set_timer('xegohelp', 1 * 1000);
eq.set_next_hp_event(18);
elseif (e.hp_event == 18) then
eq.depop_all(215047); -- untargettable #A_Djinni_Air_Defender
eq.spawn2(215462,0,0,-1,371,1442.13,374); --#A_Djinni_Air_Defender
eq.spawn2(215462,0,0,-5,427,1440.20,374); --#A_Djinni_Air_Defender
eq.spawn2(215462,0,0,-12,481,1440.25,374); --#A_Djinni_Air_Defender
eq.spawn2(215462,0,0,-5,427,1440.20,374); --#A_Djinni_Air_Defender
eq.spawn2(215462,0,0,-12,481,1440.25,374); --#A_Djinni_Air_Defender
eq.spawn2(215444,0,0,40.5,432.9,1437.13,374); --#Nuquernal_Belegrodian
eq.set_timer('xegohelp', 1 * 1000);
end
end

function help_xegony(e)
	local arbitor = eq.get_entity_list():GetMobByNpcTypeID(215472);
	
	if (arbitor.valid and not arbitor:IsEngaged()) then
		arbitor:CastToNPC():SetRunning(true);
		arbitor:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
	
	local defender = eq.get_entity_list():GetMobByNpcTypeID(215465);
	
	if (defender.valid and not defender:IsEngaged()) then
		defender:CastToNPC():SetRunning(true);
		defender:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
	
	local knight = eq.get_entity_list():GetMobByNpcTypeID(215466);
	
	if (knight.valid and not knight:IsEngaged()) then
		knight:CastToNPC():SetRunning(true);
		knight:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end

	local rindaler = eq.get_entity_list():GetMobByNpcTypeID(215434);
	
	if (rindaler.valid and not rindaler:IsEngaged()) then
		rindaler:CastToNPC():SetRunning(true);
		rindaler:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end

	local phoenix = eq.get_entity_list():GetMobByNpcTypeID(215464);
	
	if (phoenix.valid and not phoenix:IsEngaged()) then
		phoenix:CastToNPC():SetRunning(true);
		phoenix:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end

	local weruis = eq.get_entity_list():GetMobByNpcTypeID(215440);
	
	if (weruis.valid and not weruis:IsEngaged()) then
		weruis:CastToNPC():SetRunning(true);
		weruis:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end

	local cloudwalker = eq.get_entity_list():GetMobByNpcTypeID(215463);
	
	if (cloudwalker.valid and not cloudwalker:IsEngaged()) then
		cloudwalker:CastToNPC():SetRunning(true);
		cloudwalker:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
	local huridaf = eq.get_entity_list():GetMobByNpcTypeID(215437);
	
	if (huridaf.valid and not huridaf:IsEngaged()) then
		huridaf:CastToNPC():SetRunning(true);
		huridaf:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
	local djinni = eq.get_entity_list():GetMobByNpcTypeID(215462);
	
	if (djinni.valid and not djinni:IsEngaged()) then
		djinni:CastToNPC():SetRunning(true);
		djinni:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
	local nuquernal = eq.get_entity_list():GetMobByNpcTypeID(215444);
	
	if (nuquernal.valid and not nuquernal:IsEngaged()) then
		nuquernal:CastToNPC():SetRunning(true);
		nuquernal:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
	local servant = eq.get_entity_list():GetMobByNpcTypeID(215479);
	
	if (servant.valid and not servant:IsEngaged()) then
		servant:CastToNPC():SetRunning(true);
		servant:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
	local wesreh = eq.get_entity_list():GetMobByNpcTypeID(215445);
	
	if (wesreh.valid and not wesreh:IsEngaged()) then
		wesreh:CastToNPC():SetRunning(true);
		wesreh:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
end

function event_death_complete(e)
eq.unique_spawn(215438, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); --essence of air
eq.depop_with_timer(215486);
end
