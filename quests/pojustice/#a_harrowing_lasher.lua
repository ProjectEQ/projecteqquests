function event_spawn(e)
   -- Aggro the closest prisoner (201495) a tormented prisoner
   local npc = eq.get_entity_list():GetMobByNpcTypeID(201463);

   if (npc.valid) then
      if ( npc:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) < 200) then
         e.self:AddToHateList(npc,1);
      end

   end
end
