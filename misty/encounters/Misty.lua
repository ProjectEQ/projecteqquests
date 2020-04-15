--[[


Halloween Event 2018! Written by ##Drogerin## -- Enjoy!

#Deputy? 33161
#Deputy?? 33162
#Deputy??? 33163


--]]


local box = require("aa_box")

local Mob = box();
Mob:add(-2415.48, 828.08);
Mob:add(-2421.36, 709.22);
Mob:add(-2308.31, 689.55);
Mob:add(-2288.73, 844.17);

local deputydeath=false;
local healed=false;
local phase1=true;
local spawned=true;

local deputy_min_hit=600;
local deputy_max_hit=2400;

local deputy_old_min_hit=370;
local deputy_old_max_hit=1800;

local which=0;

local General_min_hit=1;
local General_max_hit=1;


local General_Speed=20;
local General_Speed2=25;
local General_old=33;

local Generalnew_min_hit=900;
local Generalnew_max_hit=2800;

local General3=900;
local General32=1850;




local stunned=0;


function Deputy_Signal(e)
	if (e.signal == 1) then
		e.self:SetRunning(true);
		e.self:MoveTo(-2358.64,736.61,3.90,429.3,true);
		stunned=0;
		eq.set_timer("Talk",18000);
	elseif (e.signal == 2) and deputydeath == false then
		eq.set_timer("Rez1",15000);
	elseif (e.signal == 2) and deputydeath == true then
		eq.stop_timer("Rez1");
	elseif (e.signal == 3) and deputydeath == false then
		eq.set_timer("Rez2",15000);
	elseif (e.signal == 3) and deputydeath == true then
		eq.stop_timer("Rez2");
	elseif (e.signal == 4) then
		eq.zone_emote(15,"General Huffin cackles, Well we can fix that!");
		eq.set_timer("Adds",90000);
		eq.set_timer("Bags",15000);
	elseif (e.signal == 5) and stunned == 1 then
		e.self:ModSkillDmgTaken(0, -650) -- 1h blunt
		e.self:ModSkillDmgTaken(1, -650) -- 1h slashing
		e.self:ModSkillDmgTaken(2, -650) -- 2h blunt
		e.self:ModSkillDmgTaken(3, -650) -- 2h slashing
		e.self:ModSkillDmgTaken(7, -650) -- archery
		e.self:ModSkillDmgTaken(8, -650) -- backstab
		e.self:ModSkillDmgTaken(10, -650) -- bash
		e.self:ModSkillDmgTaken(21, -650) -- dragon punch
		e.self:ModSkillDmgTaken(23, -650) -- eagle strike
		e.self:ModSkillDmgTaken(26, -650) -- flying kick
		e.self:ModSkillDmgTaken(28, -650) -- hand to hand
		e.self:ModSkillDmgTaken(30, -650) -- kick
		e.self:ModSkillDmgTaken(36, -650) -- piercing
		e.self:ModSkillDmgTaken(38, -650) -- round kick
		e.self:ModSkillDmgTaken(52, -650) -- tiger claw
		e.self:ModSkillDmgTaken(74, -650) -- frenzy
		e.self:ModSkillDmgTaken(77, -650) -- 2hp
		eq.set_timer("Stun",1000);
	elseif (e.signal == 5) and stunned == 2 then
		e.self:ModSkillDmgTaken(0, -175) -- 1h blunt
		e.self:ModSkillDmgTaken(1, -175) -- 1h slashing
		e.self:ModSkillDmgTaken(2, -175) -- 2h blunt
		e.self:ModSkillDmgTaken(3, -175) -- 2h slashing
		e.self:ModSkillDmgTaken(7, -175) -- archery
		e.self:ModSkillDmgTaken(8, -175) -- backstab
		e.self:ModSkillDmgTaken(10, -175) -- bash
		e.self:ModSkillDmgTaken(21, -175) -- dragon punch
		e.self:ModSkillDmgTaken(23, -175) -- eagle strike
		e.self:ModSkillDmgTaken(26, -175) -- flying kick
		e.self:ModSkillDmgTaken(28, -175) -- hand to hand
		e.self:ModSkillDmgTaken(30, -175) -- kick
		e.self:ModSkillDmgTaken(36, -175) -- piercing
		e.self:ModSkillDmgTaken(38, -175) -- round kick
		e.self:ModSkillDmgTaken(52, -175) -- tiger claw
		e.self:ModSkillDmgTaken(74, -175) -- frenzy
		e.self:ModSkillDmgTaken(77, -175) -- 2hp
		eq.set_timer("Stun",1000);
	elseif (e.signal == 5) and stunned == 3 then
		e.self:ModSkillDmgTaken(0, 0) -- 1h blunt
		e.self:ModSkillDmgTaken(1, 0) -- 1h slashing
		e.self:ModSkillDmgTaken(2, 0) -- 2h blunt
		e.self:ModSkillDmgTaken(3, 0) -- 2h slashing
		e.self:ModSkillDmgTaken(7, 0) -- archery
		e.self:ModSkillDmgTaken(8, 0) -- backstab
		e.self:ModSkillDmgTaken(10, 0) -- bash
		e.self:ModSkillDmgTaken(21, 0) -- dragon punch
		e.self:ModSkillDmgTaken(23, 0) -- eagle strike
		e.self:ModSkillDmgTaken(26, 0) -- flying kick
		e.self:ModSkillDmgTaken(28, 0) -- hand to hand
		e.self:ModSkillDmgTaken(30, 0) -- kick
		e.self:ModSkillDmgTaken(36, 0) -- piercing
		e.self:ModSkillDmgTaken(38, 0) -- round kick
		e.self:ModSkillDmgTaken(52, 0) -- tiger claw
		e.self:ModSkillDmgTaken(74, 0) -- frenzy
		e.self:ModSkillDmgTaken(77, 0) -- 2hp
		eq.set_timer("Stun",1000);
	elseif (e.signal == 5) and stunned == 4 then
		e.self:ModSkillDmgTaken(0, 250) -- 1h blunt
		e.self:ModSkillDmgTaken(1, 250) -- 1h slashing
		e.self:ModSkillDmgTaken(2, 250) -- 2h blunt
		e.self:ModSkillDmgTaken(3, 250) -- 2h slashing
		e.self:ModSkillDmgTaken(7, 250) -- archery
		e.self:ModSkillDmgTaken(8, 250) -- backstab
		e.self:ModSkillDmgTaken(10, 250) -- bash
		e.self:ModSkillDmgTaken(21, 250) -- dragon punch
		e.self:ModSkillDmgTaken(23, 250) -- eagle strike
		e.self:ModSkillDmgTaken(26, 250) -- flying kick
		e.self:ModSkillDmgTaken(28, 250) -- hand to hand
		e.self:ModSkillDmgTaken(30, 250) -- kick
		e.self:ModSkillDmgTaken(36, 250) -- piercing
		e.self:ModSkillDmgTaken(38, 250) -- round kick
		e.self:ModSkillDmgTaken(52, 250) -- tiger claw
		e.self:ModSkillDmgTaken(74, 250) -- frenzy
		e.self:ModSkillDmgTaken(77, 250) -- 2hp
		eq.set_timer("Stun",1000);
	elseif (e.signal == 5) and stunned == 5 then
		e.self:ModSkillDmgTaken(0, 500) -- 1h blunt
		e.self:ModSkillDmgTaken(1, 500) -- 1h slashing
		e.self:ModSkillDmgTaken(2, 500) -- 2h blunt
		e.self:ModSkillDmgTaken(3, 500) -- 2h slashing
		e.self:ModSkillDmgTaken(7, 500) -- archery
		e.self:ModSkillDmgTaken(8, 500) -- backstab
		e.self:ModSkillDmgTaken(10, 500) -- bash
		e.self:ModSkillDmgTaken(21, 500) -- dragon punch
		e.self:ModSkillDmgTaken(23, 500) -- eagle strike
		e.self:ModSkillDmgTaken(26, 500) -- flying kick
		e.self:ModSkillDmgTaken(28, 500) -- hand to hand
		e.self:ModSkillDmgTaken(30, 500) -- kick
		e.self:ModSkillDmgTaken(36, 500) -- piercing
		e.self:ModSkillDmgTaken(38, 500) -- round kick
		e.self:ModSkillDmgTaken(52, 500) -- tiger claw
		e.self:ModSkillDmgTaken(74, 500) -- frenzy
		e.self:ModSkillDmgTaken(77, 500) -- 2hp
		eq.set_timer("Stun",1000);
		stunned=0;
		eq.stop_timer("Bags");
		eq.set_timer("Stun",1000);
	end
