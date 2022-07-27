local counter = 0;
local absorbed = 0;

function Trigger_Spawn(e)
eq.spawn_condition("txevu", 0, 1, 1); --enable Vrex_Invoker Spawns
eq.unique_spawn(297072,0,0,-720, 346, -475.8, 266); --restless_wraith
counter = 0;
absorbed = 0;
end

function Trigger_Signal(e)
if (e.signal == 1) then --shades reached last waypoint
counter = counter + 1;
if counter == 5 then
eq.depop(297072); --restless_wraith
eq.unique_spawn(297218,0,0,-720, 346, -475.8, 266); --High_Priest_Nkosi_Bakari
eq.spawn_condition("txevu",0, 1, 0); --disable Vrex_Invoker Spawns
eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"As the final shade lends its voice to the chanting, the prayers reach a crescendo then abruptly fall silent.  A thick mist seeps up from the ground and envelopes the restless wraith.  When the mists fade, an elderly priest stands where the wraith used to be.");
eq.signal(297213,2); --awaken
eq.signal(297214,2); --awaken
eq.signal(297215,2); --awaken
eq.signal(297216,2); --awaken
eq.signal(297217,2); --awaken
end
end
end

--#Vrex_Invoker_Akello (297061)
function Akello_Spawn(e)
eq.depop_all(297062); --cleanup old event
eq.spawn2(297062,0,0,-538,-56,-476,222); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297062,0,0,-548,-64,-477,172); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297062,0,0,-552,-80,-480,128); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297062,0,0,-550,-94,-480,76); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297062,0,0,-537,-104,-478,32); -- NPC: Tiv_Prayer_Chanter
end

function Akello_Death(e)
eq.spawn2(297213,73, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
end

--#Vrex_Invoker_Jahzara (297197)
function Jahzara_Spawn(e)
eq.depop_all(297063); --cleanup old event
eq.spawn2(297063,0,0,-1048,-966,-508,414); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297063,0,0,-1046,-954,-509,350); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297063,0,0,-1056,-954,-509,350); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297063,0,0,-1073,-943,-509,210); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297063,0,0,-1084,-958,-508,134); -- NPC: Tiv_Prayer_Chanter
end

function Jahzara_Death(e)
eq.spawn2(297214,72, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
end

--#Vrex_Invoker_Kashka (297059)
function Kashka_Spawn(e)
eq.depop_all(297064); --cleanup old event
eq.spawn2(297064,0,0,-570,-930,-506,496); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297064,0,0,-553,-919,-506,414); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297064,0,0,-553,-905,-506,368); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297064,0,0,-562,-890,-506,300); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297064,0,0,-574,-886,-503,252); -- NPC: Tiv_Prayer_Chanter
end

function Kashka_Death(e)
eq.spawn2(297215,74, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
end

-- #Vrex_Invoker_Malik (297057)
function Malik_Spawn(e)
eq.depop_all(297065); --cleanup old event
eq.spawn2(297065,0,0,-801,-497,-511,104); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297065,0,0,-790,-511,-515,34); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297065,0,0,-772,-513,-516,490); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297065,0,0,-755,-501,-507,416); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297065,0,0,-754,-484,-511,360); -- NPC: Tiv_Prayer_Chanter
end

function Malik_Death(e)
eq.spawn2(297216,75, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
end

--#Vrex_Invoker_Raziya (297199)
function Raziya_Spawn(e)
eq.depop_all(297066); --cleanup old event
eq.spawn2(297066,0,0,-266,-906,-508,394); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297066,0,0,-267,-893,-513,334); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297066,0,0,-277,-885,-515,274); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297066,0,0,-293,-887,-511,208); -- NPC: Tiv_Prayer_Chanter
eq.spawn2(297066,0,0,-302,-896,-513,162); -- NPC: Tiv_Prayer_Chanter
end

