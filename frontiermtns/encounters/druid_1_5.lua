-- 92198 Goblin King Dronan  61 Warr
-- 92199 Whip Cracker Garzul 58 Warr
-- 92200 Earth Seer Hunknort 61 Shaman
-- 92201 Goblin Seeker 34 Necro
-- 92202 Goblin Hider 58 Rogue
local seeker_rounds;
local num_move;

function King_Spawn(e)
	eq.set_timer("depop",30*60*1000);
	eq.set_timer("spawn_seekers",45*1000);
	eq.set_timer("spawn_hiders",8*60*1000);
	eq.set_timer("shout1",6.5*60*1000);
	eq.set_timer("shout2",7*60*1000);
	eq.set_timer("shout3",7.5*60*1000);
	seeker_rounds=1;
	eq.spawn2(92201,0,0,2884,3320,345.5,0); -- NPC: #Goblin_Seeker
	eq.spawn2(92201,0,0,2880,3325,345.5,0); -- NPC: #Goblin_Seeker
	eq.spawn2(92201,0,0,2876,3330,345.5,0); -- NPC: #Goblin_Seeker
	eq.spawn2(92201,0,0,2872,3335,345.5,0); -- NPC: #Goblin_Seeker
	eq.spawn2(92201,0,0,2868,3340,345.5,0); -- NPC: #Goblin_Seeker
	num_move=0;
end

function King_Timer(e)
	if(e.timer=="depop") then
		eq.stop_timer("depop");
		e.self:Shout("Contest over!");
		eq.depop_all(92199);
		eq.depop_all(92200);
		eq.depop_all(92201);
		eq.depop_all(92202);
		eq.depop();
	elseif (e.timer=="spawn_seekers") then
		if (seeker_rounds > 10) then
			eq.stop_timer("spawn_seekers");
		end
		eq.spawn2(92201,0,0,2878,3320,345.5,0); -- NPC: #Goblin_Seeker
		eq.spawn2(92201,0,0,2876,3325,345.5,0); -- NPC: #Goblin_Seeker
		eq.spawn2(92201,0,0,2874,3330,345.5,0); -- NPC: #Goblin_Seeker
		eq.spawn2(92201,0,0,2876,3335,345.5,0); -- NPC: #Goblin_Seeker
		eq.spawn2(92201,0,0,2878,3340,345.5,0); -- NPC: #Goblin_Seeker
		seeker_rounds=seeker_rounds+1;
	elseif (e.timer == "shout1") then
		eq.stop_timer("shout1");
		e.self:Shout("Ever since Glerbag found prize on intruder all of you keep bothering King Dronan with crying about who owns it. Gorta killed Glerbag, so Gorta says it's his. Then Bittersmell and One-eye both say they killed Gorta and it is theirs. So I kill Bittersmell and One-eye and declare that there will be a contest and the winner will get it. For a while you shut up and I am happy.");
	elseif (e.timer == "shout2") then
		eq.stop_timer("shout2");
		e.self:Shout("Now Stinkbelly remembers contest and all you start to bother me again. I smarter than you, I know this not going to help. But if it shut you up for a few days, then I declare today the day of the contest!");	
	elseif (e.timer == "shout3") then
		eq.stop_timer("shout3");
		e.self:Shout("Shut up! Here is how contest works. I choose someone to be Hidden. Then he go and hide. Find Hidden and get prize. Simple contest. Contest last until I say it over. It start when I say it start.");	
	elseif (e.timer == "spawn_hiders") then
		eq.stop_timer("spawn_hiders");
		e.self:Shout("Contest start now!");
		eq.spawn2(92202,0,0,2950.3,947.4,415.7,240); -- NPC: #Goblin_Hider
		eq.spawn2(92202,0,0,746.9,-1143,-258,266); -- NPC: #Goblin_Hider
		eq.spawn2(92202,0,0,-1891.8,-1803.4,13.11,226); -- NPC: #Goblin_Hider
		eq.spawn2(92202,0,0,-3431.6,3034.9,307.9,464); -- NPC: #Goblin_Hider
		local npc_list = eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and npc:GetNPCTypeID() == 92202) then
				npc:AddItem(62826,1);
				break;
			end
		end
	end
end

function Seeker_Spawn(e)
	e.self:MoveTo(2882,3509.6,358,0,true);
	eq.set_timer("path",28*1000);
	eq.set_timer("shout1",math.random(15, 40)*1000);
	eq.set_timer("shout2",math.random(10, 45)*1000);
end