end
	
function Deputy_Spawn(e)
	if spawned == true then
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1); -- Set variables immune agro, agro on, no harm, immune magic.
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
		spawned=false;
	elseif spawned == false then
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
		e.self:AddToHateList(e.self:GetTarget(),1);	
		e.self:TempName("General_Huffin");
		eq.set_timer("Check",1000);
		spawned=1;
	elseif phase1 == false then
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
		e.self:AddToHateList(e.self:GetTarget(),1);	
		e.self:ModSkillDmgTaken(0, -999) -- 1h blunt
		e.self:ModSkillDmgTaken(1, -999) -- 1h slashing
		e.self:ModSkillDmgTaken(2, -999) -- 2h blunt
		e.self:ModSkillDmgTaken(3, -999) -- 2h slashing
		e.self:ModSkillDmgTaken(7, -999) -- archery
		e.self:ModSkillDmgTaken(8, -999) -- backstab
		e.self:ModSkillDmgTaken(10, -999) -- bash
		e.self:ModSkillDmgTaken(21, -999) -- dragon punch
		e.self:ModSkillDmgTaken(23, -999) -- eagle strike
		e.self:ModSkillDmgTaken(26, -999) -- flying kick
		e.self:ModSkillDmgTaken(28, -999) -- hand to hand
		e.self:ModSkillDmgTaken(30, -999) -- kick
		e.self:ModSkillDmgTaken(36, -999) -- piercing
		e.self:ModSkillDmgTaken(38, -999) -- round kick
		e.self:ModSkillDmgTaken(52, -999) -- tiger claw
		e.self:ModSkillDmgTaken(74, -999) -- frenzy
		e.self:ModSkillDmgTaken(77, -650) -- 2hp
		e.self:TempName("General_Huffin");
		stunned=0;
		eq.set_timer("Laugh",20000);
		eq.set_next_hp_event(75);
		eq.set_timer("Mob", 3000);
		phase1=true;
	end	