function Raziya_Death(e)
eq.spawn2(297217,76, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
end

--Shade_of_a_Vrex_Invoker (297213) on grid 73
function Shadeone_Spawn(e)
if counter == 5 then
e.self:SetSpecialAbility(25, 0); --turn off immune to aggro
e.self:SetSpecialAbility(24, 0); --turn off anti aggro
e.self:SetSpecialAbility(35, 0); --turn off immunity
end
end

function Shadeone_Signal(e)
if (e.signal == 1) then --getting absorbed
e.self:Say("High Priest, may my everlasting soul provide you with the strength to cleanse this temple!");
e.self:Emote("dissolves into tendrils of ghostly vapor that reach out and replenish the strength of High Priest Nkosi Bakari.");
eq.depop();
elseif (e.signal == 2) then
e.self:SetSpecialAbility(25, 0); --turn off immune to aggro
e.self:SetSpecialAbility(24, 0); --turn off anti aggro
e.self:SetSpecialAbility(35, 0); --turn off immunity
end
end

function Shadeone_Arrive(e)
	if(e.wp == 5) then
		eq.signal(297212,1); -- tell trigger I'm here
e.self:Emote("adds its voice to the chanting.");
end
end

function Shadeone_Combat(e)
if(e.joined) then
eq.set_timer("OOBcheck", 3 * 1000);
eq.set_timer("charm", 15 * 1000);
else
eq.stop_timer("OOBcheck");
eq.stop_timer("charm");
end
end

function Shadeone_Timer(e)
if(e.timer=="OOBcheck") then
    eq.stop_timer("OOBcheck");
	    if (e.self:GetY() < 150) then
		    e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		    e.self:GMMove(-696, 296, -474, 288);
		    e.self:WipeHateList();
	    else
		    eq.set_timer("OOBcheck", 6 * 1000);
  	  end
elseif(e.timer=="charm") then
  eq.stop_timer("charm");
  eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"Deathly hands reach deep within the body of the shade's victim as it draws itself forward and quickly fades from view.  The only sign of its passage is a cold flame flickering in the eyes of its new host.");
  e.self:CastedSpellFinished(891, e.self:GetHateTop());	-- Spell: Spiritual Possession
  eq.set_timer("checkcharm", 5 * 1000);
elseif(e.timer=="checkcharm") then
  eq.stop_timer("checkcharm")
    if e.self:HasPet() then
      eq.set_timer("checkcharm", 5 * 1000);
    else
      eq.spawn2(297213,0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
      eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"Having satiated itself on its previous host, the Shade of a Vrex Invoker reforms looking noticeably stronger.");
      eq.depop();
    end
end
end

--# Shade_of_a_Vrex_Invoker_ (297214) on grid 72
function Shadetwo_Spawn(e)
if counter == 5 then
e.self:SetSpecialAbility(25, 0); --turn off immune to aggro
e.self:SetSpecialAbility(24, 0); --turn off anti aggro
e.self:SetSpecialAbility(35, 0); --turn off immunity
end
end

function Shadetwo_Signal(e)
if (e.signal == 1) then --getting absorbed
e.self:Say("High Priest, may my everlasting soul provide you with the strength to cleanse this temple!");
e.self:Emote("dissolves into tendrils of ghostly vapor that reach out and replenish the strength of High Priest Nkosi Bakari.");
eq.depop();
elseif (e.signal == 2) then
e.self:SetSpecialAbility(25, 0); --turn off immune to aggro
e.self:SetSpecialAbility(24, 0); --turn off anti aggro
e.self:SetSpecialAbility(35, 0); --turn off immunity
end
end

function Shadetwo_Arrive(e)
	if(e.wp == 17) then
		eq.signal(297212,1); -- tell trigger I'm here
e.self:Emote("adds its voice to the chanting.");
end
end

function Shadetwo_Combat(e)
if(e.joined) then
eq.set_timer("OOBcheck", 3 * 1000);
eq.set_timer("charm", 15 * 1000);
else
eq.stop_timer("OOBcheck");
eq.stop_timer("charm");
end
end

function Shadetwo_Timer(e)
if(e.timer=="OOBcheck") then
    eq.stop_timer("OOBcheck");
	    if (e.self:GetY() < 150) then
		    e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		    e.self:GMMove(-705, 317, -474, 280);
		    e.self:WipeHateList();
	    else
		    eq.set_timer("OOBcheck", 6 * 1000);
  	  end
elseif(e.timer=="charm") then
eq.stop_timer("charm");
eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"Deathly hands reach deep within the body of the shade's victim as it draws itself forward and quickly fades from view.  The only sign of its passage is a cold flame flickering in the eyes of its new host.");
e.self:CastedSpellFinished(891, e.self:GetHateTop());	-- Spell: Spiritual Possession
eq.set_timer("checkcharm", 5 * 1000);
elseif(e.timer=="checkcharm") then
eq.stop_timer("checkcharm")
if e.self:HasPet() then
eq.set_timer("checkcharm", 5 * 1000);
else
eq.spawn2(297214,0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"Having satiated itself on its previous host, the Shade of a Vrex Invoker reforms looking noticeably stronger.");
eq.depop();
end
end
end

--Shade_of_a_Vrex_Invoker__ (297215) on grid 74
function Shadethree_Spawn(e)
if counter == 5 then
e.self:SetSpecialAbility(25, 0); --turn off immune to aggro
e.self:SetSpecialAbility(24, 0); --turn off anti aggro
e.self:SetSpecialAbility(35, 0); --turn off immunity
end
end

