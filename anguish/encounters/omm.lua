--[[
Overlord_Mata_Muram (317109)
Coerced_Lieutenant  (317114)
Frenzied_Lasher (317117)

at 30% walk back to spawn
set model to wings over head
before banish set regen to 0

shake room at 80
Roaring laughter fills the room, 'Is this what you've come here to show me?  You hope to defeat an ancient warrior with this miserable display of force?

e.self:SetAppearance(0); --stand up
e.self:SetAppearance(1); --sit?
--]]
local event_started =0;
local banished_raid=0;
local reset_countdown=0;

function OMM_Spawn(e)
	e.self:SetAppearance(1); --sitting
	e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
	e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);	
end

function OMM_Say(e)
  if event_started==0 then
	if(e.message:findi("hail")) then
		e.self:Say("So. You are the mighty god killers. I am not surprised you managed to make it this far. I did expect there to be more of you, do you really think so little of me? I have destroyed [" .. eq.say_link("worlds") .. "] where animals roam with power that would cause your gods to tremble.");
	elseif(e.message:findi("worlds")) then
		e.self:Say("You would have made fine additions to my army, were you not so willful. Prepare yourself for power beyond your greatest nightmares.");
		event_started=1;
		eq.spawn2(317114,0,0, 297, 4347, 209.9, 64);
		eq.spawn2(317114,0,0, 297, 4347, 209.9, 64);
		eq.set_next_hp_event(80);
		eq.set_timer("check_event",1*1000);
		eq.set_timer("balance",60*1000);
	end
  end
end

function OMM_HP(e)
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

function OMM_Combat(e)
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

function OMM_Timer(e)
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
		eq.set_next_hp_event(80);
		eq.depop_all(317110);
		eq.depop_all(317110);
		eq.spawn2(317109,0,0,381, 4843, 277.5, 30)
		eq.depop();
    end
end

function OMM_Death(e)
	eq.zone_emote(13,"The walls of Anguish tremble, you can feel the world shaking your bones. For a brief moment you think you see a smile flash across Mata Muram's face, and as the last breath escapes his lungs you hear a faint voice, 'There are worlds other than these...");
	e.self:CameraEffect(1000,8);	
	eq.signal(317116 , 317109);
end

function OMM_Signal(e)
	--start reset timer on first click up after raid is banished 
	if (e.signal==1 and reset_countdown==0 and banished_raid==0) then
		eq.set_timer("reset_event",30*1000);
		reset_countdown=1;
	end
end

function event_encounter_load(e)
	eq.register_npc_event('omm', Event.say,         	317109, OMM_Say);
	eq.register_npc_event('omm', Event.spawn,         	317109, OMM_Spawn); 
	eq.register_npc_event('omm', Event.combat,        	317109, OMM_Combat); 
	eq.register_npc_event('omm', Event.timer,         	317109, OMM_Timer);
	eq.register_npc_event('amv', Event.hp,         		317109, OMM_HP);
	eq.register_npc_event('omm', Event.death_complete,	317109, OMM_Death);
	eq.register_npc_event('omm', Event.signal,			317109, OMM_Signal);	    
end

function event_encounter_unload(e)
end