end

function Deputy_Combat(e)
	if (e.joined == true) then
		eq.set_timer("Fear",150000);
		eq.stop_timer("Fail");
	elseif (e.joined == false) then
		eq.set_timer("Fail",10000);
		spawned=true;
	end
end

function Deputy_Timer(e)
	if not Mob:contains(e.self:GetX(), e.self:GetY()) then -- If I am not inside this box - respawn me back at spawn point.
        e.self:GotoBind();
	end
	if (e.timer == "Talk") then
		e.self:Say("Oh Crysta, what a pity.  Have you come to take all of your goods back? Do you think anyone will believe you? What is with this crew of people as well, you don't actually think you can win?");
		eq.set_timer("Convo_",8000);
		eq.stop_timer("Talk");
	elseif (e.timer == "Guards") then
		e.self:Say("Now will you come peacefully?");
		eq.set_timer("Convo_2",8000);
		eq.stop_timer("Guards");
	elseif (e.timer == "Agro") then
		e.self:TempName("General_Huffin");
		e.self:Shout("Boys? Get them!");
		eq.signal(33162,2); -- NPC: Deputy??
		eq.signal(33163,2); -- NPC: Deputy???
		eq.spawn2(33161,0,0,-2358.64,736.61,3.90,429.3); -- NPC: Deputy?
		eq.depop();
		eq.stop_timer("Agro");
	elseif (e.timer == "Fear") then
		e.self:CastSpell(3070, e.self:GetTarget():GetID()); -- Spell: Timeless Panic
	elseif (e.timer == "Convo_") then
		e.self:Say("Funny Crysta, like I would give up those precious goods!");
		e.self:Shout("GUARDS!");
		eq.spawn2(33162,0,0,-2253.81,737.77,-453,411.3); -- NPC: Deputy??
		eq.spawn2(33163,0,0,-2411.18,645.80,-328,3.8); -- NPC: Deputy???
		eq.signal(33162,1); -- NPC: Deputy??
		eq.signal(33163,1); -- NPC: Deputy???
		eq.set_timer("Guards",8000);
		eq.stop_timer("Convo_");
	elseif (e.timer == "Convo_2") then
		e.self:Say("I don't belong here? You have no idea. Prepare yourselves.");
		eq.set_timer("Agro",10000);
		eq.stop_timer("Convo_2");
	elseif (e.timer == "Check" and deputydeath == true) then
		eq.stop_timer("Check");
		eq.zone_emote(15,"General Huffin yells, It's about time I take this into my own hands! Prepare yourselves weaklings!")
		phase1=false;
		eq.signal(33165,1); -- NPC: Crysta_Tagglefoot
	elseif (e.timer == "Rez1") then
		eq.spawn2(33162,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: Deputy??
		eq.zone_emote(15,"General Huffin laughs as his comrades are brought back to life.");
		eq.stop_timer("Rez1");
		eq.signal(33162,3); -- NPC: Deputy??
	elseif (e.timer == "Rez2") then
		eq.spawn2(33163,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: Deputy???
		eq.zone_emote(15,"General Huffin laughs as his comrades are brought back to life.");
		eq.signal(33163,3); -- NPC: Deputy???
		eq.stop_timer("Rez2");
	elseif (e.timer == "Laugh") then
		eq.zone_emote(15,"Your damage is pathetic!! You can't even hit me!");
		eq.set_timer("Laugh2",15000);
		eq.stop_timer("Laugh");
	elseif (e.timer == "Laugh2") then
		eq.signal(33165,2); -- NPC: Crysta_Tagglefoot
		eq.stop_timer("Laugh2");
	elseif (e.timer == "Bags") then
		eq.zone_emote(15,"bags of goodies fly out of General Huffin's pockets scattered onto the ground!");
		eq.set_timer("Sugar_Rush2",3000);
		eq.set_timer("Bags",60000);
		which = math.random(3);
		if  (which == 1) then
		eq.create_ground_object(26648,-2336.57,738.01,-2.91,281.3,60000);
		eq.create_ground_object(84090,-2329.69,715.01,-2.92,310.5,60000);
		eq.create_ground_object(84090,-2351.80,725.91,-2.91,410.0,60000);
		eq.create_ground_object(84090,-2363.91,747.98,-2.94,443.0,60000);
		eq.create_ground_object(84090,-2363.16,782.24,-2.90,403.0,60000);
		eq.signal(33165,3); -- NPC: Crysta_Tagglefoot
		elseif (which == 2) then
		eq.create_ground_object(84090,-2336.57,738.01,-2.91,281.3,60000);
		eq.create_ground_object(84090,-2329.69,715.01,-2.92,310.5,60000);
		eq.create_ground_object(26648,-2351.80,725.91,-2.91,410.0,60000);
		eq.create_ground_object(84090,-2363.91,747.98,-2.94,443.0,60000);
		eq.create_ground_object(84090,-2363.16,782.24,-2.90,403.0,60000);
		eq.signal(33165,3); -- NPC: Crysta_Tagglefoot
		elseif (which == 3) then
		eq.create_ground_object(84090,-2336.57,738.01,-2.91,281.3,60000);
		eq.create_ground_object(84090,-2329.69,715.01,-2.92,310.5,60000);
		eq.create_ground_object(84090,-2351.80,725.91,-2.91,410.0,60000);
		eq.create_ground_object(84090,-2363.91,747.98,-2.94,443.0,60000);
		eq.create_ground_object(26648,-2363.16,782.24,-2.90,403.0,60000);
		eq.signal(33165,3); -- NPC: Crysta_Tagglefoot
		end
	elseif (e.timer == "Sugar_Rush2") then
		eq.zone_emote(15,"General Huffin picks up some of the remaining candy on the ground and goes into a SUGAR FRENZY!");
		e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 100);
		e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 100);
		e.self:ModifyNPCStat("attack_delay",  tostring(General_Speed));
		eq.stop_timer("Sugar_Rush2");
		eq.set_timer("Sugar_Rush2End",15000);
	elseif (e.timer == "Sugar_Rush2End") then
		eq.zone_emote(15,"General Huffin calms down.");
		e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 15);
		e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 15);
		e.self:ModifyNPCStat("attack_delay",  tostring(General_old));
		eq.stop_timer("Sugar_Rush2End");
	elseif (e.timer == "Stun") then
		eq.zone_emote(13,"General Huffin yells, BANNED!");
		e.self:ModifyNPCStat("min_hit", tostring(General_min_hit));
		e.self:ModifyNPCStat("max_hit", tostring(General_max_hit));
		e.self:Stun(30*1000);
		eq.stop_timer("Stun");
		eq.signal(33165,5); -- NPC: Crysta_Tagglefoot
	elseif (e.timer == "Blind") then
		eq.zone_emote(15,"General Huffin raises up his weapon and the light begins to shines into your eyes. Look away quickly!");
	elseif (e.timer == "BlindCast") then
			eq.set_timer("BlindCast",70000);
			eq.zone_emote(13,"General Huffin says, No more games!");
			local cl = eq.get_entity_list():GetClientList();
			for client in cl.entries do
				if (client.valid and not e.self:BehindMob(client, e.self:GetX(), e.self:GetY())) then 
				e.self:CastedSpellFinished(6556, client);
				end
			end
	elseif (e.timer == "check_mark") then
		local now_clients = eq.get_entity_list():GetClientList();
		for client in now_clients.entries do
			if (client.valid and client:FindBuff(5684)) then	
				e.self:SendBeginCast(982, 0);
				e.self:SpellFinished(982, client:CastToMob());	
				eq.debug("cazic touch: " .. client:GetName());
			end
		end
		eq.stop_timer("check_mark");
	elseif (e.timer == "Spawn") then
		eq.zone_emote(15,"General Huffin infests two orc corpses nearby with spider larvae!");
		eq.set_timer("Hatch",20000);
	elseif (e.timer == "Hatch") then
		eq.depop_with_timer(33166);
		eq.depop_with_timer(33171);
		eq.spawn2(33167,0,0,-2403.71,816.01,-3.91,128.5); -- NPC: #a_vicious_spider
		eq.spawn2(33167,0,0,-2403.71,816.01,-3.91,128.5); -- NPC: #a_vicious_spider
		eq.spawn2(33167,0,0,-2403.71,816.01,-3.91,128.5); -- NPC: #a_vicious_spider
		eq.spawn2(33167,0,0,-2403.71,816.01,-3.91,128.5); -- NPC: #a_vicious_spider
		eq.spawn2(33167,0,0,-2403.71,816.01,-3.91,128.5); -- NPC: #a_vicious_spider
		eq.spawn2(33167,0,0,-2402.93,754.38,-3.91,140.3); -- NPC: #a_vicious_spider
		eq.spawn2(33167,0,0,-2402.93,754.38,-3.91,140.3); -- NPC: #a_vicious_spider
		eq.spawn2(33167,0,0,-2402.93,754.38,-3.91,140.3); -- NPC: #a_vicious_spider
		eq.spawn2(33167,0,0,-2402.93,754.38,-3.91,140.3); -- NPC: #a_vicious_spider
		eq.spawn2(33167,0,0,-2402.93,754.38,-3.91,140.3); -- NPC: #a_vicious_spider
		eq.stop_timer("Hatch");
	elseif (e.timer == "Adds") then
		eq.spawn2(33168,0,0,e.self:GetX()+20, e.self:GetY()-10, e.self:GetZ(),e.self:GetHeading()); -- NPC: #A_Scarecrow
		eq.spawn2(33168,0,0,e.self:GetX()-20, e.self:GetY()-10, e.self:GetZ(),e.self:GetHeading()); --  new npc 100khp
		eq.spawn2(33168,0,0,e.self:GetX()+30, e.self:GetY()-10, e.self:GetZ(),e.self:GetHeading()); -- NPC: #A_Scarecrow
		e.self:Shout("Come forth Minions!");
	elseif (e.timer == "Fog") then
		e.self:CastSpell(7316, e.self:GetTarget():GetID()); -- Spell: Venomous Fog
	elseif (e.timer == "Curse") then
		e.self:CastSpell(7313, e.self:GetTarget():GetID()); -- Spell: Spider's Curse
	elseif (e.timer == "Cloud") then
		e.self:CastSpell(7757, e.self:GetTarget():GetID()); -- Spell: Cloud of Viscous Venom
	elseif (e.timer == "Root") then
		e.self:SetPseudoRoot(true);
		eq.stop_timer("Root");
	elseif (e.timer == "Fail") then
		eq.signal(33165,6); -- NPC: Crysta_Tagglefoot
		eq.depop_all(33168);
		eq.depop_all(33167);
		eq.depop_all(33169);
		eq.depop_all(33170);
		eq.depop();
	end
	
