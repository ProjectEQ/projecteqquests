function event_say(e)
  local player = e.other
  local level = player:GetLevel();

  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Greetings, are you interested to learn [" .. eq.say_link("something new") .. "] or [" .. eq.say_link("reset") .. "]?.'")
  elseif e.message:findi("something new") then
    -- Teach all available spells/discs   
    eq.debug("Level: " .. level);
    new_spell_list = player:GetScribeableSpells(60, level);
    for i = 1, #new_spell_list do
        local spell = new_spell_list[i];
        --eq.debug("Spell: " .. spell);
    end
    player:ScribeSpells(60, level);

    new_disc_list = player:GetLearnableDisciplines(60, level);
    for i = 1, #new_disc_list do
        local disc = new_disc_list[i];
        eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "You learned: " .. eq.get_spell_name(disc));
    end
    player:LearnDisciplines(60, level);
elseif e.message:findi("reset") then
    player:UntrainDiscAll();
    eq.debug("Reset all discs");
  end
end
