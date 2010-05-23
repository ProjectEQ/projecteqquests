#Zone: Skyshrine
#Short Name: skyshrine
#Zone ID: 114
#
#NPC Name: Qynydd Fe`Dhar
#NPC ID: 114272

sub EVENT_SAY {
  if ($faction == 1) { #req ally CoV
    if($text=~/hail/i) {
      quest::say("Greetings to you. I seek one who calls himself a druid. What do you call yourself, manling?");
    }
    if ($text=~/i am a druid/i) {
      quest::say("Good. I had hoped you were one. As nature's guardian, you fight the never-ending struggle against those who seek to defile it. It is an admirable quality and I wish to aid you. I will provide you with a cap, a tunic, sleeves, bracers, gloves, leggings and boots.");
    }
    if ($text=~/cap/i) {
      quest::say("I shall weave one of exceptional quality for you but you must gather the ingredients first. I require an unadorned leather cap and three crushed onyx sapphires.");
    }
    if ($text=~/tunic/i) {
      quest::say("You shall be a force of nature with this tunic. Once I have gained an unadorned leather tunic and three pieces of black marble, the item is yours.");
    }
    if ($text=~/sleeves/i) {
      quest::say("As the bark protects the limbs of the tree, so shall these sleeves protect your arms. Bring me a pair of unadorned leather sleeves and three jaundice gems.");
    }
    if ($text=~/bracer/i) {
      quest::say("For a bracer I shall require an unadorned leather bracelet as well as three crushed opals. Do this and the reward shall be yours to keep.");
    }
    if ($text=~/gloves/i) {
      quest::say("The gloves shall help protect you from the elements and harm. In order for me to complete them, I require a pair of unadorned leather gloves and three crushed lava rubies.");
    }
    if ($text=~/leggings/i) {
      quest::say("As the roots support the mighty oak, so shall these leggings support you. Furnish me three chipped onyx sapphires and a pair of unadorned leather leggings.");
    }
    if ($text=~/boots/i) {
      quest::say("Even the swiftest feet need protection so I shall provide you with these. They should help. Acquire a pair of unadorned boots and a set of three crushed flame emeralds and a new set of boots will be yours.");
    }
  }
  else {
    quest::say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #req ally CoV 
    if (plugin::check_handin(\%itemcount, 25841 => 3, 24975 => 1)) { #cap
      quest::summonitem(31147);
    }
    elsif (plugin::check_handin(\%itemcount, 25805 => 3, 24970 => 1)) { #bp
      quest::summonitem(31148);
    }
    elsif (plugin::check_handin(\%itemcount, 25815 => 3, 24972 => 1)) { #arm
      quest::summonitem(31149);
    }
    elsif (plugin::check_handin(\%itemcount, 25836 => 3, 24974 => 1)) { #bracer
      quest::summonitem(31150);
    }
    elsif (plugin::check_handin(\%itemcount, 25840 => 3, 24976 => 1)) { #glove
      quest::summonitem(31151);
    }
    elsif (plugin::check_handin(\%itemcount, 25827 => 3, 24971 => 1)) { #leg
      quest::summonitem(31152);
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24973 => 1)) { #boots
      quest::summonitem(31153);
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

#END of FILE Zone: skyshrine ID:114272 -- Qynydd_Fe`Dhar