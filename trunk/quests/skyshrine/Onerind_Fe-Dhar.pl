#Zone: Skyshrine
#Short Name: skyshrine
#Zone ID: 114
#
#NPC Name: Onerind Fe`Dhar
#NPC ID: 114264

sub EVENT_SAY {
  if ($faction == 1) { #req ally CoV
    if($text=~/hail/i) {
      quest::emote("looks around.");
      quest::say("Who dares address me? Oh, it is you. What is it you want? Some armor perhaps? To make a pretty corpse? There is something exquisite about a well-dressed meal. If you are not a shadowknight leave me now or you may end up as my next meal.");
    }
    if ($text=~/armor/i) {
      quest::emote("laughs deeply.");
      quest::say("You manlings are so transparent. Well, if armor is what you wish, then only the best shall you have for I will not waste my time on less than the best. This is what I will make for you, granted that you can acquire the components for me - a helm, breastplate, armplates, bracers, gauntlets, leggings, and boots.");
    }
    if ($text=~/helm/i) {
      quest::say("For the helm I shall require an unadorned plate helmet and three pieces of crushed coral for my trouble. Does your tiny mind comprehend the task set before you? If so, then get them immediately! I am beginning to get hungry and you are looking all the better as a snack.");
    }
    if ($text=~/breastplate/i) {
      quest::say("For the breastplate, I require an unadorned breastplate and three flawless diamonds. Nothing more, nothing less. For perfection, there is a price, insignificant one.");
    }
    if ($text=~/armplate/i) {
      quest::say("For the armplates, I need these components - unadorned plate vambraces as well as three flawed emeralds. Now go and fetch them before I change my mind.");
    }
    if ($text=~/bracer/i) {
      quest::say("For the bracers, I will require an unadorned plate bracer and a set of three crushed flame emeralds. Now go away before I use your insides as decoration for my gullet.");
    }
    if ($text=~/gauntlet/i) {
      quest::say("Your hands are quite important, aren't they? For without them, you cannot use your precious weapons or shields to protect yourselves. You humor me with your feeble attempts. Fetch me a set of unadorned plate gauntlets and three crushed topaz for your precious little gauntlets.");
    }
    if ($text=~/legging/i) {
      quest::say("Legs?? They are my favorite part of a meal. Some of my brethren consider them too tough, but I like them chewy. Don't you agree? Oh, yes, where was I? The leggings. Go and retrieve unadorned plate greaves as well as three flawed sea sapphires. Leave my sight before I sample one of yours.");
    }
    if ($text=~/boots/i) {
      quest::say("You wish to have a pair of boots? Then acquire these items for me. Three pieces of crushed black marble and a pair of unadorned plate boots. I tire of your prattle. Go away now.");
    }
  }
  else {
    quest::say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #req ally CoV 
    if (plugin::check_handin(\%itemcount, 25831 => 3, 24961 => 1)) { #cap
      quest::summonitem(31098);
    }
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24956 => 1)) { #bp
      quest::summonitem(31099);
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24958 => 1)) { #arm
      quest::summonitem(31100);
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24960 => 1)) { #bracer
      quest::summonitem(31101);
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24962 => 1)) { #glove
      quest::summonitem(31102);
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24957 => 1)) { #leg
      quest::summonitem(31103);
    }
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24959 => 1)) { #boots
      quest::summonitem(31104);
    }
    else {
      quest::say("I can do nothing with these items, $name.");
      plugin::return_items(\%itemcount);
      return 1;
    }
    quest::emote("smiles warmly as he hands you your reward.");
    quest::say("Well done, $name.");
    quest::exp(175000);
    quest::faction(42,30); # CoV
    quest::faction(362,30); # Yelinak
    quest::faction(189,-60); # Kromzek
  }
  else {
    quest::say("I do not know you well enough to entrust such an item to you, yet.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone: skyshrine ID:114264 -- Onerind_Fe`Dhar