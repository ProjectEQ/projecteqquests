#Zone: Kael Drakkal
#Short Name: kael
#Zone ID: 113
#
#NPC Name: Kelenek Bluadfeth
#NPC ID: 113157

sub EVENT_SAY {
  if ($faction == 1) { #requires ally Kromzek faction
    if ($text=~/hail/i) {
      quest::say("What do we have here? A cutthroat, perhaps? If not then go away, for I have words to speak with a rogue.");
    }
    if ($text=~/i am a rogue/i) {
      quest::say("I commend you on your skill, making it this far. I have a job for you, thief. Several in fact and quite simple for an assassin such as yourself. I am in need of certain components and will reward you well if they are brought to me. Do I have your services?");
    }
    if ($text=~/you have my services/i) {
      quest::say("Excellent. Now, down to business. I shall pay you in trade for the items I seek. What I have for you is as such, a coif, a breastplate, armplates, bracers, gauntlets, greaves and boots. These should aid you in your skullduggery.");
    }
    if ($text=~/coif/i) {
      quest::say("I am need of an ancient tarnished chain coif and three crushed pieces of coral. For your services I shall give you a coif suitable for one such as you.");
    }
    if ($text=~/breastplate/i) {
      quest::say("For the breastplate you must seek out an ancient tarnished chain tunic and three flawless diamonds. Only then will you receive a breastplate of my crafting.");
    }
    if ($text=~/armplate/i) {
      quest::say("For the armplates I shall give you, I require this; an ancient tarnished chain sleeves and three flawed emeralds.");
    }
    if ($text=~/bracer/i) {
      quest::say("An ancient tarnished bracer and three crushed flame emeralds is what I require of you. A bracer of my making is your reward.");
    }
    if ($text=~/gauntlets/i) {
      quest::say("I need an ancient tarnished chain gauntlets as well as three crushed topaz. Once I have these you shall have your reward.");
    }
    if ($text=~/greaves/i) {
      quest::say("A pair of leggings will be your once you completed this task for me, thief. Bring unto me a pair of ancient tarnished chain leggings and a trilogy of flawed sea sapphires.");
    }
    if ($text=~/boots/i) {
      quest::say("A fine pair of boots shall you have to skulk around in, once I have a pair of an ancient tarnished chain boots and three pieces of crushed black marble.");
    }
  }
  else {
    quest::say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #requires ally Kromzek faction
    if (plugin::check_handin(\%itemcount, 25831 => 3, 24912 => 1)) { # cap
      quest::summonitem(25377);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24907 => 1)) { # bp
      quest::summonitem(25378);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24909 => 1)) { # sleeves
      quest::summonitem(25379);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24911 => 1)) { # wrist
      quest::summonitem(25380);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24913 => 1)) { # gloves
      quest::summonitem(25381);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24908 => 1)) { # legs
      quest::summonitem(25382);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24910 => 1)) { # boots
      quest::summonitem(25383);
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

#END of FILE Zone: kael ID:113190 -- Gragek_Mjlorkigar