function Shadethree_Signal(e)
if (e.signal == 1) then --getting absorbed
e.self:Say("High Priest, may my everlasting soul provide you with the strength to cleanse this temple!");
e.self:Emote("dissolves into tendrils of ghostly vapor that reach out and replenish the strength of High Priest Nkosi Bakari.");
eq.depop();
elseif (e.signal == 2) then
e.self:SetSpecialAbility(25, 0); --turn off immune to aggro
e.self:SetSpecialAbility(24, 0); --turn off anti aggro
e.self:SetSpecialAbility(35, 0); --turn off immunity
end
end

function Shadethree_Arrive(e)
	if(e.wp == 12) then
		eq.signal(297212,1); -- tell trigger I'm here
e.self:Emote("adds its voice to the chanting.");
end
end

function Shadethree_Combat(e)
if(e.joined) then
eq.set_timer("OOBcheck", 3 * 1000);
eq.set_timer("charm", 15 * 1000);
else
eq.stop_timer("OOBcheck");
eq.stop_timer("charm");
end
end

function Shadethree_Timer(e)
if(e.timer=="OOBcheck") then
    eq.stop_timer("OOBcheck");
	    if (e.self:GetY() < 150) then
		    e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		    e.self:GMMove(-753, 325, -474, 244);
		    e.self:WipeHateList();
	    else
		    eq.set_timer("OOBcheck", 6 * 1000);
  	  end
elseif(e.timer=="charm") then
eq.stop_timer("charm");
eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"Deathly hands reach deep within the body of the shade's victim as it draws itself forward and quickly fades from view.  The only sign of its passage is a cold flame flickering in the eyes of its new host.");
e.self:CastedSpellFinished(891, e.self:GetHateTop());	-- Spell: Spiritual Possession
eq.set_timer("checkcharm", 5 * 1000);
elseif(e.timer=="checkcharm") then
eq.stop_timer("checkcharm")
if e.self:HasPet() then
eq.set_timer("checkcharm", 5 * 1000);
else
eq.spawn2(297215,0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"Having satiated itself on its previous host, the Shade of a Vrex Invoker reforms looking noticeably stronger.");
eq.depop();
end
end
end

--Shade_of_a_Vrex_Invoker___ (297216) on grid 75
function Shadefour_Spawn(e)
if counter == 5 then
e.self:SetSpecialAbility(25, 0); --turn off immune to aggro
e.self:SetSpecialAbility(24, 0); --turn off anti aggro
e.self:SetSpecialAbility(35, 0); --turn off immunity
end
end

function Shadefour_Signal(e)
if (e.signal == 1) then --getting absorbed
e.self:Say("High Priest, may my everlasting soul provide you with the strength to cleanse this temple!");
e.self:Emote("dissolves into tendrils of ghostly vapor that reach out and replenish the strength of High Priest Nkosi Bakari.");
eq.depop();
elseif (e.signal == 2) then
e.self:SetSpecialAbility(25, 0); --turn off immune to aggro
e.self:SetSpecialAbility(24, 0); --turn off anti aggro
e.self:SetSpecialAbility(35, 0); --turn off immunity
end
end

function Shadefour_Arrive(e)
	if(e.wp == 10) then
		eq.signal(297212,1); -- tell trigger I'm here
e.self:Emote("adds its voice to the chanting.");
end
end

function Shadefour_Combat(e)
if(e.joined) then
eq.set_timer("OOBcheck", 3 * 1000);
eq.set_timer("charm", 15 * 1000);
else
eq.stop_timer("OOBcheck");
eq.stop_timer("charm");
end
end

function Shadefour_Timer(e)
if(e.timer=="OOBcheck") then
    eq.stop_timer("OOBcheck");
	    if (e.self:GetY() < 150) then
		    e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		    e.self:GMMove(-782, 339, -474, 230);
		    e.self:WipeHateList();
	    else
		    eq.set_timer("OOBcheck", 6 * 1000);
  	  end
