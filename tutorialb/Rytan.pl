#zone: tutorialb
#ToDo:
# Force succession of popup windows
# Flash spellbar

sub EVENT_SAY {
  if ($text=~/hail/i)  {
    if (quest::istaskactivityactive(22, 4)) {
      quest::say("Hello $name. I'm not much of a fighter myself but I can bestow the power of my god's favor. Would you like to be [" . quest::saylink("blessed") . "]?");
    }
    else {
      quest::say("Hello, $name. I'm not much of a fighter myself but I can bestow the power of my god`s favor. Would you like to be [" . quest::saylink("blessed") . "], or would you perhaps like to [" . quest::saylink("review") . "] my lessons from earlier?");
    }
    quest::popup("Buffs", "Rytan is offering you a beneficial spell (a 'buff' for short). This spell will help protect you in combat.<br><br>All spells that are currently affecting you will appear in either the <c \"#00FF00\">Effects Window</c> or the <c \"#00FF00\">Songs Window</c>.<br><br>Spells that appear in the <c \"#00FF00\">Songs Window</c> are usually short-duration spells that always disappear when you die or leave a zone.<br><br>To inspect the properties of a spell that is affecting you, hover your mouse over the spell icon and hold the <c \"#00FFFF\">Right Mouse Button</c><br><br><c \"#F07F00\">Respond to Rytan's dialogue in your Main Chat Window to continue.</c>");   
  }
  elsif ($text=~/blessed/i) {
    $npc->CastSpell(5150, $userid); #Gloomingdeep Guard
    if (quest::istaskactivityactive(22, 4)) {
      quest::updatetaskactivity(22, 4);
      if ($class eq "Warrior" || $class eq "Berserker" || $class eq "Monk" || $class eq "Rogue") { #Melee
        quest::say("There you go, $name. It looks like you rely on your melee skills rather than spells to succeed. I'm not much of a fighter myself but I do have this skill tome to offer you. It may prove to be useful to you against the kobolds. As you gain experience you will encounter other tomes to learn from. Some can be purchased from vendors, some can be made by players with tradeskills, and some must be obtained via quest. Good luck out there!");
        quest::summonitem(59973); #Tome of Throw Stone - Now item 17708 on Live
        quest::popup("Scribing and Memorizing", "Rytan has given you a skill tome!<br><br>To use a combat ability, you must first <c \"#00FF00\">learn</c> it, then you must <c \"#00FF00\">create a hotkey</c> to trigger it.<br><br>To learn this combat ability, simply find it in your inventory and <c \"#00FFFF\">right click</c> on the tome.<br><br>Once you have the ability memorized, open your <c \"#00FF00\">Combat Abilities Window</c> by using <c \"#00FFFF\">[Alt+C]</c>. You can then <c \"#00FFFF\">left click</c> the thin <c \"#00FFFF\">S</c> button to see a complete list of all of the combat abilities you know. Select the combat ability from this window, then <c \"#00FFFF\">left click</c> the <c \"#00FFFF\">Make Hotkey</c> button at the bottom of the window. This will give you a hotkey that you can place in one of the 8 slots in your <c \"#00FF00\">Combat Abilities Window</c>, or directly on a <c \"#00FF00\">Hotbar</c>.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>");
        REVIEW();
      }
      elsif ($class eq "Paladin" || $class eq "Shadowknight" || $class eq "Bard" || $class eq "Beastlord" || $class eq "Ranger") { #Hybrid
        quest::say("You seem to be a bit of a caster yourself. You will find that spells and songs can greatly enhance your power. Being a hybrid of sorts, you will have access to both magic and, later, skill tomes. For now, take this scroll. It may prove to be useful to you as you combat the kobolds. As you earn money and gain experience you will find other powerful spells. Some spells can be purchased from vendors, some can be made by players with tradeskills, and some must be obtained via quest. Good luck out there!");
        if ($class eq "Paladin" || $class eq "Beastlord" || $class eq "Ranger") {
          quest::summonitem(59971); #Spell: Salve
        }
        elsif ($class eq "Shadowknight") {
          quest::summonitem(59972); #Spell: Spike of Disease
        }
        elsif ($class eq "Bard") {
          quest::summonitem(59963); #Song: Chords of Dissonance
        }
        quest::popup("Scribing and Memorizing", "Rytan has given you a spell scroll!<br><br>To use a spell, you must first <c \"#00FF00\">scribe</c> a spell in your spellbook, and then <c \"#00FF00\">memorize</c> the spell in your <c \"#00FF00\">Spell Bar</c>. There are a limited number of slots available in your spell bar, so choosing which spells you have memorized will be an important strategy as you scribe more spells.<br><br>To scribe this spell, first open your <c \"#00FF00\">Spellbook</c> by using <c \"#00FFFF\">[Ctrl+B]</c> and transfer the spell scroll to an empty spell box on a page and left click. This will start scribing the spell. This process takes a little bit of time. A thin purple progress bar will appear on teh bottom of the spellbook window while you are scribing.<br><br>Once the spell has finished scribing, the spell's icon and name will appear in your spellbook. <c \"#00FFFF\">Left click</c> on this newly added icon in your spellbook to join the icon with your cursor. Then <c \"#00FFFF\">left click</c> on an empty spell slot on your <c \"#00FF00\">Spell Bar</c>. Dragging the spell will not do anything; simply <c \"#00FFFF\">left click</c> once in your spellbook and once on your <c \"#00FF00\">Spell Bar</c>. The <c \"#00FF00\">Spell Bar</c> will begin flashing briefly once you close this message.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>");
        REVIEW();
      }
      elsif ($class eq "Necromancer" || $class eq "Druid" || $class eq "Cleric" || $class eq "Shaman" || $class eq "Enchanter" || $class eq "Wizard") { #Caster
        quest::say("You seem to be a bit of a caster yourself. You will find that spells and songs can greatly enhance your power. Take this and scribe it in your spell book. I can only hope it helps you against the kobold horde. As you earn money and gain experience you will find other powerful spells. Some spells can be purchased from vendors, some can be made by players with tradeskills, and some must be obtained via quest. Good luck out there!");
        if ($class eq "Necromancer") {
          quest::summonitem(59962); #Spell: Siphon Strength
        }
        elsif ($class eq "Druid") {
          quest::summonitem(59965); #Spell: Snare
        }
        elsif ($class eq "Cleric") {
          quest::summonitem(59966); #Spell: Yaulp
        }
        elsif ($class eq "Shaman") {
          quest::summonitem(59959); #Spell: Strengthen
        }
        elsif ($class eq "Enchanter") {
          quest::summonitem(59961); #Spell: Minor Illusion
        }
        elsif ($class eq "Magician") {
          quest::summonitem(59960); #Spell: Summon Food
        }
        elsif ($class eq "Wizard") {
          quest::summonitem(59964); #Spell: Numbing Cold
        }
        quest::popup("Scribing and Memorizing", "Rytan has given you a spell scroll!<br><br>To use a spell, you must first <c \"#00FF00\">scribe</c> a spell in your spellbook, and then <c \"#00FF00\">memorize</c> the spell in your <c \"#00FF00\">Spell Bar</c>. There are a limited number of slots available in your spell bar, so choosing which spells you have memorized will be an important strategy as you scribe more spells.<br><br>To scribe this spell, first open your <c \"#00FF00\">Spellbook</c> by using <c \"#00FFFF\">[Ctrl+B]</c> and transfer the spell scroll to an empty spell box on a page and left click. This will start scribing the spell. This process takes a little bit of time. A thin purple progress bar will appear on teh bottom of the spellbook window while you are scribing.<br><br>Once the spell has finished scribing, the spell's icon and name will appear in your spellbook. <c \"#00FFFF\">Left click</c> on this newly added icon in your spellbook to join the icon with your cursor. Then <c \"#00FFFF\">left click</c> on an empty spell slot on your <c \"#00FF00\">Spell Bar</c>. Dragging the spell will not do anything; simply <c \"#00FFFF\">left click</c> once in your spellbook and once on your <c \"#00FF00\">Spell Bar</c>. The <c \"#00FF00\">Spell Bar</c> will begin flashing briefly once you close this message.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>");
        REVIEW();
      }
    }
  }
  elsif ($text=~/review/i) {
    if ($class eq "Warrior" || $class eq "Berserker" || $class eq "Monk" || $class eq "Rogue") { #Melee
      quest::say("It looks like you rely on your melee skills rather than spells to succeed. I'm not much of a fighter myself but I do have this skill tome to offer you. It may prove to be useful to you against the kobolds. As you gain experience you will encounter other tomes to learn from. Some can be purchased from vendors, some can be made by players with tradeskills, and some must be obtained via quest. Good luck out there!");
    }
    elsif ($class eq "Paladin" || $class eq "Shadowknight" || $class eq "Bard" || $class eq "Beastlord" || $class eq "Ranger") { #Hybrid
      quest::say("You appear to be a hybrid of sorts. You will have access to both magic and, later, skill tomes. As you earn money and gain experience you will be able to use other powerful spells. Some spells can be made by players with tradeskills, and some must be obtained via quest, but most of them can be purchased from vendors like those across the bridge northwest of here.");
    }
    elsif ($class eq "Necromancer" || $class eq "Druid" || $class eq "Cleric" || $class eq "Shaman" || $class eq "Enchanter" || $class eq "Magician" || $class eq "Wizard") { #Caster
      quest::say("You seem to be a bit of a caster like me. As you earn money and gain experience you will gain access to other powerful spells. Some spells can be made by players with tradeskills, and some must be obtained via quest, but most of them can be purchased from vendors like those across the bridge northwest of here.");
    }
    REVIEW();
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub REVIEW {
  if ($class eq "Warrior" || $class eq "Berserker" || $class eq "Monk" || $class eq "Rogue") { #Combat Abilities
    quest::popup("Combat Abilities", "To use a combat ability, you must first <c \"#00FF00\">learn</c> it, then you must <c \"#00FF00\">create a hotkey</c> to trigger it.<br><br>To learn this combat ability, simply find it in your inventory and <c \"#00FFFF\">right click</c> on the tome.<br><br>Once you have the ability memorized, open your <c \"#00FF00\">Combat Abilities Window</c> by using <c \"#00FFFF\">[Alt+C]</c>. You can then <c \"#00FFFF\">left click</c> the thin <c \"#00FFFF\">S</c> button to see a complete list of all of the combat abilities you know. Select the combat ability from this window, then <c \"#00FFFF\">left click</c> the <c \"#00FFFF\">Make Hotkey</c> button at the bottom of the window. This will give you a hotkey that you can place in one of the 8 slots in your <c \"#00FF00\">Combat Abilities Window</c>, or directly on a <c \"#00FF00\">Hotbar</c>.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>");
    quest::popup("Combat Abilities", "Combat Ability Shortcuts:<br><br>It is also possible to create hotkeys by <c \"#00FFFF\">right-clicking</c> on an empty slot in your <c \"#00FF00\">Combat Abilities Window</c> and choosing your ability from the <c \"#00FF00\">Context Menu</c>. As you learn more abilities, more categories will appear in these menus.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>");
    quest::popup("Combat Abilities", "<c \"#FFFF00\">Using Combat Abilities:</c><br>For a description of what your combat abilities can do, <c \"#00FFFF\">left click</c> on the S button in your <c \"#00FF00\">Combat Abilities Window</c>, then select the name of the combat ability in the window that pops up. The description will appear in the lower portion of this <c \"#00FF00\">Combat Skills Window</c>.<br><br>To use an ability, select your target and then <c \"#00FFFF\">left click</c> on the hotkey you have created in your <c \"#00FF00\">Combat Abilities Window</c> or <c \"#00FF00\">Hotbar</c>.<br><br><c \"#FFFF00\">Endurance:</c><br>Most combat abilities require endurance to cast or to keep active. Endurance is represented by the yellow bar below your hit point meter in the <c \"#00FF00\">Player Window</c>. Much like hit points, endurance will regenerate over time, but unlike hit points, they will regenerate at the same rate whether you are sitting or standing as long as you are not actively attacking something.<br><br>If you are in a rested state and sitting (there will be a yellow swirl in your <c \"#00FF00\">Player Window</c> when this is true), both endurance and hit points regenerate at a much faster rate than normal.<br><br>If you wish to read these lessons again, simly ask Rytan to [review] them.<br><br><c \"#F07F00\">Click 'OK' to continue</c>");
  }
  elsif ($class eq "Paladin" || $class eq "Shadowknight" || $class eq "Necromancer" || $class eq "Bard" || $class eq "Druid" || $class eq "Cleric" || $class eq "Shaman" || $class eq "Beastlord" || $class eq "Ranger" || $class eq "Enchanter" || $class eq "Magician" || $class eq "Wizard") { #Spells and Songs
    quest::popup("Scribing and Memorizing", "To use a spell, you must first <c \"#00FF00\">scribe</c> a spell in your spellbook, and then <c \"#00FF00\">memorize</c> the spell in your <c \"#00FF00\">Spell Bar</c>. There are a limited number of slots available in your spell bar, so choosing which spells you have memorized will be an important strategy as you scribe more spells.<br><br>To scribe this spell, first open your <c \"#00FF00\">Spellbook</c> by using <c \"#00FFFF\">[Ctrl+B]</c> and transfer the spell scroll to an empty spell box on a page and left click. This will start scribing the spell. This process takes a little bit of time. A thin purple progress bar will appear on teh bottom of the spellbook window while you are scribing.<br><br>Once the spell has finished scribing, the spell's icon and name will appear in your spellbook. <c \"#00FFFF\">Left click</c> on this newly added icon in your spellbook to join the icon with your cursor. Then <c \"#00FFFF\">left click</c> on an empty spell slot on your <c \"#00FF00\">Spell Bar</c>. Dragging the spell will not do anything; simply <c \"#00FFFF\">left click</c> once in your spellbook and once on your <c \"#00FF00\">Spell Bar</c>. The <c \"#00FF00\">Spell Bar</c> will begin flashing briefly once you close this message.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>");
    #Need to flash spell bar here (fade out/in 3-4 times)
    quest::popup("Spells and Songs", "Spell Shortcuts:<br><br>It is also possible to memorize spells by <c \"#00FFFF\">right-clicking</c> on an empty spell slot in your <c \"#00FF00\">Spell Bar</c> and choosing your spell from the <c \"#00FF00\">Context Menu</c>. As you scribe more spells, more categories will appear in these menus.<br><br>Eventually you may find that you use different groups of spells at differents times. If you want to save the spells you currenly have memorized as a <c \"#00FFFF\">Spell Set</c>, you can do so by <c \"#00FFFF\">right-clicking</c> on the <c \"#00FF00\">Spellbook</c> icon at the end of your <c \"#00FF00\">Spell Bar</c>. Choose <c \"#00FFFF\">Save Spell Set</c> on this menu and then enter a name. Once you have a <c \"#00FFFF\">Spell Set</c> saved, you can quickly memorize those spells by choosing it from the <c \"#00FFFF\">Load Spell Set</c> menu.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>");
    quest::popup("Spells and Songs", "<c \"#FFFF00\">Using Spells:</c><br><br>To cast a spell, you must have memorized the spell in your <c \"#00FF00\">Spell Bar</c>. To cast your spell, select your target and then <c \"#00FFFF\">left click</c> on the spell icon in your <c \"#00FF00\">Spell Bar</c>.<br><br>For a description of what your spells can do, <c \"#00FFFF\">right click and hold</c> on the spell icon in your spell book.<br><br><c \"#FFFF00\">Mana:</c><br>Most spells require mana to cast. Mana is represented by the blue bar below your hit point meter in the <c \"#00FF00\">Player Window</c>. Much like hit points, mana will regenerate over time, but it will regenerate much faster when you are sitting.<br><br>If you are in a rested state and sitting (there will be a yellow swirl in your <c \"#00FF00\">Player Window</c> when this is true), both mana and hit points regenerate at a much faster rate than normal.<br><br>If you wish to read these lessons again, simly ask Rytan to [review] them.<br><br><c \"#F07F00\">Click 'OK' to continue</c>");
  }
  quest::say("You're a quick learner, my friend. Hopefully your magic can see us through the struggle ahead.");
}