--execution Event rewrite by Huffin
--a_kyv_bloodhunter (281139) Wave1
--a_kyv_bloodhunter (281140) Wave2
--a_kyv_bloodhunter (281141) Wave3
--a_mastruq_spiritbrute (281142) Wave1
--a_mastruq_spiritbrute (281143) Wave2
--a_mastruq_spiritbrute (281144) Wave3
--#Executioner_Hexxt_Xocik (281119)
--#Kreshin_Silentcog (281124) 
--Pixtt_Tixxrt_Kvrok (281123)Wave4
--Trixxrt`s_Guardsman (281117)Wave4

local event_flag   = 0;
local trial_group_id = 0;
local client_id      = 0; -- character ID, not entity ID
local event_success   = 0;
local trial_x           = -480;
local trial_y           = -1789;
local trial_z           = 78;

function Trigger_Spawn(e)
	eq.set_timer("delay",2000);
end

function Trigger_Signal(e)
	if (e.signal == 1) then
    	eq.stop_timer("failtimer");
    
    	eq.set_timer("ejectemote", 425 * 1000); --425 sec after win, let people know that event is about to port them out
	end
end

function Trigger_Timer(e)
if (e.timer == "delay") then
	eq.stop_timer("delay");
	eq.set_proximity(e.self:GetX()-35, e.self:GetX()+35, e.self:GetY()-35, e.self:GetY()+35, -999999, 999999, true);
	eq.enable_proximity_say();
elseif (e.timer == "ejecttimer") then
		eq.stop_timer("ejecttimer");
    
		eq.depop_all(281139);
		eq.depop_all(281140);
		eq.depop_all(281141);
		eq.depop_all(281142);
		eq.depop_all(281143);
		eq.depop_all(281144);
		eq.depop_all(281119);
		eq.depop_all(281117);
		eq.depop_all(281123);
		eq.depop_all(281124);
    
    		

       		local trial_group = eq.get_entity_list():GetGroupByID(trial_group_id);
			if (trial_group ~= nil and trial_group.valid) then
				MoveGroup( trial_group, trial_x, trial_y, trial_z, 250, -1515, -289, -14, 60, "A mysterious force translocates you."); 
			else
            		local client_e = eq.get_entity_list():GetClientByCharID(client_id);
            		if (client_e ~= nil and client_e.valid) then
						if (client_e:CalculateDistance(trial_x, trial_y, trial_z) <= 180) then
                		client_e:MovePC( 281, -1515, -289, -14, 60 ); -- Zone: qinimi
                		client_e:Message(3, "A mysterious force translocates you.");
						end
            		end
			end
		
		event_flag   = 0;
    	client_id      = 0;
    	trial_group_id = 0;
elseif (e.timer == "startevent") then
		eq.stop_timer("startevent");
    eq.unique_spawn(281123,0,0,-490,-1944,90,1); -- Pixtt_Tixxrt_Kvrok
    eq.unique_spawn(281119,0,0,-538,-1964,78,1); -- #Executioner_Hexxt_Xocik (281119)
    eq.unique_spawn(281124,0,0,-421,-1916,90,385); -- #Kreshin_Silentcog (281124)
    eq.spawn2(281142,0,0,-408,-1859,78,381); -- a_mastruq_spiritbrute (281142) Wave1
    eq.spawn2(281142,0,0,-572,-1859,78,129); -- a_mastruq_spiritbrute (281142) Wave1
    eq.unique_spawn(281139,0,0,-465,-1965,86,1); -- a_kyv_bloodhunter (281139) Wave1
    
    eq.spawn2(281143,0,0,-462,-1897,78,252); -- a_mastruq_spiritbrute (281143) Wave2
    eq.spawn2(281143,0,0,-516,-1897,78,252); -- a_mastruq_spiritbrute (281143) Wave2
    eq.unique_spawn(281140,0,0,-516,-1965,86,1); -- a_kyv_bloodhunter (281140) Wave2
    
    eq.unique_spawn(281144,0,0,-403,-1918,86,387); -- a_mastruq_spiritbrute (281144) Wave3
    eq.spawn2(281141,0,0,-574,-1969,78,68); -- a_kyv_bloodhunter (281141) Wave3
    eq.spawn2(281141,0,0,-406,-1969,78,450); -- a_kyv_bloodhunter (281141) Wave3
    eq.set_timer("wave1", 10 * 1000); --10 sec before 1st wave activates
elseif (e.timer == "wave1") then
	eq.stop_timer("wave1");
    eq.signal(281139,1); -- signal first wave NPCs to go active
    eq.signal(281142,1); -- signal first wave NPCs to go active
    eq.set_timer("wave2", 120 * 1000); --2 min in between waves
elseif (e.timer == "wave2") then
	eq.stop_timer("wave2");
    eq.signal(281140,1); -- signal second wave NPCs to go active
    eq.signal(281143,1); -- signal second wave NPCs to go active
    eq.set_timer("wave3", 120 * 1000); --2 min in between waves
elseif (e.timer == "wave3") then
	eq.stop_timer("wave3");
    eq.signal(281141,1); -- signal third wave NPCs to go active
    eq.signal(281144,1); -- signal third wave NPCs to go active
    eq.set_timer("wave4", 120 * 1000); --2 min in between waves
elseif (e.timer == "wave4") then
	eq.stop_timer("wave4");
    eq.signal(281123,1); -- signal fourth wave NPCs to go active
    eq.signal(281119,1); -- signal executioner to emote and path
    eq.spawn2(281117,0,0,-510,-1968,86,1); -- Trixxrt`s_Guardsman (281117)Wave4
    eq.spawn2(281117,0,0,-468,-1968,86,1); -- Trixxrt`s_Guardsman (281117)Wave4
    eq.set_timer("failtimer", 180 * 1000); --3 min to win event or be ejected
elseif (e.timer == "ejectemote") then
	eq.stop_timer("ejectemote");
    eq.signal(281124,2); -- signal kreshin emote
    eq.set_timer("ejecttimer", 25 * 1000); --25 sec left until everyone is ejected after event success
elseif (e.timer == "failtimer") then
	eq.stop_timer("failtimer");
	eq.signal(281119,2); -- signal executioner event failed
	eq.signal(281124,3); -- signal kreshin lie down
	eq.set_timer("ejecttimer", 20 * 1000); --20 sec left until everyone is ejected after event failure
end
end


function Trigger_proximity_say(e)
if (e.message:findi("i wish to enter")) then
		local client = e.other;
		if(client:GetItemIDAt(Slot.Cursor) == 67415) then --stone of entry
		
			if ( event_flag == 0 ) then 

				-- Move the Player and their Group to the trial room.
				local trial_group = e.other:GetGroup();
				if (trial_group ~= nil and trial_group.valid) then
					MoveGroup( trial_group, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, -480, -1789, 78, 256); 
					trial_group_id = trial_group:GetID();
				else
					client_id = e.other:CharacterID();
					e.other:MovePC(281, -480, -1789, 78, 256); -- Zone: qinimi
				end

				-- Set a variable to indicate the Trial is unavailable.
				event_flag = 1;
		
        			eq.set_timer("startevent", 500); --popevent
			else
				e.other:Message(15,"The device appears to be in use. Maybe you should try again once it has been reset.");
			end
		else
			e.other:Message(15,"Nothing happens. You must be missing the key required.");
		end
end
end

function MoveGroup(trial_group, src_x, src_y, src_z, distance, tgt_x, tgt_y, tgt_z, tgt_h, msg)
	if ( trial_group ~= nil) then
		local trial_count = trial_group:GroupCount();

		for i = 0, trial_count - 1, 1 do
			local mob_v = trial_group:GetMember(i);

			if (mob_v ~= nil and mob_v.valid and mob_v:IsClient()) then
				local client_v = mob_v:CastToClient();

				if (client_v.valid) then
					-- check the distance and port them up if close enough
					if (client_v:CalculateDistance(src_x, src_y, src_z) <= distance) then
						-- port the player up
						client_v:MovePC(281, tgt_x, tgt_y, tgt_z, tgt_h); -- Zone: qinimi

					end
				end
			end
		end
	end
end


function Waveone_Signal(e)
e.self:SetSpecialAbility(35, 0); --turn off immunity
e.self:SetSpecialAbility(24, 0); --turn off anti aggro
end

function Wavetwo_Signal(e)
	e.self:SetSpecialAbility(35, 0); --turn off immunity
	e.self:SetSpecialAbility(24, 0); --turn off anti aggro
end

function Wavethree_Signal(e)
	e.self:SetSpecialAbility(35, 0); --turn off immunity
	e.self:SetSpecialAbility(24, 0); --turn off anti aggro
end

function Wavefour_Signal(e)
	e.self:SetSpecialAbility(35, 0); --turn off immunity
	e.self:SetSpecialAbility(24, 0); --turn off anti aggro
	e.self:Say("What is this? Seems I have underestimated your friends, Kreshin. No matter what this means, I will have to hasten your death and handle these intruders myself. Prepare yourselves for my wrath! Xocik, kill Kreshin -- no matter what happens to me.");
end

function Executioner_Signal(e)
	if (e.signal==1) then
	e.self:Say("As you wish Tixxrt. I shall slay the spy no matter what the cost.");
	eq.start(47); --walk to kreshin
	elseif (e.signal==2) then
 	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"As the executioner swings his axe forward, Kreshin cries out one last time before the flame of his life is extinguished.");
	e.self:Emote("laughs as innocent blood is spread all over the platform. 'Return to your friends and let them know that the might of the Muramites cannot be stopped!");
	elseif (e.signal==3) then
	e.self:SetSpecialAbility(35, 0); --turn off immunity
	e.self:SetSpecialAbility(24, 0); --turn off anti aggro
	end
end

function Kreshin_Signal(e)
if (e.signal==1) then
	e.self:Say("Thank you for rescuing me. I sense that one of you holds a stone key which allowed you entrance into the courts. Please show it to me.");
	event_success  = 1;
elseif (e.signal==2) then
    e.self:Say("If you have not shown me your key, please hurry and do so. We must leave here soon.");
elseif (e.signal==3) then
    e.self:SetAppearance(3);
end
end

function Kreshin_Trade(e)
	local item_lib = require("items");
	if (event_success  == 1) then
		if (item_lib.check_turn_in(e.trade, {item1 = 67415})) then --Stone of Entry
			e.self:Say("You have done well to get this far. Please, take this to Taminoa and tell him it is vital that he decipher it. I must stay here to investigate more. Let him know I am safe and thank you again.");
      		e.other:SummonItem(67415);--Stone of Entry
      		e.other:SummonItem(67401);--Writ of the Magi
    		end
	else
		e.self:Emote("looks at you with pleading eyes. 'You've come just in time. Help me!"); --cannot turn in item until event won
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function Executioner_Death(e)
	eq.signal(281138,1); -- signal Trigger_Qinimi_1 (281138) that event was won
	eq.signal(281124,1); -- signal Kreshin to emote
end

function Pixtt_Death(e)
	eq.signal(281119,3); -- signal executioner to remove immunities
end


function event_encounter_load(e)
eq.register_npc_event('execution', Event.spawn, 281138, Trigger_Spawn); --Trigger_Qinimi_1 (281138)
eq.register_npc_event('execution', Event.timer, 281138, Trigger_Timer); --Trigger_Qinimi_1 (281138)
eq.register_npc_event('execution', Event.proximity_say, 281138, Trigger_proximity_say); --Trigger_Qinimi_1 (281138)
eq.register_npc_event('execution', Event.signal, 281138, Trigger_Signal); --Trigger_Qinimi_1 (281138)
  
  eq.register_npc_event('execution', Event.signal, 281139, Waveone_Signal);
  eq.register_npc_event('execution', Event.signal, 281142, Waveone_Signal);
  
  eq.register_npc_event('execution', Event.signal, 281140, Wavetwo_Signal);
  eq.register_npc_event('execution', Event.signal, 281143, Wavetwo_Signal);
  
  eq.register_npc_event('execution', Event.signal, 281141, Wavethree_Signal);
  eq.register_npc_event('execution', Event.signal, 281144, Wavethree_Signal);
  
  eq.register_npc_event('execution', Event.signal, 281123, Wavefour_Signal);
    
  eq.register_npc_event('execution', Event.signal, 281119, Executioner_Signal);
  eq.register_npc_event('execution', Event.death_complete, 281119, Executioner_Death);
	
eq.register_npc_event('execution', Event.death_complete, 281123, Pixtt_Death);
  
  eq.register_npc_event('execution', Event.signal, 281124, Kreshin_Signal);
  eq.register_npc_event('execution', Event.trade, 281124, Kreshin_Trade);
 
end
