local event_flag   = 0;
local trial_group_id = 0;
local client_id      = 0; -- character ID, not entity ID
local mob_list       = { };

function event_spawn(e)
	eq.set_timer("delay",2000);
end

function event_timer(e)
if (e.timer == "delay") then
	eq.stop_timer("delay");
	eq.set_proximity(e.self:GetX()-35, e.self:GetX()+35, e.self:GetY()-35, 

  e.self:GetY()+35, -999999, 999999, true);
	eq.enable_proximity_say();
elseif (e.timer == "ejecttimer") then
		eq.stop_timer("ejecttimer");
		despawn_trial_mobs()

        local trial_group = eq.get_entity_list():GetGroupByID(trial_group_id);
		if (trial_group ~= nil and trial_group.valid) then
			MoveGroup( trial_group, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, -1515, -289, -14, 60, "A mysterious force translocates you."); 
		else
            local client_e = eq.get_entity_list():GetClientByCharID(client_id);
            if (client_e ~= nil and client_e.valid) then
                client_e.other:MovePC( 281, -1515, -289, -14, 60 ); -- Zone: qinimi
                client_e.other:Message(3, "A mysterious force translocates you.");
            end
		end
end
end


function event_proximity_say(e)
if (e.message:findi("ready to begin the trial")) then
			if ( event_flag == 0 ) then 
				e.self:Say("Then begin.");

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
			else
				e.self:Say("I'm sorry, the Trial is currently unavilable to you.");
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

--function despawn_trial_mobs()
--local trial_mobs	= { to,be,added};
--	for k,v in pairs(trial_mobs) do
--		eq.depop_all(v);
--	end
--end
