#zone: tutorialb
#quest: Flutterwing's sibling
#site3op
# items: 54603, 38005, 38173, 38089, 38110, 38068, 38194, 38026, 38152, 38047, 38215, 38299, 38236, 38257, 38278, 38131, 38320, 13014

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::signal(189022,0); #Rashere
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 54603 => 1)) { #Flutterwing's Unhatched Sibling
    quest::emote("beams with glee.");
    quest::say("Oh, $name, how can I ever repay such kindness. I will not be alone in this dreadful place after all. Please accept this small token.");
    quest::exp(500);
    quest::ding();
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
  if(plugin::check_handin(\%itemcount, 13014 => 1)) { #Muffin
    quest::emote("snatches the muffin from you as you barely manage to keep your fingers.");
    quest::exp(25);
  }
  plugin::return_items(\%itemcount);
}