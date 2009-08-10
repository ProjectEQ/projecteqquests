#zone: tutorialb

sub EVENT_SAY{
  if ($text=~/hail/i){
   quest::say("Hello $name. I'm not much of a fighter myself but I can bestow the power of my god's favor. Would you like to be [blessed]?");
   }
  elsif ($text=~/blessed/i) {
    $npc->CastSpell(5150,$userid);
    if (quest::istaskactivityactive(22,4)) {
      quest::updatetaskactivity(22,4);
      if ($class eq 'Warror' || $class eq 'Monk' || $class eq 'Berserker' || $class eq 'Rogue') {
        quest::summonitem(59973); # Tome of Throw Stone
        # missing some text to send the player to the melee disc NPC
      }
      else
      {
        quest::say("You seem to be a bit of a caster yourself! You will find that spells and songs can greatly enhance your power. Take this and scribe it in your spell book. I can only hope it helps you against the kobold horde. As you earn money and gain experience you will find other powerful spells. Good luck out there!");
        if ($class eq 'Paladin' || $class eq 'Ranger' || $class eq 'Beastlord') { quest::summonitem(59971); }
          # Spell: Salve
        elsif ($class eq 'Shadowknight') { quest::summonitem(59972); }
          # Spell: Spike of Disease
        elsif ($class eq 'Bard') { quest::summonitem(15703); }
          # Song: Chords of Dissonance
        elsif ($class eq 'Druid') { quest::summonitem(15242); }
          # Spell: Snare
        elsif ($class eq 'Cleric') { quest::summonitem(15014); }
          # Spell: Strike -- Guess. Alternative being Yaulp
        elsif ($class eq 'Shaman') { quest::summonitem(9983); }
          # Spell: Inner Fire* -- Should be a starting item for them
        elsif ($class eq 'Enchanter') { quest::summonitem(9987); }
          # Spell: Shallow Breath* -- Should be a starting item for them
        elsif ($class eq 'Magician') { quest::summonitem(15311); }
          # Spell: Summon Dagger -- Guess. Alternative would be Summon: Food
        elsif ($class eq 'Necromancer') { quest::summonitem(9986); }
          # Spell: Minor Shielding* -- So all casters have Minor Shielding.
        elsif ($class eq 'Wizard') { quest::summonitem(15054); }
          # Spell: Frost Bolt -- Guess (maybe Numbing Cold (59964) instead?)
      }
    } # end if (task)
  } # end if (blessed)
} 