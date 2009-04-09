#Zone: Kael Drakkal
#Short Name: kael
#Zone ID: 113
#
#NPC Name: Yeeldan Spiritcaller
#NPC ID: 113184

sub EVENT_SAY {
  if ($faction == 1) { #requires ally Kromzek faction
    if ($text=~/hail/i) {
      quest::emote("speaks in a rumbling tone.");
      quest::say("Greetings. I only wish to speak to a shaman. Are you what I seek?");
    }
    if ($text=~/i am a shaman/i) {
      quest::say("I sense the spirit of your totem within you and it is strong with power. You have learned much from your travels and I shall help you, by providing you with protection from harm and the elements, in the form of armor");
    }
    if ($text=~/armor/i) {
      quest::say("For you I shall make a coif, breastplate, sleeves, bracers, gauntlets, leggings, and boots. Each piece is a quest unto itself. To seek the components, you must search the lands for them and test the power of the spirit within.");
    }
    if ($text=~/coif/i) {
      quest::say("The coif I shall make will be comprised of an ancient tarnished coif and three crushed onyx sapphires. I shall be waiting.");
    }
    if ($text=~/breastplate/i) {
      quest::say("A breastplate to protect the spirit within. I shall make one for you granted that you retrieve the components I shall need. An ancient tarnished chain tunic and three pieces of black marble. I await your return.");
    }
    if ($text=~/sleeves/i) {
      quest::say("Sleeves I shall make upon receipt of three jaundice gems and an ancient tarnished chain sleeve. Complete this simple task and they are yours.");
    }
    if ($text=~/bracer/i) {
      quest::say("A bracer of mystic power I shall grant you. All I require is the acquisition of an ancient tarnished chain bracer and three crushed opal.");
    }
    if ($text=~/gauntlets/i) {
      quest::say("I shall require an ancient tarnished pair of chain gauntlets and three crushed lava rubys to complete my ritual.");
    }
    if ($text=~/leggings/i) {
      quest::say("You seek leggings? Then provide for me, three chipped onyx and a pair of ancient tarnished chain leggings. I will give these to you for your service.");
    }
    if ($text=~/boots/i) {
      quest::say("These boots will help you in your battles to come. I shall grant them upon receipt of three crushed flame emeralds and a pair of an ancient tarnished chain boots.");
    }
  }
  else {
    quest::say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #requires ally Kromzek faction
    if (plugin::check_handin(\%itemcount, 25841 => 3, 24912 => 1)) { # cap
      quest::summonitem(25356);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25805 => 3, 24907 => 1)) { # bp
      quest::summonitem(25357);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25815 => 3, 24909 => 1)) { # sleeves
      quest::summonitem(25358);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25836 => 3, 24911 => 1)) { # wrist
      quest::summonitem(25359);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25840 => 3, 24913 => 1)) { # gloves
      quest::summonitem(25360);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25632 => 3, 24908 => 1)) { # legs
      quest::summonitem(25361);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24910 => 1)) { # boots
      quest::summonitem(25362);
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
      quest::say("These are not the pieces I need.");
    }
  }
  else {
    quest::say("I do not know you well enough to entrust you with such an item, yet.");
  }
}

#END of FILE Zone: kael ID:113184 -- Yeeldan_Spiritcaller

