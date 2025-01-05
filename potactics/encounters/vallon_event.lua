-- Vallon Zek Event

local vallon_id 		= 214083;
local fake_vallon_id	= 214110;
local vz_controller_id	= 214112;
local pp_id				= 202368;
local vz_counter		= 0;
local pp_counter		= 0;
local started			= false;
local final_round		= false;

function Vallon_Spawn(e)
	final_round = false;
	eq.signal(vz_controller_id, 1, 1 * 1000);	-- NPC: #vz_controller (214112)
	if e.self:GetSpawnPointID() == 369024 then
		e.self:SetLevel(75);
	end
end

function Vallon_Combat(e)
	if e.joined then
		eq.set_next_hp_event(61);
	end
end

function Vallon_HP(e)
	if e.hp_event == 61 and not final_round then
		eq.signal(vz_controller_id,10);	-- NPC: #vz_controller (214112)
		e.self:Emote("fades into the shadows as five figures take shape around you.");
		eq.depop_with_timer();
	end
end

function Vallon_Signal(e)	-- send signal to controller to get event stage
	if e.signal == 1 then	-- returned signal that event not yet at final phase
		final_round = false;
	elseif e.signal == 2 then	-- returned signal for final phase
		final_round = true;
	end
	eq.set_timer("reset", 20 * 60 * 1000);
end

function Vallon_Timer(e)
	if e.timer == "reset" then
		if not e.self:IsEngaged() then
			eq.signal(vz_controller_id,99);	-- signal #vz_controller to reset
			eq.get_entity_list():GetSpawnByID(369024):Repop(5);
			eq.depop_all(fake_vallon_id); -- depop fake VZs
			eq.depop();
		else
			eq.stop_timer(e.timer);
			eq.set_timer("reset", 30 * 1000);	-- check every 30 seconds to see if disengaged
		end
	end
end

function Vallon_Death(e)
	eq.spawn2(pp_id,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());	-- NPC: A_Planar_Projection (202368)
	eq.signal(vz_controller_id,99);															-- signal #vz_controller to reset
end

function vz_controller_spawn(e)
	vz_counter = 0;
	started = false;
end

function vz_controller_Signal(e)	-- send signal to controller to get event stage
	if e.signal == 1 then			-- returned signal that event not yet at final phase
		if vz_counter < 5 and started then
			eq.signal(vallon_id,1);	-- Vallon_Zek (214083)
		elseif vz_counter == 5 and started then
			eq.signal(vallon_id,2);	-- final phase
			vz_counter = 0;
		end
	elseif e.signal == 10 then		-- signals real VZ phase killed
		if not started then
			started = true;
		end
		vz_counter = vz_counter + 1;
		spawn_wave(e)
	elseif e.signal == 99 then		-- reset event
		started = false;
		vz_counter = 0;
	end
end

function spawn_wave(e)
	local rng = math.random(1, 5); -- so the real one isn't always named 'Vallon_Zek000'

	for i = 1, 5 do
		if i == rng then
			eq.spawn2(vallon_id,0,0,-640 + math.random(-50,50),1980 + math.random(-50,50),230,128);			-- NPC: Vallon_Zek_ (214083) -- REAL
		else
			eq.spawn2(fake_vallon_id,0,0,-640 + math.random(-50,50),1980 + math.random(-50,50),230,128);	-- NPC: Vallon_Zek_ (214110) -- FAKE
		end
	end
end

function PP_Spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000) -- 10 min depop
	pp_counter = 0;
end

function PP_Timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function PP_Say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if e.message:findi("hail") and  qglobals.pop_tactics_vallon == nil and pp_counter < 72 then
		if tonumber(qglobals.pop_poi_behometh_flag) == 1 then
			e.other:Message(MT.LightGray,"You realize that the image is a projection of Maelin Starpyre's thoughts.  His thoughts enter into your own.  'The pack of notes you now possess from Vallon, bring them to me.  I would like to more closely study them'");
			e.other:Message(MT.Yellow,"You receive a character flag!");
		else
			e.other:Message(MT.LightGray,"The Planar Projection seems to flicker in and out of existence. It seems to be impressed and grateful for the death of Vallon Zek.");
			e.other:Message(MT.LightBlue,"You receive a character flag!");
		end
		eq.set_global("pop_tactics_vallon", "1", 5, "F");
		pp_counter = pp_counter + 1;
	end
end

function event_encounter_load(e)
	-- Vallon_Zek
	eq.register_npc_event("vallon_event", Event.spawn,			vallon_id,			Vallon_Spawn);			-- NPC: Vallon_Zek
	eq.register_npc_event("vallon_event", Event.combat,			vallon_id,			Vallon_Combat);			-- NPC: Vallon_Zek
	eq.register_npc_event("vallon_event", Event.hp,				vallon_id,			Vallon_HP);				-- NPC: Vallon_Zek
	eq.register_npc_event("vallon_event", Event.timer,			vallon_id,			Vallon_Timer);			-- NPC: Vallon_Zek
	eq.register_npc_event("vallon_event", Event.signal,			vallon_id,			Vallon_Signal);			-- NPC: Vallon_Zek
	eq.register_npc_event("vallon_event", Event.death_complete,	vallon_id,			Vallon_Death);			-- NPC: Vallon_Zek

	-- VZ Controller
	eq.register_npc_event("vallon_event", Event.spawn,			vz_controller_id,	vz_controller_spawn);	-- NPC: Vallon_Zek
	eq.register_npc_event("vallon_event", Event.signal,			vz_controller_id,	vz_controller_Signal);	-- NPC: Vallon_Zek

	-- A_Planar_Projection
	eq.register_npc_event("vallon_event", Event.spawn,			pp_id,				PP_Spawn);				-- NPC: A_Planar_Projection
	eq.register_npc_event("vallon_event", Event.timer,			pp_id,				PP_Timer);				-- NPC: A_Planar_Projection
	eq.register_npc_event("vallon_event", Event.say,			pp_id,				PP_Say);				-- NPC: A_Planar_Projection
end