end

function Deputy_HP(e)
	if (e.hp_event == 75) then
		e.self:SendIllusionPacket({race=471,gender=0,texture=0});
		eq.zone_emote(13,"General Huffin yells, I'm tired of playing these games!");
		eq.zone_emote(15,"General Huffin shimmers in front of your eyes and enters a seething rage");
		e.self:SetRunning(true);
		e.self:AddToHateList(e.self:GetTarget(),1);	
		e.self:MoveTo(-2375.15,794.00,-2.90,165.8,true);
		eq.set_timer("Root",5000);
		eq.set_timer("Fog",45000);
		e.self:CameraEffect(2000,5);
		e.self:ModifyNPCStat("attack_delay",  tostring(General_Speed2));
		e.self:ModifyNPCStat("min_hit", tostring(Generalnew_min_hit));
		e.self:ModifyNPCStat("max_hit", tostring(Generalnew_max_hit));
		e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 50);
		e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 75);
		eq.spawn2(33169,0,0,e.self:GetX()+20, e.self:GetY()+10, e.self:GetZ(),e.self:GetHeading()); -- NPC: #A_Ghoulish_Guardian
		eq.spawn2(33169,0,0,e.self:GetX()-20, e.self:GetY()-10, e.self:GetZ(),e.self:GetHeading()); -- NPC: #A_Ghoulish_Guardian
		eq.set_timer("Blind",60000);
		eq.set_timer("BlindCast",70000);
		eq.set_next_hp_event(50);
	elseif (e.hp_event == 50) then
		e.self:SendIllusionPacket({race=454,gender=2,texture=4});
		eq.zone_emote(13,"General Huffin yells, If you will not listen, I will MAKE you listen!");
		eq.zone_emote(15,"General Huffin's shimmers in front of your eyes and his weapon seems to swing at you with incredible accuracy!");
		e.self:ModifyNPCStat("attack_delay",  tostring(General_Speed2));
		e.self:ModifyNPCStat("min_hit", tostring(Generalnew_min_hit));
		e.self:ModifyNPCStat("max_hit", tostring(Generalnew_max_hit));
		e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 75);
		e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 100);
		e.self:CameraEffect(2000,5);
		eq.spawn2(33170,0,0,e.self:GetX()+20, e.self:GetY()+10, e.self:GetZ(),e.self:GetHeading()); -- NPC: #A_Ravenous_Werewolf
		eq.spawn2(33170,0,0,e.self:GetX()-20, e.self:GetY()-10, e.self:GetZ(),e.self:GetHeading()); -- NPC: #A_Ravenous_Werewolf
		local now_clients = eq.get_entity_list():GetClientList();
		for client in now_clients.entries do
			if (client.valid and e.self:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) <=1000) then	
				e.self:SendBeginCast(5684, 0);
				e.self:SpellFinished(5684, client:CastToMob());	
				client:Message(15,"You feel the cold grip of death looming over you.");
				eq.debug("mark on: " .. client:GetName());
			end
		end
			eq.set_timer("check_mark",20000);
			eq.stop_timer("Fear");
			eq.set_next_hp_event(25);
	elseif (e.hp_event == 25) then
		eq.stop_timer("Adds");
		eq.set_timer("Curse",15000);
		eq.set_timer("Cloud",60000);
		e.self:CameraEffect(2000,5);
		e.self:SendIllusionPacket({race=461,gender=1,texture=0});
		eq.zone_emote(13,"General Huffin yells, ENOUGH IS ENOUGH. Time to end this show!");
		eq.zone_emote(13,"General Huffin shimmers in front of you and becomes ENRAGED!");
		e.self:SetHP(e.self:GetMaxHP()*0.50)
		eq.set_timer("Spawn",25000);
		e.self:ModifyNPCStat("attack_delay",  tostring(General_Speed));
		e.self:ModifyNPCStat("min_hit", tostring(General3));
		e.self:ModifyNPCStat("max_hit", tostring(General32));
		e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 100);
		e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 100);
		e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 0, 50);
	end
