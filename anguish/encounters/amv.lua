--[[
Arch_Magus_Vangl (317107)
Vangl`s_Focus (317108)
a_languished_convert (317110)

convert spawn on random side (where coerced leut do?)

a languished convert spawns throughout event. Seems like they get powered up by something during event (saw hit up to 8912 with 35 shielding)
Wasn't able to kill Vangl's Focus, and it Cazic Touches anyone who goes near it
-Vangl's Focus casts <Crushing Presence> every 15 seconds
-1 add spawns every 70 seconds
-DT from AMV every 60 seconds on everyone within 1000 feet

Gaze of Anguish 5680 70s
Touch of Anguish 5679 70s
Mark of Death 5684 75s assuming this hits only 10 people like OMM

--feedback dispersion cast once at 11 %hp
--shake zone at 11%
[Thu Mar 23 19:29:35 2017] Arch Magus Vangl begins to cast a spell. <Feedback Dispersion>
[Thu Mar 23 19:29:35 2017] You resist the Feedback Dispersion spell!


yellow zonewide? : The power of the focus energizes the Arch Magus.
this happens alternating 30s/40s

--]]
local convert_min_hit=278;
local convert_max_hit=1855;

function AMV_Spawn(e)
	eq.unique_spawn(317108,0,0, 617,5080,278,248); --Vangl`s_Focus (317108)
	eq.set_next_hp_event(75);
end

function AMV_HP(e)
    if (e.hp_event == 75) then
        eq.zone_emote(13, "A voice echoes from behind the shield, 'Vangl, you are my mightiest guardian, yet you allow these insects to remain in my presence?  Destroy them now or I will rend the flesh from your worthless frame!");
        eq.set_next_hp_event(50);
		e.self:CameraEffect(1000,2);
	elseif (e.hp_event == 50) then
        eq.zone_emote(13, "The deafening voice shakes the room again, 'You expect to defeat me?  I have lived longer than you can begin to comprehend.  I walked the realms before your pitiful gods were spawned.  I flew the skies in a time before your world's creation and I shall enslave new worlds long after you and your gods are forgotten.  You fight only to die.  I   AM   ETERNAL!");
        eq.set_next_hp_event(10);
		e.self:CameraEffect(1000,2);
	elseif (e.hp_event == 10) then
		eq.zone_emote(13, "The voice echoes from behind the shield, 'Vangl, do not think that you can escape me in death.  After I destroy the infiltrators I will find where you are to spend eternity.  Death does not end your obligation to me, wretched thrall!");
		e.self:CastSpell(5681, e.self:GetTarget():GetID()); --feedback dispersion
		e.self:CameraEffect(1000,2);
	end		
end

function AMV_Combat(e)
	if (e.joined == true) then
		eq.set_timer("add", 70 * 1000);	
		eq.set_timer("touch", math.random(10,35) * 1000);
		eq.set_timer("gaze", math.random(35,70) * 1000);
		eq.set_timer("mark", math.random(55,75) * 1000);
		eq.set_timer("focus30", math.random(15,30) * 1000);
		eq.stop_timer("reset");
	else
		eq.set_timer("reset", 60 * 1000);
		eq.stop_timer("add");
		eq.stop_timer("touch");
		eq.stop_timer("gaze");
		eq.stop_timer("mark");
	end
end

function AMV_Timer(e)
	if (e.timer == "check_hp") then
	elseif (e.timer == "touch") then
		e.self:CastSpell(5679, e.self:GetTarget():GetID());
		eq.set_timer("touch",70*1000); 
	elseif (e.timer == "gaze") then
		e.self:CastSpell(5680, e.self:GetTarget():GetID());
		eq.set_timer("gaze",70*1000); 
	elseif (e.timer == "mark") then				
		--cast on 10 people
		local num_hit=0;
		local client_list = {};
		while( num_hit < 10 )
		do
			local client = eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),1000);
			if client.valid and has_value(client_list,client:GetID()) then	
				e.self:CastSpell(5678, client:GetID());
				client_list[num_hit]=client:GetID();
				num_hit=num_hit+1;
			end
		end
		eq.set_timer("mark",75*1000);
	elseif (e.timer == "adds") then
		if(math.random(2) == 1) then
			eq.spawn2(317110,0,0,625, 4847, 277.5, 225):AddToHateList(e.self:GetHateRandom(),1);
		else
			eq.spawn2(317110,0,0,381, 4843, 277.5, 30):AddToHateList(e.self:GetHateRandom(),1);
		end
	elseif (e.timer == "focus30") then
		eq.stop_timer("focus30");
		eq.set_timer("focus40",40*1000);
		eq.zone_emote(15, "The power of the focus energizes the Arch Magus.");
	elseif (e.timer == "focus40") then
		eq.stop_timer("focus40");
		eq.set_timer("focus30",30*1000);
		eq.zone_emote(15, "The power of the focus energizes the Arch Magus.");
	elseif (e.timer == "reset") then
		eq.set_next_hp_event(75);
		eq.depop_all(317110);
		e.self:SetHP(100);
		convert_min_hit=278;
		convert_max_hit=1855;
    end
end

function AMV_Death(e)
	--check if OMM is up and there are no preexisting AMV lockouts in raid -> spawn chest
	eq.unique_spawn(317112,0,0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); --Ornate_Chest (317112)
	eq.zone_emote(13,"As the Arch Magus' corpse falls to the ground, you feel the magical aura filling the room collapse, and hear a deep gutteral laugh growing louder.");
	e.self:CameraEffect(12000,8);
	eq.depop_all(317108);
	
	eq.signal(317116 , 317107);
end

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function Convert_Spawn(e)
	eq.set_timer("grow_stronger",1*1000);  
end

function Convert_Timer(e)
	if (e.timer == "grow_stronger") then
		convert_min_hit=math.ceil(convert_max_hit*1.04);
		convert_max_hit=math.ceil(cconvert_max_hit*1.04); 
		e.self:ModifyNPCStat("max_hit", tostring(convert_min_hit));
		e.self:ModifyNPCStat("min_hit", tostring(convert_max_hit));
	end
end

function Focus_Spawn(e)
	eq.set_timer("crushing",15*1000);  
end

function Focus_Combat(e)
	if (e.joined == true) then
		e.self:CastSpell(982, e.self:GetTarget():GetID()); --cazic touch
		eq.set_timer("dt",1*1000); 
	else
		eq.stop_timer("dt");
	end  
end

function Focus_Timer(e)
	if (e.timer == "dt") then
		e.self:CastSpell(982, e.self:GetHateRandom():GetID()); --Cazic Touch
	elseif(e.timer == "crushing") then 
		e.self:CastSpell(5683, e.self:GetTarget():GetID()); --Crushing Presence
	end
end

function event_encounter_load(e)
	eq.register_npc_event('amv', Event.spawn,         	317107, AMV_Spawn); 
	eq.register_npc_event('amv', Event.combat,        	317107, AMV_Combat); 
	eq.register_npc_event('amv', Event.timer,         	317107, AMV_Timer);
	eq.register_npc_event('amv', Event.death_complete,	317107, AMV_Death);
	eq.register_npc_event('amv', Event.spawn, 			317108, Focus_Spawn); 
	eq.register_npc_event('amv', Event.combat, 			317108, Focus_Combat);  
	eq.register_npc_event('amv', Event.timer, 			317108, Focus_Timer);
	eq.register_npc_event('amv', Event.spawn, 			317015, Convert_Spawn);
	eq.register_npc_event('amv', Event.timer, 			317110, Convert_Timer);    
end

function event_encounter_unload(e)
end

