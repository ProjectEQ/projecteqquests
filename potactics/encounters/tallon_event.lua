-- Tallon_Zek Event

local tallon_id		= 214026;
local pp_id			= 218068;
local pp_counter	= 0;

function Tallon_Combat(e)
	if e.joined then 
		eq.set_timer("melee_check", 5 * 1000);	--check to cast Avatar Power knockback
		eq.set_timer("shadowstep",math.random(6,18) * 1000);
		eq.set_timer("aggro_check", 6 * 1000);
		eq.set_timer("face",1 * 1000);
	else
		eq.stop_all_timers();
	end
end

function Tallon_Timer(e)
	if e.timer == "shadowstep" then
		eq.stop_timer(e.timer);
		eq.set_timer("shadowstep",math.random(6,18) * 1000);
		e.self:GMMove(get_safe_loc(e.self:GetX(),-723,-505), get_safe_loc(e.self:GetY(),-2100, -1800), 200, e.self:GetHeading());	-- sets range on where Tallon can shadowstep
		AggroBounce(e);
		e.self:FaceTarget(e.self:GetHateTop());
	elseif e.timer == "melee_check" and eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75)	then	-- added since it did mob AI priority did not use this spell correctly so we have pulled Avatar power from spell list and included in script
		eq.stop_timer(e.timer);
		eq.set_timer("melee_check", 20 * 1000);
		e.self:SpellFinished(808,e.self);	--Avatar Power (PBAOE knockback)		
	elseif e.timer == "aggro_check" then
		local rand = math.random(1,100);
		if rand <= 60 then
			AggroBounce(e);
		end
	elseif e.timer == "face" then
		if e.self:GetHateTop() ~= nil then
			e.self:FaceTarget(e.self:GetHateTop());
		end
	end
end

function Tallon_Death(e)
	eq.spawn2(pp_id,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
end

function AggroBounce(e)
	local target = nil;
	local hate_list = e.self:GetHateList();
	if hate_list ~= nil then
		for mob in hate_list.entries do
			e.self:SetHate(mob.ent,1,1);
			if mob.ent:GetHPRatio() <= 30 and mob.ent:IsClient() then
				target = mob.ent;
			end
		end
	end

	if target ~= nil then	-- find weaker targets to finish if available
		e.self:SetHate(target,500);
		return;
	end

	for n = 1,10 do
		player = eq.get_entity_list():GetRandomClient(e.self:GetX(), e.self:GetY(), e.self:GetZ(),200*200);
		if player.valid and not player:GetGM() then
			e.self:SetHate(player:CastToMob(),500);
			break;
		end
	end
end

function get_safe_loc(current,min_loc,max_loc)
	local leash = 100;  -- 100 units max port distance
	local safe_loc = false;
	while not safe_loc do
		destination = current + math.random(-1 * leash,leash);
		if destination > min_loc and destination < max_loc then
			return destination;
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
	if e.message:findi("hail") and qglobals.pop_tactics_tallon == nil and pp_counter < 72 then
		if tonumber(qglobals.pop_poi_behometh_flag) == 1 then
			e.other:Message(MT.LightGray,"You realize that the image is a projection of Maelin Starpyre's thoughts.  His thoughts enter into your own.  'The pack of notes you now possess from Tallon, bring them to me.  I would like to more closely study them'");
			e.other:Message(MT.Yellow,"You receive a character flag!");
		else
			e.other:Message(MT.LightGray,"The Planar Projection seems to flicker in and out of existence.  It seems to be impressed by the defeat of Tallon Zek.");
			e.other:Message(MT.LightBlue,"You receive a character flag!");
		end
		eq.set_global("pop_tactics_tallon", "1", 5, "F");
		pp_counter = pp_counter + 1;
	end
end

function event_encounter_load(e)
	-- Tallon_Zek
	eq.register_npc_event("tallon_event", Event.combat,			tallon_id,	Tallon_Combat);	-- NPC: Tallon_Zek
	eq.register_npc_event("tallon_event", Event.timer,			tallon_id,	Tallon_Timer);	-- NPC: Tallon_Zek
	eq.register_npc_event("tallon_event", Event.death_complete,	tallon_id,	Tallon_Death);	-- NPC: Tallon_Zek

	-- A_Planar_Projection
	eq.register_npc_event("tallon_event", Event.spawn,			pp_id,		PP_Spawn);		-- NPC: A_Planar_Projection
	eq.register_npc_event("tallon_event", Event.timer,			pp_id,		PP_Timer);		-- NPC: A_Planar_Projection
	eq.register_npc_event("tallon_event", Event.say,			pp_id,		PP_Say);		-- NPC: A_Planar_Projection
end
