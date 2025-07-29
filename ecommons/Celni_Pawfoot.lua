function event_say(e)
  local player = e.other
  local level = player:GetLevel();

  local totalCost = 0;

  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Greetings, are you interested to learn [" .. eq.say_link("something new") .. "]? Please pause between each character before using this")
  elseif e.message:findi("something new") then
    -- Get all available spells/discs   
    eq.debug("Level: " .. level);
    new_spell_list = player:GetScribeableSpells(1, level);
    if #new_spell_list > 0 then
      local conditions = {}
      for i = 1, #new_spell_list do --#new_spell_list
          local spell = new_spell_list[i];
          --eq.debug("Spell: " .. eq.get_spell_name(spell));
          table.insert(conditions, 'name = "Spell: ' .. eq.get_spell_name(spell) .. '"')
      end
      local where_clause = table.concat(conditions, " OR ")
      local query = string.format("select id, name, price from items where (%s) and price > 0 GROUP BY name", where_clause)

      local db = Database(Database.Content) -- no argument will default to default eqemu_config database

      local ok, stmt = pcall(function() return db:prepare(query) end)
      if not ok then
        db:close()
        if stmt then error("error: " .. stmt) end
      end

      local ok, err = pcall(function() return stmt:execute({}) end)
      if not ok then
        db:close()
        if err then error("error: " .. err) end
      end

      local ok, row = pcall(function() return stmt:fetch_hash() end)
      if not ok then
        db:close()
        if row then error("error: " .. err) end
      end

      while row do
        if row.price then
          --eq.debug(string.format("id %d, name %s, price %s", row.id, row.name, row.price))
          --Add to total cost
          totalCost = totalCost + row.price
          --eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Available spell: " .. row.Name .. " (" .. string.format("%dpp %dgp %dsp %dcp", pp, gp, sp, cp) .. ")");
        else
          eq.debug("No price")
        end
        row = stmt:fetch_hash() -- next
      end

      stmt:close()
      db:close()
    end
    
    new_disc_list = player:GetLearnableDisciplines(1, level);
    if #new_disc_list > 0 then
      local conditions = {}
      local rawCopper = 0;
      for i = 1, #new_disc_list do --#new_spell_list
          local disc = new_disc_list[i];
          --eq.debug("Disc: " .. eq.get_spell_name(disc));
          table.insert(conditions, 'name like "Tome%' .. eq.get_spell_name(disc) .. '"')
      end
      local where_clause = table.concat(conditions, " OR ")
      local query = string.format("select id, name, price from items where (%s) and price > 0 GROUP BY name", where_clause)

      local db = Database(Database.Content) -- no argument will default to default eqemu_config database
      
      local ok, stmt = pcall(function() return db:prepare(query) end)
      if not ok then
        db:close()
        if stmt then error("error: " .. stmt) end
      end

      local ok, err = pcall(function() return stmt:execute({}) end)
      if not ok then
        db:close()
        if err then error("error: " .. err) end
      end
      
      local ok, row = pcall(function() return stmt:fetch_hash() end)
      if not ok then
        db:close()
        if row then error("error: " .. err) end
      end

      while row do
        if row.price then
          --eq.debug(string.format("id %d, name %s, price %s", row.id, row.name, row.price))
          --Add to total cost
          totalCost = totalCost + row.price
          --eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Available spell: " .. row.Name .. " (" .. string.format("%dpp %dgp %dsp %dcp", pp, gp, sp, cp) .. ")");
        else
          eq.debug("No price")
        end
        row = stmt:fetch_hash() -- next
      end

      stmt:close()
      db:close()
    end
    if totalCost > 0 then
      --Print spell info to player
      local pp = math.floor(totalCost / 1000)
      local gp = math.floor((totalCost % 1000) / 100)
      local sp = math.floor((totalCost % 100) / 10)
      local cp = totalCost % 10
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, string.format("Total cost will be %dpp %dgp %dsp %dcp", pp, gp, sp, cp))
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Do you [" .. eq.say_link("accept") .. "]?.'")
    else
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "There is nothing more for me to teach you")
    end

  elseif e.message:findi("accept") then
    local rawPlayerMoney = player:GetAllMoney()
    eq.debug(string.format("Player has %d money", rawPlayerMoney))
    new_spell_list = player:GetScribeableSpells(1, level);
    if #new_spell_list > 0 then
      local conditions = {}
      for i = 1, #new_spell_list do --#new_spell_list
          local spell = new_spell_list[i];
          --eq.debug("Spell: " .. eq.get_spell_name(spell));
          table.insert(conditions, 'name = "Spell: ' .. eq.get_spell_name(spell) .. '"')
      end
      local where_clause = table.concat(conditions, " OR ")
      local query = string.format("select id, name, price from items where (%s) and price > 0 GROUP BY name", where_clause)

      local db = Database(Database.Content) -- no argument will default to default eqemu_config database
      
      local ok, stmt = pcall(function() return db:prepare(query) end)
      if not ok then
        db:close()
        if stmt then error("error: " .. stmt) end
      end
      --eq.debug(string.format("Create stmt"))
      local ok, err = pcall(function() return stmt:execute({}) end)
      if not ok then
        db:close()
        if err then error("error: " .. err) end
      end
      
      local ok, row = pcall(function() return stmt:fetch_hash() end)
      if not ok then
        db:close()
        if row then error("error: " .. err) end
      end
      
      while row do
        if row.price then
          --eq.debug(string.format("id %d, name %s, price %s", row.id, row.name, row.price))
          --Add to total cost
          totalCost = totalCost + row.price
          --eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Available spell: " .. row.Name .. " (" .. string.format("%dpp %dgp %dsp %dcp", pp, gp, sp, cp) .. ")");
        else
          eq.debug("No price")
        end
        row = stmt:fetch_hash() -- next
      end

      stmt:close()
      db:close()
    end

    new_disc_list = player:GetLearnableDisciplines(1, level);
    if #new_disc_list > 0 then
      local conditions = {}
      local rawCopper = 0;
      for i = 1, #new_disc_list do --#new_spell_list
          local disc = new_disc_list[i];
          --eq.debug("Disc: " .. eq.get_spell_name(disc));
          table.insert(conditions, 'name like "Tome%' .. eq.get_spell_name(disc) .. '"')
      end
      local where_clause = table.concat(conditions, " OR ")
      local query = string.format("select id, name, price from items where (%s) and price > 0 GROUP BY name", where_clause)

      local db = Database(Database.Content) -- no argument will default to default eqemu_config database
      
      local ok, stmt = pcall(function() return db:prepare(query) end)
      if not ok then
        db:close()
        if stmt then error("error: " .. stmt) end
      end
      --eq.debug(string.format("Create stmt"))
      local ok, err = pcall(function() return stmt:execute({}) end)
      if not ok then
        db:close()
        if err then error("error: " .. err) end
      end
      
      local ok, row = pcall(function() return stmt:fetch_hash() end)
      if not ok then
        db:close()
        if row then error("error: " .. err) end
      end
      
      while row do
        if row.price then
          --eq.debug(string.format("id %d, name %s, price %s", row.id, row.name, row.price))
          --Add to total cost
          totalCost = totalCost + row.price
          --eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Available spell: " .. row.Name .. " (" .. string.format("%dpp %dgp %dsp %dcp", pp, gp, sp, cp) .. ")");
        else
          eq.debug("No price")
        end
        row = stmt:fetch_hash() -- next
      end

      stmt:close()
      db:close()
    end
    --Check if player has enough money
    if totalCost > 0 then
      if rawPlayerMoney >= totalCost then
        eq.debug("Player has enough money")
        player:TakeMoneyFromPP(totalCost, true)
        player:ScribeSpells(1, level);
        player:LearnDisciplines(1, level);
        for i = 1, #new_disc_list do
            local disc = new_disc_list[i];
            eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "You learned: " .. eq.get_spell_name(disc));
        end
      else
        eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "You don't have enough money")
      end
    else
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "There is nothing more for me to teach you")
    end
  --This was used for debugging the script
  --elseif e.message:findi("reset") then
  --    player:UntrainDiscAll();
  --    player:UnscribeSpellAll();
  --    eq.debug("Reset all discs/spells");
  end
end