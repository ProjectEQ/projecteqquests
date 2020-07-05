#Zone: Kael Drakkal
#Short Name: kael
#Zone ID: 113
#
#NPC Name: Dagron Stonecutter
#NPC ID: 113188
# items: 25831, 24919, 25440, 25814, 24914, 25441, 25821, 24916, 25442, 25838, 24918, 25443, 25832, 24920, 25444, 25825, 24915, 25445, 25833, 24917, 25446

sub EVENT_SAY {
  if ($faction == 1) { #requires ally Kromzek faction
    if ($text=~/hail/i) {
      quest::say("Greetings to you. I seek one who has chosen the path of monkhood. What do you call yourself?");
    }
    if ($text=~/i am a monk/i) {
      quest::say("Good. I had hoped you were one. As seeker of the way you are in constant training to push yourself to your physical and mental limits. It is an admirable quality and I wish to aid you. I will provide you with a cap, a tunic, sleeves, bracers, gloves, leggings and boots.");
    }
    if ($text=~/cap/i) {
      quest::say("I shall weave one of exceptional quality for you but you must gather the items first. I require an ancient leather cap and a set of three pieces of crushed coral.");
    }
    if ($text=~/tunic/i) {
      quest::say("You shall be an imposing force with this tunic. Solid as the unmoving mountains, it shall protect you. Once I have gained an ancient leather tunic and three flawless diamonds, the item is yours.");
    }
    if ($text=~/sleeves/i) {
      quest::say("As the mighty stone that parts the flow of water, so shall these sleeves divert harm against you. Bring me three flawed emeralds and a pair of ancient leather sleeves.");
    }
    if ($text=~/bracer/i) {
      quest::say("For a bracer I shall require an ancient leather bracelet and a set of three crushed flame emeralds. Do this and the reward shall be yours to keep.");
    }
    if ($text=~/gloves/i) {
      quest::say("Your hands are like the wind, everflowing and moving. Subtle one moment, then a howling wind raining blow upon blow to your foes. These gloves shall aid you. In order to complete them I require a pair of ancient leather gloves and three crushed topaz.");
    }
    if ($text=~/leggings/i) {
      quest::say("The leggings shall protect you, as the valley shelters the still pool within its center from the howling winds. Furnish a pair of ancient leather leggings and a set of three flawed sea sapphires for me and they are yours.");
    }
    if ($text=~/boots/i) {
      quest::say("Your feet are hard as any stone and as swift as a coiled serpent but even the swiftest feet require protection so I shall provide you with these. They should help. Acquire a pair of ancient tarnished boots and three crushed pieces of black marble.");
    }
  }
  else {
    quest::say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #requires ally Kromzek faction
    if (plugin::check_handin(\%itemcount, 25831 => 3, 24919 => 1)) { # cap
      quest::summonitem(25440); # Item: Golden Star Headband
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24914 => 1)) { # bp
      quest::summonitem(25441); # Item: Golden Star Chest Wraps
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24916 => 1)) { # sleeves
      quest::summonitem(25442); # Item: Golden Star Arm Wraps
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24918 => 1)) { # wrist
      quest::summonitem(25443); # Item: Golden Star Wrist Wraps
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24920 => 1)) { # gloves
      quest::summonitem(25444); # Item: Fist of the Golden Star
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24915 => 1)) { # legs
      quest::summonitem(25445); # Item: Golden Star Pants
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24917 => 1)) { # boots
      quest::summonitem(25446); # Item: Golden Star Slippers
      quest::exp(150000);
      quest::faction(429,20); # King Tormax
      quest::faction(448,20); # Kromzek
      quest::faction(430,-20); # Claws of Veeshan
      quest::faction(406,-60); # Coldain
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

#END of FILE Zone: kael ID:113188 -- Dagron_Stonecutter