function Seeker_Timer(e)
	if(e.timer=="shout1") then
		eq.stop_timer("shout1");
		e.self:Shout("I will win the prize and I'm going to eat it!")
	elseif (e.timer == "shout2") then
		eq.stop_timer("shout2");
		e.self:Shout("King Dronan rules!")
	elseif (e.timer == "path") then
		eq.stop_timer("path");
		if (math.random(1,2)==1) then
			e.self:MoveTo(3324,3350,350,94,true);
		else
			e.self:MoveTo(2328,3448,292.6,181,true);
		end
		eq.set_timer("move",40*1000);
	elseif (e.timer == "move") then
		eq.stop_timer("move");
		num_move=num_move+1;
		--make it rain goblins
		--e.self:GMMove(math.random(-3350,3350), math.random(-3400,3400), 330, math.random(0,230));
		--concat("e.self:MoveTo(",x+5,",",y+5,",",z,", math.random(0,230),true);")
		if (num_move==1) then
		e.self:MoveTo(-1719.000000,1296.000000,75.599998, math.random(0,230),true);
		elseif (num_move==2) then
		e.self:MoveTo(538.880005,-2891.000000,-357.799988, math.random(0,230),true);
		elseif (num_move==3) then
		e.self:MoveTo(3651.879883,2286.000000,219.899994, math.random(0,230),true);
		elseif (num_move==4) then
		e.self:MoveTo(545.880005,2641.879883,302.250000, math.random(0,230),true);
		elseif (num_move==5) then
		e.self:MoveTo(-49.000000,1576.000000,133.300003, math.random(0,230),true);
		elseif (num_move==6) then
		e.self:MoveTo(821.000000,952.880005,13.250000, math.random(0,230),true);
		elseif (num_move==7) then
		e.self:MoveTo(2011.000000,1662.880005,348.130005, math.random(0,230),true);
		elseif (num_move==8) then
		e.self:MoveTo(3176.000000,-1290.880005,-286.630005, math.random(0,230),true);
		elseif (num_move==9) then
		e.self:MoveTo(861.500000,1472.000000,130.500000, math.random(0,230),true);
		elseif (num_move==10) then
		e.self:MoveTo(3643.879883,3078.000000,348.750000, math.random(0,230),true);
		elseif (num_move==11) then
		e.self:MoveTo(-1472.000000,2136.000000,213.250000, math.random(0,230),true);
		elseif (num_move==12) then
		e.self:MoveTo(2905.000000,3459.000000,344.500000, math.random(0,230),true);
		elseif (num_move==13) then
		e.self:MoveTo(2933.000000,3463.000000,344.880005, math.random(0,230),true);
		elseif (num_move==14) then
		e.self:MoveTo(2864.000000,3461.000000,345.880005, math.random(0,230),true);
		elseif (num_move==15) then
		e.self:MoveTo(2838.000000,3462.000000,345.130005, math.random(0,230),true);
		elseif (num_move==16) then
		e.self:MoveTo(2970.750000,3300.750000,346.000000, math.random(0,230),true);
		elseif (num_move==17) then
		e.self:MoveTo(-2183.000000,-1174.880005,-299.750000, math.random(0,230),true);
		elseif (num_move==18) then
		e.self:MoveTo(2957.000000,-3410.879883,-508.500000, math.random(0,230),true);
		elseif (num_move==19) then
		e.self:MoveTo(-3235.879883,3325.629883,301.750000, math.random(0,230),true);
		elseif (num_move==20) then
		e.self:MoveTo(3051.750000,3111.629883,321.130005, math.random(0,230),true);
		elseif (num_move==21) then
		e.self:MoveTo(-3020.879883,-8.250000,-102.300003, math.random(0,230),true);
		elseif (num_move==22) then
		e.self:MoveTo(-2956.879883,-2608.250000,-385.899994, math.random(0,230),true);
		elseif (num_move==23) then
		e.self:MoveTo(-799.000000,-401.380005,-114.000000, math.random(0,230),true);
		elseif (num_move==24) then
		e.self:MoveTo(-780.380005,-175.130005,-114.000000, math.random(0,230),true);
		elseif (num_move==25) then
		e.self:MoveTo(-355.000000,1952.000000,175.750000, math.random(0,230),true);
		elseif (num_move==26) then
		e.self:MoveTo(-3224.879883,1345.630005,2.900000, math.random(0,230),true);
		elseif (num_move==27) then
		e.self:MoveTo(2615.250000,3325.129883,313.130005, math.random(0,230),true);
		elseif (num_move==28) then
		e.self:MoveTo(-586.000000,-2816.000000,-480.250000, math.random(0,230),true);
		elseif (num_move==29) then
		e.self:MoveTo(-661.000000,-2844.000000,-473.880005, math.random(0,230),true);
		elseif (num_move==30) then
		e.self:MoveTo(-607.000000,-2825.000000,-478.750000, math.random(0,230),true);
		elseif (num_move==31) then
		e.self:MoveTo(2314.000000,1916.000000,345.250000, math.random(0,230),true);
		elseif (num_move==32) then
		e.self:MoveTo(2844.879883,-209.880005,-62.299999, math.random(0,230),true);
		elseif (num_move==33) then
		e.self:MoveTo(3046.879883,1416.000000,101.379997, math.random(0,230),true);
		elseif (num_move==34) then
		e.self:MoveTo(-3401.879883,-297.000000,-149.100006, math.random(0,230),true);
		elseif (num_move==35) then
		e.self:MoveTo(-2485.879883,-2812.879883,-212.000000, math.random(0,230),true);
		elseif (num_move==36) then
		e.self:MoveTo(-978.880005,1703.000000,156.500000, math.random(0,230),true);
		elseif (num_move==37) then
		e.self:MoveTo(-2049.129883,416.880005,-79.879997, math.random(0,230),true);
		elseif (num_move==38) then
		e.self:MoveTo(3377.879883,-2315.879883,-404.600006, math.random(0,230),true);
		elseif (num_move==39) then
		e.self:MoveTo(-821.000000,1613.880005,100.099998, math.random(0,230),true);
		elseif (num_move==40) then
		e.self:MoveTo(-1901.750000,-2946.250000,-533.500000, math.random(0,230),true);
		elseif (num_move==41) then
		e.self:MoveTo(-607.380005,-2726.000000,-495.500000, math.random(0,230),true);
		elseif (num_move==42) then
		e.self:MoveTo(1723.000000,-1876.000000,-375.500000, math.random(0,230),true);
		elseif (num_move==43) then
		e.self:MoveTo(-2143.000000,-1428.000000,-186.899994, math.random(0,230),true);
		elseif (num_move==44) then
		e.self:MoveTo(-1327.880005,-1424.000000,-339.799988, math.random(0,230),true);
		elseif (num_move==45) then
		e.self:MoveTo(-3692.879883,-698.250000,-88.800003, math.random(0,230),true);
		elseif (num_move==46) then
		e.self:MoveTo(-2941.879883,-1585.250000,-168.750000, math.random(0,230),true);
		elseif (num_move==47) then
		e.self:MoveTo(-848.380005,-2815.629883,-437.380005, math.random(0,230),true);
		elseif (num_move==48) then
		e.self:MoveTo(1760.000000,-1807.000000,-375.500000, math.random(0,230),true);
		elseif (num_move==49) then
		e.self:MoveTo(1947.000000,-1924.000000,-375.500000, math.random(0,230),true);
		elseif (num_move==50) then
		e.self:MoveTo(2023.000000,-1591.000000,-375.500000, math.random(0,230),true);
		elseif (num_move==51) then
		e.self:MoveTo(1970.000000,-1548.000000,-375.500000, math.random(0,230),true);
		elseif (num_move==52) then
		e.self:MoveTo(1949.000000,-1609.000000,-375.500000, math.random(0,230),true);
		elseif (num_move==53) then
		e.self:MoveTo(1972.000000,-1913.000000,-375.500000, math.random(0,230),true);
		elseif (num_move==54) then
		e.self:MoveTo(2193.879883,-1895.380005,-383.750000, math.random(0,230),true);
		elseif (num_move==55) then
		e.self:MoveTo(1741.380005,-1818.250000,-375.500000, math.random(0,230),true);
		end
	end		
end

function Whip_Spawn(e)
	eq.set_timer("shout1",4*60*1000);
	eq.set_timer("shout2",4.3*60*1000);
end

function Whip_Timer(e)
	if(e.timer=="shout1") then
		eq.stop_timer("shout1");
		e.self:Shout("Gather! Servants of Dronan gather!")
	elseif (e.timer == "shout2") then
		eq.stop_timer("shout2");
		e.self:Shout("Hurry it up! You no want Garzul to come get you!")
	end		
end

function event_encounter_load(e)
  eq.register_npc_event('druid_1_5', Event.timer,          92198, King_Timer); 
  eq.register_npc_event('druid_1_5', Event.spawn,          92198, King_Spawn);
  eq.register_npc_event('druid_1_5', Event.timer,          92199, Whip_Timer); 
  eq.register_npc_event('druid_1_5', Event.spawn,          92199, Whip_Spawn);  

  eq.register_npc_event('druid_1_5', Event.spawn,          92201, Seeker_Spawn);
  eq.register_npc_event('druid_1_5', Event.timer,          92201, Seeker_Timer);  
end