end
	
function Deputy_Death(e)
	e.self:Shout("My reign isnt over!");
	eq.stop_all_timers();
	eq.depop_all(33167);
	eq.signal(33165,4); -- NPC: Crysta_Tagglefoot
end

function Deputy1_Combat(e)
	if (e.joined == true) then
	eq.set_next_hp_event(80);
	elseif (e.joined == false) then
	eq.depop();
	end
end

function Deputy2_Combat(e)
	if (e.joined == true) then
	eq.set_next_hp_event(80);
	elseif (e.joined == false) then
	eq.depop();
	end
end

function Deputy1_Timer(e)
	if (e.timer == "Sugar_Rush") then
	e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 100);
	e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 100);
	e.self:ModifyNPCStat("min_hit", tostring(deputy_min_hit));
	e.self:ModifyNPCStat("max_hit", tostring(deputy_max_hit));
	e.self:ModifyNPCStat("attack_delay",  tostring(General_Speed2));
	eq.zone_emote(15,"Deputy  Kilz goes on a SUGAR RUSH!");
	eq.stop_timer("Sugar_Rush");
	eq.set_timer("End",20000);
	elseif (e.timer == "End") then
	e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 15);
	e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 15);
	e.self:ModifyNPCStat("attack_delay",  tostring(General_old));
	e.self:ModifyNPCStat("min_hit", tostring(deputyold_min_hit));
	e.self:ModifyNPCStat("max_hit", tostring(deputyold_max_hit));
	eq.zone_emote(15,"Deputy Kilz feels sick to his stomach and slows down.");
	eq.stop_timer("End");
	end
