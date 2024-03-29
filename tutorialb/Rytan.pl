#zone: tutorialb
#ToDo:
# Force succession of popup windows
# Flash spellbar
# items: 59973, 17708, 59971, 59972, 59963, 59962, 59965, 59966, 59959, 59961, 59960, 59964

sub EVENT_SAY {
  if ($text=~/hail/i)  {
    if (quest::istaskactivityactive(1448, 5)) {
      quest::say("Hello, $name.  I'm not much of a fighter myself but I can bestow the power of my god's favor.  Would you like to be [" . quest::saylink("blessed") . "]?");
    }
    else {
      quest::say("Hello, $name.  I'm not much of a fighter myself but I can bestow the power of my god`s favor.  Would you like to be [" . quest::saylink("blessed") . "], or would you perhaps like to [" . quest::saylink("review") . "] my lessons from earlier?");
    }
    quest::popup("Buffs", "<br>Rytan is offering you a beneficial spell (a 'buff' for short).  This spell will help protect you in combat.<br><br>All spells that are currently affecting you will appear in either the <c \"#00A000\">Effects Window</c> or in the <c \"#00A000\">Songs Window</c>.<br><br>Spells that appear in the <c \"#00A000\">Songs Window</c> are usually short-duration spells that always disappear when you die or leave a zone.<br><br>To inspect the properties of a spell that is affecting you, hover your mouse over the spell icon and hold the <c \"#00F0F0\">Right Mouse Button</c>.<br><br><c \"#F07F00\">Respond to Rytan's dialogue in your Main Chat Window to continue.</c>");
  }
  elsif ($text=~/blessed/i) {
    $npc->CastSpell(5150, $userid); #Gloomingdeep Guard
    if ($class eq "Warrior" || $class eq "Berserker" || $class eq "Monk" || $class eq "Rogue") { #Melee
      quest::say("There you go, $name.  It looks like you rely on your melee skills rather than spells to succeed.  I'm not much of a fighter myself but I do have this skill tome to offer you.  It may prove to be useful to you against the kobolds.  As you gain experience you will encounter other tomes to learn from.  Some can be purchased from vendors, some can be made by players with tradeskills, and some must be obtained via quest.  Good luck out there!");
      quest::popup("Scribing and Memorizing", "<br>Rytan has given you a skill tome!<br><br>To use a combat ability, you must first <c \"#00A000\">learn</c> it, then you must <c \"#00A000\">create a hotkey</c> to trigger it.<br><br>To learn this combat ability, simply find it in your inventory and <c \"#00F0F0\">right click</c> on the tome.<br><br>Once you have the ability memorized, open your <c \"#00A000\">Combat Abilities Window</c> by using <c \"#00F0F0\">[Alt+C]</c>.  You can then <c \#00F0F0\">left click</c> the thin <c \"#00F0F0\">S</c> button to see a complete list of all of the combat abilities you know.  Select the combat ability from this window, then <c \"#00F0F0\">left click</c> the <c \"#00F0F0\">Make Hotkey</c> button at the bottom of the window.  This will give you a hotkey that you can place in one of the 8 slots in your <c \"#00A000\">Combat Abilities Window</c>, or directly on a <c \"#00A000\">Hotbar</c>.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>", 25);
      if (quest::istaskactivityactive(1448, 5)) {
        quest::summonitem(59973); #Tome of Throw Stone - Now item 17708 on Live
      }
    }
    elsif ($class eq "Paladin" || $class eq "Shadowknight" || $class eq "Bard" || $class eq "Beastlord" || $class eq "Ranger") { #Hybrid
      quest::say("You seem to be a bit of a caster yourself. You will find that spells and songs can greatly enhance your power. Being a hybrid of sorts, you will have access to both magic and, later, skill tomes. For now, take this scroll. It may prove to be useful to you as you combat the kobolds. As you earn money and gain experience you will find other powerful spells. Some spells can be purchased from vendors, some can be made by players with tradeskills, and some must be obtained via quest. Good luck out there!");
      quest::popup("Scribing and Memorizing", "Rytan has given you a spell scroll!<br><br>To use a spell, you must first <c \"#00FF00\">scribe</c> a spell in your spellbook, and then <c \"#00FF00\">memorize</c> the spell in your <c \"#00FF00\">Spell Bar</c>. There are a limited number of slots available in your spell bar, so choosing which spells you have memorized will be an important strategy as you scribe more spells.<br><br>To scribe this spell, first open your <c \"#00FF00\">Spellbook</c> by using <c \"#00FFFF\">[Ctrl+B]</c> and transfer the spell scroll to an empty spell box on a page and left click. This will start scribing the spell. This process takes a little bit of time. A thin purple progress bar will appear on teh bottom of the spellbook window while you are scribing.<br><br>Once the spell has finished scribing, the spell's icon and name will appear in your spellbook. <c \"#00FFFF\">Left click</c> on this newly added icon in your spellbook to join the icon with your cursor. Then <c \"#00FFFF\">left click</c> on an empty spell slot on your <c \"#00FF00\">Spell Bar</c>. Dragging the spell will not do anything; simply <c \"#00FFFF\">left click</c> once in your spellbook and once on your <c \"#00FF00\">Spell Bar</c>. The <c \"#00FF00\">Spell Bar</c> will begin flashing briefly once you close this message.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>");
      if (quest::istaskactivityactive(1448, 5)) {
        if ($class eq "Paladin" || $class eq "Beastlord" || $class eq "Ranger") {
          quest::summonitem(59971); # Item: Spell: Salve
        }
        elsif ($class eq "Shadowknight") {
          quest::summonitem(59972); # Item: Spell: Spike of Disease
        }
        elsif ($class eq "Bard") {
          quest::summonitem(59963); #Song: Chords of Dissonance
        }
      }
    }
    elsif ($class eq "Necromancer" || $class eq "Druid" || $class eq "Cleric" || $class eq "Shaman" || $class eq "Enchanter" || $class eq "Wizard") { #Caster
      quest::say("You seem to be a bit of a caster yourself. You will find that spells and songs can greatly enhance your power. Take this and scribe it in your spell book. I can only hope it helps you against the kobold horde. As you earn money and gain experience you will find other powerful spells. Some spells can be purchased from vendors, some can be made by players with tradeskills, and some must be obtained via quest. Good luck out there!");
      quest::popup("Scribing and Memorizing", "Rytan has given you a spell scroll!<br><br>To use a spell, you must first <c \"#00FF00\">scribe</c> a spell in your spellbook, and then <c \"#00FF00\">memorize</c> the spell in your <c \"#00FF00\">Spell Bar</c>. There are a limited number of slots available in your spell bar, so choosing which spells you have memorized will be an important strategy as you scribe more spells.<br><br>To scribe this spell, first open your <c \"#00FF00\">Spellbook</c> by using <c \"#00FFFF\">[Ctrl+B]</c> and transfer the spell scroll to an empty spell box on a page and left click. This will start scribing the spell. This process takes a little bit of time. A thin purple progress bar will appear on teh bottom of the spellbook window while you are scribing.<br><br>Once the spell has finished scribing, the spell's icon and name will appear in your spellbook. <c \"#00FFFF\">Left click</c> on this newly added icon in your spellbook to join the icon with your cursor. Then <c \"#00FFFF\">left click</c> on an empty spell slot on your <c \"#00FF00\">Spell Bar</c>. Dragging the spell will not do anything; simply <c \"#00FFFF\">left click</c> once in your spellbook and once on your <c \"#00FF00\">Spell Bar</c>. The <c \"#00FF00\">Spell Bar</c> will begin flashing briefly once you close this message.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>");
      if (quest::istaskactivityactive(1448, 5)) {
        if ($class eq "Necromancer") {
          quest::summonitem(59962); # Item: Spell: Siphon Strength
        }
        elsif ($class eq "Druid") {
          quest::summonitem(59965); # Item: Spell: Snare
        }
        elsif ($class eq "Cleric") {
          quest::summonitem(59966); # Item: Spell: Yaulp
        }
        elsif ($class eq "Shaman") {
          quest::summonitem(59959); #Spell: Strengthen
        }
        elsif ($class eq "Enchanter") {
          quest::summonitem(59961); # Item: Spell: Minor Illusion
        }
        elsif ($class eq "Magician") {
          quest::summonitem(59960); # Item: Spell: Summon Food
        }
        elsif ($class eq "Wizard") {
          quest::summonitem(59964); # Item: Spell: Numbing Cold
        }
      }
    }
    if (quest::istaskactivityactive(1448, 5)) {
      quest::updatetaskactivity(1448, 5);
    }
  }
  elsif ($text=~/review/i) {
    if ($class eq "Warrior" || $class eq "Berserker" || $class eq "Monk" || $class eq "Rogue") { #Melee
      quest::say("It looks like you rely on your melee skills rather than spells to succeed.  I'm not much of a fighter myself but I do know that you should look out for more tomes to learn new combat abilities from.  Some can be made by players with tradeskills, and some must be obtained via quest, but most of them can be purchased from vendors like those across the bridge northwest of here.");
      quest::popup("Combat Abilities", "To use a combat ability, you must first <c \"#00A000\">learn</c> it, then you must <c \"#00A000\">create a hotkey</c> to trigger it.<br><br>To learn this combat ability, simply find it in your inventory and <c \"#00F0F0\">right click</c> on the tome.<br><br>Once you have the ability memorized, open your <c \"#00A000\">Combat Abilities Window</c> by using <c \"#00F0F0\">[Alt+C]</c>.  You can then <c \"#00F0F0\">left click</c> the thin <c \"#00F0F0\">S</c> button to see a complete list of all of the combat abilities you know.  Select the combat ability from this window, then <c \"#00F0F0\">left click</c> the <c \"#00F0F0\">Make Hotkey</c> button at the bottom of the window.  This will give you a hotkey that you can place in one of the 8 slots in your <c \"#00A000\">Combat Abilities Window</c>, or directly on a <c \"#00A000\">Hotbar</c>.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>", 26);
    }
    elsif ($class eq "Paladin" || $class eq "Shadowknight" || $class eq "Bard" || $class eq "Beastlord" || $class eq "Ranger") { #Hybrid
      quest::say("You appear to be a hybrid of sorts. You will have access to both magic and, later, skill tomes. As you earn money and gain experience you will be able to use other powerful spells. Some spells can be made by players with tradeskills, and some must be obtained via quest, but most of them can be purchased from vendors like those across the bridge northwest of here.");
    }
    elsif ($class eq "Necromancer" || $class eq "Druid" || $class eq "Cleric" || $class eq "Shaman" || $class eq "Enchanter" || $class eq "Magician" || $class eq "Wizard") { #Caster
      quest::say("You seem to be a bit of a caster like me. As you earn money and gain experience you will gain access to other powerful spells. Some spells can be made by players with tradeskills, and some must be obtained via quest, but most of them can be purchased from vendors like those across the bridge northwest of here.");
    }
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  quest::say("You're a quick learner, my friend.  Hopefully your magic can see us through the struggle ahead.");
}