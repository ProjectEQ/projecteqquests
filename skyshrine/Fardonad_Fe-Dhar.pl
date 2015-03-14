#Zone: Skyshrine
#Short Name: skyshrine
#Zone ID: 114
#
#NPC Name: Fardonad Fe`Dhar
#NPC ID: 114273

sub EVENT_SAY {
  if ($faction == 1) { #req ally CoV
    if($text=~/hail/i) {
      quest::say("Hail, most pious one. I sense the aura of your devotion and conviction and it is strong about you. A shame you are so short lived, mortal. But I see potential in you and for that I shall aid you in your calling if you are a cleric. Do you wish my aid?");
    }
    if ($text=~/i wish your aid/i) {
      quest::say("Then I have a set of goals for you. Once you have achieved them, you shall be rewarded with a helm, a breastplate, armplates, bracers, gauntlets, greaves and boots. May they protect you from your enemies.");
    }
    if ($text=~/helm/i) {
      quest::say("I shall craft a helm for you but you must seek these items out for me first. I have need of an unadorned plate helmet and three pieces of crushed onyx sapphire.");
    }
    if ($text=~/breastplate/i) {
      quest::say("As your faith protects you, so shall this breastplate. I must have an unadorned breastplate and three pieces of black marble.");
    }
    if ($text=~/armplate/i) {
      quest::say("Such lofty goals your kind sets for yourselves. But, that is the way of your kind, I suppose - to seek that which is the most difficult to attain. Bring to me a set of unadorned vambraces and three jaundice gems and you will receive your reward.");
    }
    if ($text=~/bracer/i) {
      quest::say("For the bracers, faithful one, I shall require the acquisition of an unadorned plate bracer as well as three crushed opals.");
    }
    if ($text=~/gauntlet/i) {
      quest::say("I will need a pair of unadorned gauntlets as well as three crushed lava rubies, so that I may make your reward.");
    }
    if ($text=~/greaves/i) {
      quest::say("You shall acquire a pair of unadorned plate greaves and three chipped onyx sapphires for me. I await your return.");
    }
    if ($text=~/boots/i) {
      quest::say("With your aid, I shall make a pair of fine boots for you. All that is needed are a pair of unadorned plate boots and three crushed flame emeralds.");
    }
  }
  else {
    quest::say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #req ally CoV 
    if (plugin::check_handin(\%itemcount, 25841 => 3, 24961 => 1)) { #cap
      quest::summonitem(31140);
    }
    elsif (plugin::check_handin(\%itemcount, 25805 => 3, 24956 => 1)) { #bp
      quest::summonitem(31141);
    }
    elsif (plugin::check_handin(\%itemcount, 25815 => 3, 24958 => 1)) { #arm
      quest::summonitem(31142);
    }
    elsif (plugin::check_handin(\%itemcount, 25836 => 3, 24960 => 1)) { #bracer
      quest::summonitem(31143);
    }
    elsif (plugin::check_handin(\%itemcount, 25840 => 3, 24962 => 1)) { #glove
      quest::summonitem(31144);
    }
    elsif (plugin::check_handin(\%itemcount, 25827 => 3, 24957 => 1)) { #leg
      quest::summonitem(31145);
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24959 => 1)) { #boots
      quest::summonitem(31146);
    }
    else {
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

#END of FILE Zone: skyshrine ID:114273 -- Fardonad_Fe`Dhar