end

function Deputy2_Timer(e)
	if (e.timer == "Sugar_Rush") then
	e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 100);
	e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 100);
	e.self:ModifyNPCStat("attack_delay",  tostring(General_Speed2));
	e.self:ModifyNPCStat("min_hit", tostring(deputy_min_hit));
	e.self:ModifyNPCStat("max_hit", tostring(deputy_max_hit));
	eq.zone_emote(15,"Deputy Mackal goes on a SUGAR RUSH!");
	eq.stop_timer("Sugar_Rush");
	eq.set_timer("End2",20000);
	elseif (e.timer == "End2") then
	e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 15);
	e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 15);
	e.self:ModifyNPCStat("attack_delay",  tostring(General_old));
	e.self:ModifyNPCStat("min_hit", tostring(deputyold_min_hit));
	e.self:ModifyNPCStat("max_hit", tostring(deputyold_max_hit));
	eq.zone_emote(15,"Deputy Mackal feels sick to his stomach and slows down.");
	eq.stop_timer("End2");
	end
end
	

function Deputy1_HP(e)
	if (e.hp_event == 80) then
	eq.zone_emote(15,"General Huffin throws a piece of sugary candy towards his comrades!");
	eq.set_timer("Sugar_Rush",1000);
	eq.set_next_hp_event(50);
	elseif (e.hp_event == 50) then
	eq.zone_emote(15,"General Huffin throws a piece of sugary candy towards his comrades!");
	e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 100);
	e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 100);
	eq.set_timer("Sugar_Rush",1000);
	eq.set_next_hp_event(30);
	elseif (e.hp_event == 30) then
	eq.zone_emote(15,"General Huffin throws a piece of sugary candy towards his comrades!");
	e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 100);
	e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 100);
	eq.set_timer("Sugar_Rush",1000);
	end
