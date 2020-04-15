#Text information for Pally 1.5. Hailed is in DB. The event script not yet implemented.
function event_say(e)
  if (e.message:findi("hail")) then
    e.self:Emote("looks at you with wide, wild yes. 'Who.. What.. Who are you? If you are a sending from my [ " .. eq.say_link('brother', false, 'brother') .." ], you will not take me so easily!");
  elseif (e.message:findi("brother")) then
    e.self:Say("Mujak! Haha! He.. He captured me and.. Imprisoned me here as punishment for and resentful of our fathers favor toward me. He has only further proven his weakness through trapping me with power granted to him by Terris Thule. Hmm, [ " .. eq.say_link('perhaps', false, 'perhaps') .." ]..");
  elseif (e.message:findi("perhaps")) then
    e.self:Say("Perhaps you could find some way to overwhelm Mujaki? I might be able to work an enchantment to transport you closer to my brother. I only feel I have power to send twenty four of you, when you have formed rank please have the leaders of your groups let me know when you are ready.");
  elseif (e.message:findi("ready")) then
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(204039) == false ) then 
		 e.self:Say("Mujaki? Haven't seen him around lately");
	else
		MoveGroup(e.other:GetGroup(), e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, -1939, -2114, 167.48, 121);
		eq.signal(204039,1); -- NPC: Mujaki_the_Devourer
	end
  end
end

function MoveGroup(trial_group, src_x, src_y, src_z, distance, tgt_x, tgt_y, tgt_z, tgt_h)
   if ( trial_group ~= nil) then
      local trial_count = trial_group:GroupCount();
      for i = 0, trial_count - 1, 1 do
         local mob_v = trial_group:GetMember(i);
         if (mob_v.valid and mob_v:IsClient()) then
            local client_v = mob_v:CastToClient();
            if (client_v.valid) then
               -- check the distance and port them up if close enough
               if (client_v:CalculateDistance(src_x, src_y, src_z) <= distance) then
                  -- port the player up
                  client_v:MovePC(204, tgt_x, tgt_y, tgt_z, tgt_h); -- Zone: ponightmare
               end
            end
         end
      end
   end
end