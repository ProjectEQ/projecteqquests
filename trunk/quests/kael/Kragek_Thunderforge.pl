#Zone: Kael Drakkal
#Short Name: kael
#Zone ID: 113
#
#NPC Name: Kragek Thunderforge
#NPC ID: 113158

sub EVENT_SAY {
  if ($faction == 1) { #requires ally Kromzek faction
    if ($text=~/hail/i) {
      quest::say("Greetings to you. I seek the service of a powerful warrior. Are you a warrior? If not then be gone.");
    }
    if ($text=~/i am a warrior/i) {
      quest::say("Excellent. I see that you are a seasoned veteran of many battles. I admire your strength and ferocity. Life is but a series of battles, is it not?");
    }
    if ($text=~/life is a series of battles/i) {
      quest::say("We share the same view then. I wish to test your skills in battle. Not with me of course, for I will destroy you where you stand. Instead I wish for you to retrieve some trinkets for me and once I have them I will reward you handsomely with a helm, a breastplate, armplates, bracers, gauntlets, greaves, or boots.");
    }
    if ($text=~/helm/i) {
      quest::say("All I require are an ancient tarnished plate helmet and three crushed coral pieces. This should be a small task for one such as you. Go now and I shall await your return.");
    }
    if ($text=~/breastplate/i) {
      quest::say("As the resolve of your discipline and strength shall endure through a battle, so shall this breastplate. All that is required are an ancient tarnished breastplate, and three flawless diamonds. Do this quickly so that you may return to the field of battle.");
    }
    if ($text=~/armplate/i) {
      quest::say("So, a pair of armplates, is what you require? Well, I require ancient tarnished plate vambraces, and three flawed emeralds before you may receive it. May your deeds be spread throughout the lands!");
    }
    if ($text=~/bracer/i) {
      quest::say("Bracers for the mighty? Retrieve these components and I shall forge the item for you. Bring me ancient tarnished plate bracers and three crushed flame emeralds.");
    }
    if ($text=~/gauntlet/i) {
      quest::say("Mighty gauntlets to aid in obliterating your foes, eh? It is no easy task but I shall require a pair of ancient tarnished plate gauntlets and three crushed topazes. Hurry along, $race.");
    }
    if ($text=~/greaves/i) {
      quest::say("Strength and balance are important, are they not? I shall help give you an advantage with these greaves. Gather three flawed sea sapphires and ancient tarnished plate greaves.");
    }
    if ($text=~/boots/i) {
      quest::say("'A pair of boots you shall have once you have acquired a pair of ancient tarnished plate boots and three crushed black marbles.");
    }
  }
  else {
    quest::say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #requires ally Kromzek faction
    if (plugin::check_handin(\%itemcount, 25831 => 3, 24905 => 1)) { # cap
      quest::summonitem(25433);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24900 => 1)) { # bp
      quest::summonitem(25434);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24902 => 1)) { # sleeves
      quest::summonitem(25435);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24904 => 1)) { # wrist
      quest::summonitem(25436);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24906 => 1)) { # gloves
      quest::summonitem(25437);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24901 => 1)) { # legs
      quest::summonitem(25438);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24903 => 1)) { # boots
      quest::summonitem(25439);
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

#END of FILE Zone: kael ID:113158 -- Kragek_Thunderforge

