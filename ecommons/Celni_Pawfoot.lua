function event_say(e)
  local player = e.other
  local level = player:GetLevel();

  local totalCost = 0;

  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Greetings, are you interested to learn [" .. eq.say_link("something new") .. "] or [" .. eq.say_link("reset") .. "]?.'")
  elseif e.message:findi("something new") then
    -- Get all available spells/discs   
    eq.debug("Level: " .. level);
    new_spell_list = player:GetScribeableSpells(1, level);
    for i = 1, #new_spell_list do --#new_spell_list
        local spell = new_spell_list[i];
        local rawCopper = 0;
        eq.debug("Spell: " .. eq.get_spell_name(spell));
        local db = Database(Database.Content) -- no argument will default to default eqemu_config database
        local stmt = db:prepare("select * from items where name like ? and price > 0 LIMIT 1")
        stmt:execute({"%" .. eq.get_spell_name(spell)})
        local row = stmt:fetch_hash()
        while row do
          --eq.debug(string.format("id %d, name %s, price %s", row.id, row.Name, row.price))
          rawCopper = row.price
          row = stmt:fetch_hash() -- next
        end
        stmt:close()
        db:close()
        --Print spell info to player
        local pp = math.floor(rawCopper / 1000)
        local gp = math.floor((rawCopper % 1000) / 100)
        local sp = math.floor((rawCopper % 100) / 10)
        local cp = rawCopper % 10
        eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Available spell: " .. eq.get_spell_name(spell) .. " (" .. eq.get_spell_level(spell, player:GetClass()) .. ") - " .. string.format("%dpp %dgp %dsp %dcp", pp, gp, sp, cp));
        --Add to total cost
        totalCost = totalCost + rawCopper
    end

    new_disc_list = player:GetLearnableDisciplines(1, level);
    for i = 1, #new_disc_list do
        local disc = new_disc_list[i];
        local rawCopper = 0;
        eq.debug("Spell: " .. eq.get_spell_name(disc));
        local db = Database(Database.Content) -- no argument will default to default eqemu_config database
        local stmt = db:prepare("select * from items where name like ? and price > 0 LIMIT 1")
        stmt:execute({"%" .. eq.get_spell_name(disc)})
        local row = stmt:fetch_hash()
        while row do
          --eq.debug(string.format("id %d, name %s, price %s", row.id, row.Name, row.price))
          rawCopper = row.price
          row = stmt:fetch_hash() -- next
        end
        stmt:close()
        db:close()
        --Print disc info to player
        local pp = math.floor(rawCopper / 1000)
        local gp = math.floor((rawCopper % 1000) / 100)
        local sp = math.floor((rawCopper % 100) / 10)
        local cp = rawCopper % 10
        eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Available discipline: " .. eq.get_spell_name(disc) .. " (" .. eq.get_spell_level(disc, player:GetClass()) .. ") - " .. string.format("%dpp %dgp %dsp %dcp", pp, gp, sp, cp));
        --Add to total cost
        totalCost = totalCost + rawCopper
    end

    local pp = math.floor(totalCost / 1000)
    local gp = math.floor((totalCost % 1000) / 100)
    local sp = math.floor((totalCost % 100) / 10)
    local cp = totalCost % 10
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, string.format("Total cost will be %dpp %dgp %dsp %dcp", pp, gp, sp, cp))
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Do you [" .. eq.say_link("accept") .. "]?.'")
  elseif e.message:findi("accept") then
    local rawPlayerMoney = player:GetAllMoney()
    eq.debug(string.format("Player has %d money", rawPlayerMoney))
    new_spell_list = player:GetScribeableSpells(1, level);
    for i = 1, #new_spell_list do --#new_spell_list
        local spell = new_spell_list[i];
        local rawCopper = 0;
        eq.debug("Spell: " .. eq.get_spell_name(spell));
        local db = Database(Database.Content) -- no argument will default to default eqemu_config database
        local stmt = db:prepare("select * from items where name like ? and price > 0 LIMIT 1")
        stmt:execute({"%" .. eq.get_spell_name(spell)})
        local row = stmt:fetch_hash()
        while row do
          --eq.debug(string.format("id %d, name %s, price %s", row.id, row.Name, row.price))
          rawCopper = row.price
          row = stmt:fetch_hash() -- next
        end
        stmt:close()
        db:close()
        totalCost = totalCost + rawCopper
    end

    new_disc_list = player:GetLearnableDisciplines(1, level);
    for i = 1, #new_disc_list do
        local disc = new_disc_list[i];
        eq.debug("Disc: " .. eq.get_spell_name(disc));
        local rawCopper = 0;
        eq.debug("Disc: " .. eq.get_spell_name(disc));
        local db = Database(Database.Content) -- no argument will default to default eqemu_config database
        local stmt = db:prepare("select * from items where name like ? and price > 0 LIMIT 1")
        stmt:execute({"%" .. eq.get_spell_name(disc)})
        local row = stmt:fetch_hash()
        while row do
          --eq.debug(string.format("id %d, name %s, price %s", row.id, row.Name, row.price))
          rawCopper = row.price
          row = stmt:fetch_hash() -- next
        end
        stmt:close()
        db:close()
        totalCost = totalCost + rawCopper
    end
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
  elseif e.message:findi("reset") then
      player:UntrainDiscAll();
      player:UnscribeSpellAll();
      eq.debug("Reset all discs/spells");
    end
end