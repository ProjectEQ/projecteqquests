#Zone: Kael Drakkal
#Short Name: kael
#Zone ID: 113
#
#NPC Name: Vylleam Vyaeltor
#NPC ID: 113185

sub EVENT_SAY {
  if ($faction == 1) { #requires ally Kromzek faction
    if ($text=~/hail/i) {
      quest::emote("bows.");
      quest::doanim(24);
      quest::say("Greetings to you. You are far away from your homelands, stranger. I am looking for someone. Someone that the outlanders call a cleric. Are you a cleric?");
    }
    if ($text=~/i am a cleric/i) {
      quest::say("Ahhh... most pious one. I sense the aura of your devotion and conviction and it is strong about you. A shame you are so short lived, mortal. But I see potential in you and for that I shall aid you in your calling. Do you wish my aid?");
    }
    if ($text=~/i wish your aid/i) {
      quest::say("Then I have a set of goals for you. Once you have achieved them, you shall be rewarded with such as these; a helm, a breastplate, armplates, bracers, gauntlets, greaves and boots. May they protect you from your enemies.");
    }
    if ($text=~/helm/i) {
      quest::say("I shall craft a helm for you but you must seek these items out for me first. I have need of an ancient tarnished plate helmet and three crushed onyx sapphires.");
    }
    if ($text=~/breastplate/i) {
      quest::say("Such as your faith protects you so shall this breastplate. I must have an ancient tarnished breastplate and three pieces of black marble.");
    }
    if ($text=~/armplate/i) {
      quest::say("For the armplates, I shall require a pair of an ancient tarnished plate armplates as well as three jaundice gems. Go forth and seek these out.");
    }
    if ($text=~/bracer/i) {
      quest::say("For the bracers, faithful one, I shall require the acquisition of an ancient tarnished plate bracer and three crushed opals.");
    }
    if ($text=~/gauntlet/i) {
      quest::say("I will need a pair of a ancient tarnished gauntlets three crushed lava rubys, so that I may make your reward.");
    }
    if ($text=~/greaves/i) {
      quest::say("You shall acquire a pair of an ancient tarnished plate greaves and three chipped onyx sapphires for me. I await your return.");
    }
    if ($text=~/boots/i) {
      quest::say("With your aid I shall make a pair of fine boots for you. All that is needed is a pair of an ancient tarnished plate boots and a trilogy of crushed flame emeralds.");
    }
  }
  else {
    quest::say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #requires ally Kromzek faction
    if (plugin::check_handin(\%itemcount, 25841 => 3, 24905 => 1)) { # cap
      quest::summonitem(25391);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25805 => 3, 24900 => 1)) { # bp
      quest::summonitem(25392);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25815 => 3, 24902 => 1)) { # sleeves
      quest::summonitem(25393);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25836 => 3, 24904 => 1)) { # wrist
      quest::summonitem(25394);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25840 => 3, 24906 => 1)) { # gloves
      quest::summonitem(25395);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25827 => 3, 24901 => 1)) { # legs
      quest::summonitem(25396);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24903 => 1)) { # boots
      quest::summonitem(25397);
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

#END of FILE Zone: kael ID:113185 -- Vylleam_Vyaeltor