end

function Deputy2_HP(e)
	if (e.hp_event == 80) then
	eq.zone_emote(15,"General Huffin throws a piece of sugary candy towards his comrades!");
	e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 100);
	e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 100);
	eq.set_timer("Sugar_Rush",1000);
	eq.set_next_hp_event(50);
	elseif (e.hp_event == 50) then
	eq.zone_emote(15,"General Huffin throws a piece of sugary candy towards his comrades!");
	e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 100);
	e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 100);
	eq.set_timer("Sugar_Rush",1000);
	eq.set_next_hp_event(30);
	elseif (e.hp_event == 30) then
	eq.zone_emote(15,"General Huffin throws a piece of sugary candy towards his comrades!");
	e.self:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 100);
	e.self:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 100);
	eq.set_timer("Sugar_Rush",1000);
	end
end

function Deputy1_Death(e)
	local el = eq.get_entity_list();
	if ( el:IsMobSpawnedByNpcTypeID(33163) == true) then
	eq.signal(33161,2); -- NPC: Deputy?
	elseif ( el:IsMobSpawnedByNpcTypeID(33163) == false) then
	deputydeath=true;
	end
end

function Deputy2_Death(e)
	local el = eq.get_entity_list();
	if ( el:IsMobSpawnedByNpcTypeID(33162) == true) then
	eq.signal(33161,3); -- NPC: Deputy?
	elseif ( el:IsMobSpawnedByNpcTypeID(33163) == false) then
	deputydeath=true;
	end
end

function Deputy1_Signal(e)
	if (e.signal == 1) then
		e.self:SetRunning(true);
		e.self:MoveTo(-2370.46,780.32,-4.53,404,true);
	elseif (e.signal == 2) then
		eq.zone_emote(15,"The deputies reveal themselves and attack!");
		e.self:TempName("Deputy_Kilz"); 
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0); 
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
		e.self:AddToHateList(e.self:GetTarget(),1);
	elseif (e.signal == 3) then
		e.self:TempName("Deputy_Kilz"); 
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0); 
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
		e.self:AddToHateList(e.self:GetTarget(),1);
	end
end

function Deputy2_Signal(e)
	if (e.signal == 1) then
		e.self:SetRunning(true);
		e.self:MoveTo(-2400.91,730.19,-4.53,2.5,true);
	elseif (e.signal == 2) then
		e.self:TempName("Deputy_Mackal");
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
		e.self:AddToHateList(e.self:GetTarget(),1);
	elseif (e.signal == 3) then
		e.self:TempName("Deputy_Mackal"); 
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0); 
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0);
		e.self:AddToHateList(e.self:GetTarget(),1);
	end
end



function Deputy1_Spawn(e)
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1); -- Set variables immune agro, agro on, no harm, immune magic.
	e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
end

function Deputy2_Spawn(e)
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1); -- Set variables immune agro, agro on, no harm, immune magic.
	e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
end

	
function Crysta_Spawn(e)
	eq.signal(33161,1); -- NPC: Deputy?
	eq.set_timer("Talk",21000);
	
end

