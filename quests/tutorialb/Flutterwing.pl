#zone: tutorialb
#quest: Flutterwing's sibling
#site3op

sub EVENT_SAY{
  if($text=~/hail/i) {
    quest::say("Hello there $name. Please don't hurt me, I may be the last of my lineage since the [theft]");
  }
  if($text=~/theft/i) {
    quest::emote("saddens and lets out a sigh.");
    quest::say("My unhatched sibling was stolen from our nest by a nasty kobold. I'm afraid the worst might have happened. Would you please search for the [egg] during your journeys in the mines?");
  }
  if($text=~/egg/i) {
    quest::say("Well of course an egg $class. How do you think us dragons are born? If you would return this egg to me or what is left, I will reward you.");
  }
}

sub EVENT_ITEM{
  if($itemcount{54603} == 1) {
    quest::emote("beams with glee.");
    quest::say("Oh $name how can I ever repay such kindness. I will not be alone in this dreadful place after all. Please accept this small token.");
    quest::exp(25);
    if($class eq 'Warrior'){quest::summonitem(38005);}
    elsif($class eq 'Cleric'){quest::summonitem(38173);}
    elsif($class eq 'Paladin'){quest::summonitem(38089);}
    elsif($class eq 'Ranger'){quest::summonitem(38110);}
    elsif($class eq 'Shadowknight'){quest::summonitem(38068);}
    elsif($class eq 'Druid'){quest::summonitem(38194);}
    elsif($class eq 'Monk'){quest::summonitem(38026);}
    elsif($class eq 'Bard'){quest::summonitem(38152);}
    elsif($class eq 'Rogue'){quest::summonitem(38047);}
    elsif($class eq 'Shaman'){quest::summonitem(38215);}
    elsif($class eq 'Necromancer'){quest::summonitem(38299);}
    elsif($class eq 'Wizard'){quest::summonitem(38236);}
    elsif($class eq 'Magician'){quest::summonitem(38257);}
    elsif($class eq 'Enchanter'){quest::summonitem(38278);}
    elsif($class eq 'Beastlord'){quest::summonitem(38131);}
    elsif($class eq 'Berserker'){quest::summonitem(38320);}
  }
}