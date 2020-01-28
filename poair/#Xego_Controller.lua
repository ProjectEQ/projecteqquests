function event_spawn(e)
eq.set_timer('xegoevent', 6 * 1000);
eq.enable_spawn2(45107); --muzlakh
end


function event_timer(e)
if(e.timer == 'xegoevent') then
		eq.stop_timer('xegoevent');
		eq.depop_all(215472); -- An_Elemental_Arbitor 
		eq.depop_all(215465); -- An_Air_Infused_Defender
		eq.depop_all(215466); -- A_Knight_of_Air
		eq.depop_all(215434); -- Rindaler_Egulrtan
		eq.depop_all(215464); -- An_Air_Phoenix_Scout
		eq.depop_all(215440); -- Weruis_Herfadban
		eq.depop_all(215463); -- A_Deadly_Cloudwalker
		eq.depop_all(215437); -- Huridaf_Vorgaasna
		eq.depop_all(215462); -- A_Djinni_Air_Defender
		eq.depop_all(215444); -- Nuquernal_Belegrodian
		eq.depop_all(215479); -- #Servant_of_Air
		eq.depop_all(215445); -- #Wesreh_Galleantan
  	eq.spawn2(215050,0,0,-401,-327,1440.25,49); -- untargettable An_Air_Infused_Defender
  	eq.spawn2(215050,0,0,-433,-306,1440.25,49); -- untargettable An_Air_Infused_Defender
  	eq.spawn2(215050,0,0,-487,-270,1445.38,49); -- untargettable An_Air_Infused_Defender
  	eq.spawn2(215050,0,0,-459,-285,1437,49); -- untargettable An_Air_Infused_Defender
  	eq.spawn2(215050,0,0,-375,-350,1437,49); -- untargettable An_Air_Infused_Defender
  	eq.spawn2(215052,0,0,-480,240,1445.38,231); -- untargettable #A_Knight_of_Air
  	eq.spawn2(215052,0,0,-582,207,1460.5,231); -- untargettable #A_Knight_of_Air
  	eq.spawn2(215052,0,0,-550,217,1457.5,231); -- untargettable #A_Knight_of_Air
  	eq.spawn2(215052,0,0,-582,207,1460.5,231); -- untargettable #A_Knight_of_Air
  	eq.spawn2(215052,0,0,-550,217,1457.5,231); -- untargettable #A_Knight_of_Air
  	eq.spawn2(215049,0,0,-257,-294,1440.25,437); --untargettable #An_Air_Phoenix_Scout
  	eq.spawn2(215049,0,0,-223,-251,1440.25,437); --untargettable #An_Air_Phoenix_Scout
  	eq.spawn2(215049,0,0,-195,-213,1440.25,437); --untargettable #An_Air_Phoenix_Scout
  	eq.spawn2(215049,0,0,-206,-231,1440.25,437); --untargettable #An_Air_Phoenix_Scout
  	eq.spawn2(215049,0,0,-238,-275,1440.25,437); --untargettable #An_Air_Phoenix_Scout
		eq.spawn2(215051,0,0,-296,323,1440.25,261); --untargettable#Servant_of_Air
  	eq.spawn2(215051,0,0,-351,326,1443.25,261); --untargettable#Servant_of_Air
  	eq.spawn2(215051,0,0,-407,329,1447.13,261); --untargettable#Servant_of_Air
  	eq.spawn2(215051,0,0,-378,326,1442.25,261); --untargettable#Servant_of_Air
  	eq.spawn2(215051,0,0,-326,320,1437.13,261); --untargettable#Servant_of_Air
		eq.spawn2(215048,0,0,14,-280,1437.13,386); --untargettable #A_Deadly_Cloudwalker
  	eq.spawn2(215048,0,0,-3,-231,1437.13,386); --untargettable #A_Deadly_Cloudwalker
  	eq.spawn2(215048,0,0,-2,-187,1437.13,386); --untargettable #A_Deadly_Cloudwalker
  	eq.spawn2(215048,0,0,1,-257,1437.13,386); --untargettable #A_Deadly_Cloudwalker
  	eq.spawn2(215048,0,0,-4,-209,1437.13,386); --untargettable #A_Deadly_Cloudwalker
		eq.spawn2(215047,0,0,-1,371,1442.13,374); --untargettable #A_Djinni_Air_Defender
  	eq.spawn2(215047,0,0,-5,427,1440.20,374); --untargettable #A_Djinni_Air_Defender
  	eq.spawn2(215047,0,0,-12,481,1440.25,374); --untargettable #A_Djinni_Air_Defender
  	eq.spawn2(215047,0,0,-5,455,1440.20,374); --untargettable #A_Djinni_Air_Defender
  	eq.spawn2(215047,0,0,-5,393,1440.25,374); --untargettable #A_Djinni_Air_Defender
		eq.spawn2(215056,0,0,64,24.70,1467.4,386.8); -- NPC: #Xegony_the_Queen_of_Air
	end
end

function event_signal(e)
if (e.signal==1) then
eq.set_timer('xegoevent', 1 * 1000);
end
end
