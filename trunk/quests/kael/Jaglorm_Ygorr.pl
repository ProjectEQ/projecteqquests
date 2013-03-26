#Zone: Kael Drakkal
#Short Name: kael
#Zone ID: 113
#
#NPC Name: Jaglorm Ygorr
#NPC ID: 113160

sub EVENT_SAY {
  if ($faction == 1) { #requires ally Kromzek faction
    if ($text=~/hail/i) {
      quest::say("Greetings to you. I seek one that calls himself a druid. What do you call yourself, manling?");
    }
    if ($text=~/i am a druid/i) {
      quest::say("Good. I had hoped you were one. As nature's guardian, you fight the never-ending struggle against those who seek to defile it. It is an admirable quality and I wish to aid you. I will provide you with a cap, a tunic, sleeves, bracers, gloves, leggings and boots.");
    }
    if ($text=~/cap/i) {
      quest::say("I shall weave one of exceptional quality for you but you must gather the ingredients first. I require an ancient leather cap and three crushed onyx sapphires.");
    }
    if ($text=~/tunic/i) {
      quest::say("You shall be a force of nature with this tunic. Once I have gained an ancient leather tunic and three pieces of black marble the item is yours.");
    }
    if ($text=~/sleeves/i) {
      quest::say("As the bark protects the limbs of the tree, so shall these sleeves protect your arms. Bring me a pair of an ancient leather sleeves and three jaundice gems.");
    }
    if ($text=~/bracer/i) {
      quest::say("For a bracer I shall require an ancient leather bracelet, and three crushed opals. Do this and the reward shall be yours to keep.");
    }
    if ($text=~/gloves/i) {
      quest::say("The gloves shall help protect you from the elements and harm. In order for me to complete them I require a pair of an ancient leather gloves and three crushed lava rubys.");
    }
    if ($text=~/leggings/i) {
      quest::say("As the roots support the mighty oak, so shall these leggings support you. Furnish a pair of an ancient leather leggings as well as three chipped onyx sapphires and they are yours.");
    }
    if ($text=~/boots/i) {
      quest::say("Even the swiftest feet need protection so I shall provide you with these. They should help. Acquire a pair of ancient boots and three crushed flame emeralds.");
    }
  }
  else {
    quest::say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #requires ally Kromzek faction
    if (plugin::check_handin(\%itemcount, 25841 => 3, 24919 => 1)) { # cap
      quest::summonitem(25398);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25805 => 3, 24914 => 1)) { # bp
      quest::summonitem(25399);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25815 => 3, 24916 => 1)) { # sleeves
      quest::summonitem(25400);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25836 => 3, 24918 => 1)) { # wrist
      quest::summonitem(25401);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25840 => 3, 24920 => 1)) { # gloves
      quest::summonitem(25402);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25827 => 3, 24915 => 1)) { # legs
      quest::summonitem(25403);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24917 => 1)) { # boots
      quest::summonitem(25404);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    else {
      plugin::return_items(\%itemcount); 
    }
  }
  else {
    quest::say("I do not know you well enough to entrust you with such an item, yet.");
  }
}

#END of FILE Zone: kael ID:113160 -- Jaglorm_Ygorr