elseif(e.timer=="charm") then
eq.stop_timer("charm");
eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"Deathly hands reach deep within the body of the shade's victim as it draws itself forward and quickly fades from view.  The only sign of its passage is a cold flame flickering in the eyes of its new host.");
e.self:CastedSpellFinished(891, e.self:GetHateTop());	-- Spell: Spiritual Possession
eq.set_timer("checkcharm", 5 * 1000);
elseif(e.timer=="checkcharm") then
eq.stop_timer("checkcharm")
if e.self:HasPet() then
eq.set_timer("checkcharm", 5 * 1000);
else
eq.spawn2(297216,0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"Having satiated itself on its previous host, the Shade of a Vrex Invoker reforms looking noticeably stronger.");
eq.depop();
end
end
end
--Shade_of_a_Vrex_Invoker____ (297217) on grid 76
function Shadefive_Spawn(e)
if counter == 5 then
e.self:SetSpecialAbility(25, 0); --turn off immune to aggro
e.self:SetSpecialAbility(24, 0); --turn off anti aggro
e.self:SetSpecialAbility(35, 0); --turn off immunity
end
end

function Shadefive_Signal(e)
if (e.signal == 1) then --getting absorbed
e.self:Say("High Priest, may my everlasting soul provide you with the strength to cleanse this temple!");
e.self:Emote("dissolves into tendrils of ghostly vapor that reach out and replenish the strength of High Priest Nkosi Bakari.");
eq.depop();
elseif (e.signal == 2) then
e.self:SetSpecialAbility(25, 0); --turn off immune to aggro
e.self:SetSpecialAbility(24, 0); --turn off anti aggro
e.self:SetSpecialAbility(35, 0); --turn off immunity
end
end

function Shadefive_Arrive(e)
	if(e.wp == 11) then
		eq.signal(297212,1); -- tell trigger I'm here
e.self:Emote("adds its voice to the chanting.");
end
end

function Shadefive_Combat(e)
if(e.joined) then
eq.set_timer("OOBcheck", 3 * 1000);
eq.set_timer("charm", 15 * 1000);
else
eq.stop_timer("OOBcheck");
eq.stop_timer("charm");
end
end

function Shadefive_Timer(e)
if(e.timer=="OOBcheck") then
    eq.stop_timer("OOBcheck");
	    if (e.self:GetY() < 150) then
		    e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		    e.self:GMMove(-778, 303, -474, 214);
		    e.self:WipeHateList();
	    else
		    eq.set_timer("OOBcheck", 6 * 1000);
  	  end
elseif(e.timer=="charm") then
eq.stop_timer("charm");
eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"Deathly hands reach deep within the body of the shade's victim as it draws itself forward and quickly fades from view.  The only sign of its passage is a cold flame flickering in the eyes of its new host.");
e.self:CastedSpellFinished(891, e.self:GetHateTop());	-- Spell: Spiritual Possession
eq.set_timer("checkcharm", 5 * 1000);
elseif(e.timer=="checkcharm") then
eq.stop_timer("checkcharm")
if e.self:HasPet() then
eq.set_timer("checkcharm", 5 * 1000);
else
eq.spawn2(297217,0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"Having satiated itself on its previous host, the Shade of a Vrex Invoker reforms looking noticeably stronger.");
eq.depop();
end
end
end

function HP_Combat(e)
if(e.joined) then
eq.set_timer("OOBcheck", 3 * 1000);
else
eq.stop_timer("OOBcheck");
end
end

function HP_Timer(e)
if(e.timer=="OOBcheck") then
    eq.stop_timer("OOBcheck");
	    if (e.self:GetY() < 150) then
		    e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		    e.self:GotoBind();
		    e.self:WipeHateList();
	    else
		    eq.set_timer("OOBcheck", 6 * 1000);
  	  end
end
end

function HP_Spawn(e)
e.self:Say("My brothers and sisters, I have heard your calls and I have come.  If what you say is true, our children have turned their backs upon Trushar and in doing so have invited evil upon our land.  We must cleanse this place and restore belief to our people!");
eq.set_next_hp_event(50);
end

function HP_Health(e)
if(e.hp_event == 50) then
	if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297213) == true) then
		eq.signal(297213,1,10); --absorb first add
		e.self:SetHP(e.self:GetMaxHP())
		eq.set_next_hp_event(50);
		eq.debug("absorb first add");
	end
	if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297213) == false) then
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297214) == true) then
			eq.signal(297214,1,10); --absorb second add
			e.self:SetHP(e.self:GetMaxHP())
			eq.set_next_hp_event(50);
			eq.debug("absorb second add");
		end
	end
	if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297213) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(297214) == false) then
		
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297215) == true) then
			eq.signal(297215,1,10); --absorb third add
			e.self:SetHP(e.self:GetMaxHP())
			eq.set_next_hp_event(50);
			eq.debug("absorb third add");
		end
	end
		
	if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297213) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(297214) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(297215) == false) then
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297216) == true) then
			eq.signal(297216,1,10); --absorb fourth add
			e.self:SetHP(e.self:GetMaxHP())
			eq.set_next_hp_event(50);
			eq.debug("absorb fourth add");
		end
	end
	
	if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297213) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(297214) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(297215) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(297216) == false) then
				
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297217) == true) then
			eq.signal(297217,1,10); --absorb fifth add
			e.self:SetHP(e.self:GetMaxHP())
			eq.set_next_hp_event(50);
			eq.debug("absorb fifth add");
		end
	end
	