function Crysta_Signal(e)
	if (e.signal == 1) then -- add qglobal so someone outside can't hail and heal. ( to do when testing is done)
	e.self:Shout("Comrades, gather closely and give me a moment to channel the spell, This spell is only good enough for one use! So use it wisely!!");
	eq.set_timer("Heal",10000);
	eq.depop(33161);
	eq.spawn2(33161,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: Deputy?
	elseif (e.signal == 2) then
	eq.zone_emote(15, "Crysta says, Uh your damage is just as pathetic!");
	eq.signal(33161,4); -- NPC: Deputy?
	elseif (e.signal == 3) then
	e.self:Shout("Quickly comrades, pick up the candy before HE gets it!! See if theres something in there that would be useful for weakening him! Return it to me if so.");
	elseif (e.signal == 4) then
	e.self:Shout("It is today!");
	eq.depop(33165);
	elseif (e.signal == 5) then
	e.self:Shout("His damage reduction is weakening. Keep it up!");
	elseif (e.signal == 6) then
	eq.stop_all_timers();
	eq.spawn2(33164,0,0,-2401.77,786.17,-4.53,252.00); -- NPC: Crysta_Tagglefoot
	eq.depop();
	end
end

function Crysta_Say(e)
	if (e.message:findi("hail") and healed == false and phase1 == false) then
		e.self:CastSpell(6495, e.other:GetID()); -- Spell: Spiritual Wake
		healed=true;
		phase1=true;
	end
end

function Crysta_Trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 84090})) then
		e.self:Say("Oh thanks for the candy!! Yum! Wait what am I saying, No! Get back out there and search for something else!");
	elseif (item_lib.check_turn_in(e.trade, {item1 = 26648})) then
		e.self:Say("Oh this outta do the trick!");
		e.self:Emote("pulls out the dagger and pokes the General in the back, stunning him!");
		stunned=stunned+1;
		General_min_hit=General_min_hit+300;
		General_max_hit=General_max_hit+650;
		eq.signal(33161,5); -- NPC: Deputy?
	end
end

function Crysta_Timer(e)
	if (e.timer == "Talk") then
		e.self:Say("Like anyone is going to believe you! Look how many onlookers there are standing behind me. Give me back my goods NOW!");
		eq.set_timer("Next",17000);
		eq.stop_timer("Talk");
	elseif(e.timer == "Next") then
		e.self:Say("No, who are you anyways, going around stealing people's goods. You're rotten I tell you. ROTTEN! You don't belong here!");
		eq.set_timer("Next1",15000);
		eq.stop_timer("Next");
	elseif (e.timer == "Next1") then
		e.self:Say("Oh no, help!");
		eq.stop_timer("Next1");
	elseif (e.timer == "Heal") then
		 e.self:Shout("One person come hail me at any time for a heal, we can gain control of the battle!!");
		 eq.stop_timer("Heal");
	end
end




function event_encounter_load(e)

  eq.register_npc_event('Misty', Event.signal,			 33161, Deputy_Signal);
  eq.register_npc_event('Misty', Event.timer,			 33161,	Deputy_Timer);
  eq.register_npc_event('Misty', Event.hp,				 33161,	Deputy_HP);
  eq.register_npc_event('Misty', Event.combat,			 33161, Deputy_Combat);
  eq.register_npc_event('Misty', Event.death_complete,	 33161, Deputy_Death);
  
  eq.register_npc_event('Misty', Event.signal,			 33162, Deputy1_Signal);
  eq.register_npc_event('Misty', Event.signal,			 33163, Deputy2_Signal);
  
  eq.register_npc_event('Misty', Event.combat,			 33162, Deputy1_Combat);
  eq.register_npc_event('Misty', Event.combat,			 33163, Deputy2_Combat);
  
  eq.register_npc_event('Misty', Event.timer,			 33162, Deputy1_Timer);
  eq.register_npc_event('Misty', Event.timer,			 33163, Deputy2_Timer);

  eq.register_npc_event('Misty', Event.death_complete,	 33162, Deputy1_Death);
  eq.register_npc_event('Misty', Event.death_complete,	 33163, Deputy2_Death);
  
  eq.register_npc_event('Misty', Event.hp,			     33162, Deputy1_HP);
  eq.register_npc_event('Misty', Event.hp,	     		 33163, Deputy2_HP);
  
  eq.register_npc_event('Misty', Event.spawn,			 33161,	Deputy_Spawn);
  
  eq.register_npc_event('Misty', Event.spawn,			 33162, Deputy1_Spawn);
  eq.register_npc_event('Misty', Event.spawn,			 33163, Deputy1_Spawn);
  
  eq.register_npc_event('Misty', Event.spawn,			 33166, Corpse_Spawn);
  eq.register_npc_event('Misty', Event.timer,			 33166, Corpse_Timer);
  
  
  eq.register_npc_event('Misty', Event.spawn,			 33165, Crysta_Spawn);
  eq.register_npc_event('Misty', Event.signal,			 33165, Crysta_Signal);
  eq.register_npc_event('Misty', Event.trade,			 33165, Crysta_Trade);
  
  eq.register_npc_event('Misty', Event.timer,			 33165, Crysta_Timer);
  eq.register_npc_event('Misty', Event.say,				 33165, Crysta_Say);
  
end
