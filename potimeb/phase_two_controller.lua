--phase_two_controller (223242)
--Phase 2 Controller
--potimeb

local undead_kills = 0;
local kills = 0;
local bosses = 	{ 223135, 223140, 223108, 223144 };	--untargetable{targetable} versions of bosses (excludes undead)
local tBosses = { 223146, 223096, 223134, 223118 }

function event_spawn(e)
	local expedition = eq.get_expedition()
	undead_kills = 0;
	kills = 0;

	--Undead trial phase 2 mobs
	eq.spawn2(223138,0,0,240,1100,494,387);	--an_undead_guardian_ (223138)
	eq.spawn2(223138,0,0,240,1115,494,387);		
	
	--Water trial phase 2 mobs
	eq.spawn2(223136,0,0,130,830,495,387);		--A_Crustacean_Champion (223136)
	eq.spawn2(223136,0,0,130,855,495,387);	
	eq.spawn2(223136,0,0,130,880,495,387);	
	eq.spawn2(223136,0,0,130,905,495,387);		

	eq.spawn2(223148,0,0,170,820,495,387);		--A_Watercrafted_Hunter (223148)
	eq.spawn2(223148,0,0,170,860,495,387);	
	eq.spawn2(223148,0,0,170,900,495,387);	

	eq.spawn2(223141,0,0,230,805,495,387);		--A_Deepwater_Assassin (223141)
	eq.spawn2(223141,0,0,230,875,495,387);

	if expedition.valid and not expedition:HasLockout('War Shapen Emissary') then
		eq.spawn2(223140,6,0,428,744,493,387);		--A_War_Shapen_Emissary (223140)
	else
		kills = kills + 1;
	end

	--Fire trial phase 2 mobs
	eq.spawn2(223137,0,0,130,610,495,387);		--A_Fire_Etched_Doombringer (223137)
	eq.spawn2(223137,0,0,130,585,495,387);	
	eq.spawn2(223137,0,0,130,560,495,387);	
	eq.spawn2(223137,0,0,130,535,495,387);	

	eq.spawn2(223124,0,0,170,525,495,387);		--A_Smoldering_Elemental (223124)
	eq.spawn2(223124,0,0,170,565,495,387);	
	eq.spawn2(223124,0,0,170,605,495,387);	

	eq.spawn2(223143,0,0,230,570,495,387);		--A_Ferocious_War_Boar (223143)
	eq.spawn2(223143,0,0,230,630,495,387);

	if expedition.valid and not expedition:HasLockout('Gutripping War Beast') then
		eq.spawn2(223135,7,0,428,677,493,387);		--A_Gutripping_War_Beast (223135)
	else
		kills = kills + 1;
	end
	
	--earth trial phase 2 mobs
	eq.spawn2(223123,0,0,170,1315,495,387);	--Champion_of_Korascian (223099)
	eq.spawn2(223123,0,0,170,1340,495,387);	
	eq.spawn2(223123,0,0,170,1365,495,387);	
	eq.spawn2(223123,0,0,170,1390,495,387);

	eq.spawn2(223246,0,0,220,1425,495,305);	--An_Unholy_Rock_Fiend (223125)
	eq.spawn2(223246,0,0,245,1410,495,305);	
	eq.spawn2(223246,0,0,275,1390,495,305);	

	eq.spawn2(223247,0,0,250,1460,495,305);	--An_Elemental_Stonefist (223102)
	eq.spawn2(223247,0,0,300,1435,495,305);

	if expedition.valid and not expedition:HasLockout('Earthen Overseer') then
		eq.spawn2(223108,9,0,440,1467,493,387);	--An_Earthen_Overseer (223108)
	else
		kills = kills + 1;
	end
	
	--air trial phase 2 mobs
	eq.spawn2(223102,0,0,150,1605,495,387);	--An_Elemental_Stonefist (223102)
	eq.spawn2(223102,0,0,150,1630,495,387);	
	eq.spawn2(223102,0,0,150,1655,495,387);	
	eq.spawn2(223102,0,0,150,1680,495,387);

	eq.spawn2(223125,0,0,200,1595,495,387);	--An_Unholy_Rock_Fiend (223125)
	eq.spawn2(223125,0,0,200,1635,495,387);	
	eq.spawn2(223125,0,0,200,1675,495,387);	

	eq.spawn2(223099,0,0,285,1575,495,445);	--Champion_of_Korascian (223099)
	eq.spawn2(223099,0,0,250,1545,495,445);

	if expedition.valid and not expedition:HasLockout('Windshapen Warlord of Air') then
		eq.spawn2(223144,8,0,442,1532,493,387);	--A_Windshapen_Warlord_of_Air (223144)
	else
		kills = kills + 1;
	end
end

function event_signal(e)
	local expedition = eq.get_expedition()
	--kill signals from undead trial
	if e.signal == 1 then	--signal from phase 2 mobs besides undead
		kills = kills + 1;			
	elseif e.signal == 2 then
		undead_kills = undead_kills + 1;
		if undead_kills == 2 then
			--wave 2
			eq.spawn2(223107,3,0,110,1070,494,0);		--an_undead_guardian_ (223107)	
			eq.spawn2(223107,4,0,110,1145,494,256);		
		elseif undead_kills == 4 then
			--wave 3
			eq.spawn2(223243,0,0,295,1090,494,0);
			eq.spawn2(223243,0,0,305,1090,494,0);	
			eq.spawn2(223243,0,0,295,1125,494,256);
			eq.spawn2(223243,0,0,305,1125,494,256);	--#an_undead_guardian (223243)
		elseif undead_kills == 8 then
			if expedition.valid and not expedition:HasLockout('Ralthos Enrok') then
				eq.unique_spawn(223127,0,0,440,1110,494,387);	--Ralthos_Enrok (223127)
			else
				undead_kills = undead_kills + 1;
			end
		end
	end
	
	eq.GM_Message(300,string.format("P2 kills [%s] of 40 -- Undead p2 Kills [%s] of 9",kills,undead_kills));	--debug
	
	if kills == 40 and undead_kills == 9 then
		expedition:AddLockout('Phase 2 Complete', 475200);
		eq.signal(223097,3);	--signal zone_status that phase is complete
		eq.depop();
	end
end
	