end
end

function HP_Signal(e)
absorbed = absorbed + 1; --from the death of a shade
end


function HP_Death(e)
eq.depop_with_timer(297212); --depop trigger
end


function event_encounter_load(e)
eq.register_npc_event("highpriest", Event.spawn, 297218, HP_Spawn)
    eq.register_npc_event("highpriest", Event.death_complete, 297218, HP_Death)
    eq.register_npc_event("highpriest", Event.timer, 297218, HP_Timer)
    eq.register_npc_event("highpriest", Event.combat, 297218, HP_Combat)
    eq.register_npc_event("highpriest", Event.signal, 297218, HP_Signal)
    eq.register_npc_event("highpriest", Event.hp, 297218, HP_Health)

    eq.register_npc_event("highpriest", Event.combat, 297217, Shadefive_Combat)
    eq.register_npc_event("highpriest", Event.signal, 297217, Shadefive_Signal)
    eq.register_npc_event("highpriest", Event.spawn, 297217, Shadefive_Spawn)
    eq.register_npc_event("highpriest", Event.timer, 297217, Shadefive_Timer)
    eq.register_npc_event("highpriest", Event.waypoint_arrive, 297217, Shadefive_Arrive)

eq.register_npc_event("highpriest", Event.combat, 297216, Shadefour_Combat)
    eq.register_npc_event("highpriest", Event.signal, 297216, Shadefour_Signal)
    eq.register_npc_event("highpriest", Event.spawn, 297216, Shadefour_Spawn)
    eq.register_npc_event("highpriest", Event.timer, 297216, Shadefour_Timer)
    eq.register_npc_event("highpriest", Event.waypoint_arrive, 297216, Shadefour_Arrive)

eq.register_npc_event("highpriest", Event.combat, 297215, Shadethree_Combat)
    eq.register_npc_event("highpriest", Event.signal, 297215, Shadethree_Signal)
    eq.register_npc_event("highpriest", Event.spawn, 297215, Shadethree_Spawn)
    eq.register_npc_event("highpriest", Event.timer, 297215, Shadethree_Timer)
    eq.register_npc_event("highpriest", Event.waypoint_arrive, 297215, Shadethree_Arrive)

eq.register_npc_event("highpriest", Event.combat, 297214, Shadetwo_Combat)
    eq.register_npc_event("highpriest", Event.signal, 297214, Shadetwo_Signal)
    eq.register_npc_event("highpriest", Event.spawn, 297214, Shadetwo_Spawn)
    eq.register_npc_event("highpriest", Event.timer, 297214, Shadetwo_Timer)
    eq.register_npc_event("highpriest", Event.waypoint_arrive, 297214, Shadetwo_Arrive)

eq.register_npc_event("highpriest", Event.combat, 297213, Shadeone_Combat)
    eq.register_npc_event("highpriest", Event.signal, 297213, Shadeone_Signal)
    eq.register_npc_event("highpriest", Event.spawn, 297213, Shadeone_Spawn)
    eq.register_npc_event("highpriest", Event.timer, 297213, Shadeone_Timer)
    eq.register_npc_event("highpriest", Event.waypoint_arrive, 297213, Shadeone_Arrive)

    eq.register_npc_event("highpriest", Event.signal, 297212, Trigger_Signal)
    eq.register_npc_event("highpriest", Event.spawn, 297212, Trigger_Spawn)

eq.register_npc_event("highpriest", Event.spawn, 297199, Raziya_Spawn)
    eq.register_npc_event("highpriest", Event.death_complete, 297199, Raziya_Death)

eq.register_npc_event("highpriest", Event.spawn, 297061, Akello_Spawn)
    eq.register_npc_event("highpriest", Event.death_complete, 297061, Akello_Death)

eq.register_npc_event("highpriest", Event.spawn, 297197, Jahzara_Spawn)
    eq.register_npc_event("highpriest", Event.death_complete, 297197, Jahzara_Death)

eq.register_npc_event("highpriest", Event.spawn, 297059, Kashka_Spawn)
    eq.register_npc_event("highpriest", Event.death_complete, 297059, Kashka_Death)

eq.register_npc_event("highpriest", Event.spawn, 297057, Malik_Spawn)
    eq.register_npc_event("highpriest", Event.death_complete, 297057, Malik_Death)


end
