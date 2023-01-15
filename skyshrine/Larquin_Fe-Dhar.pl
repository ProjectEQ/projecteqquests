#Zone: Skyshrine
#Short Name: skyshrine
#Zone ID: 114
#
#NPC Name: Larquin Fe`Dhar
#NPC ID: 114274
# items: 25831, 24975, 5446, 25814, 24970, 5447, 25821, 24972, 5448, 25838, 24974, 5449, 25832, 24976, 5450, 25825, 24971, 5451, 25833, 24973, 5452

sub EVENT_SAY {
  if ($faction == 1) { #req ally CoV
    if($text=~/hail/i) {
      quest::say("Greetings, I am looking for one who is one with the wild beasts of the world. Do you call yourself a Beastlord?");
    }
    if ($text=~/i am a beastlord/i) {
      quest::say("I have been waiting for one such as you to arrive. I have some equipment that is worthy of a great Beastlord. I have a cap, leggings, tunic, bracer, boots, sleeves, and gloves if you think you are worthy.");
    }
    if ($text=~/cap/i) {
      quest::say("I shall weave one of exceptional quality for you but you must gather the items first. I require an unadorned leather cap and three pieces of crushed coral.");
    }
    if ($text=~/tunic/i) {
      quest::say("You shall be an imposing force with this tunic. Solid as the unmoving mountains, it shall protect you. Once I have gained a set of three flawless diamonds and an unadorned leather tunic.");
    }
    if ($text=~/sleeves/i) {
      quest::say("As the mighty stone that parts the flow of water, so shall these sleeves divert harm against you. Bring me a pair of unadorned leather sleeves and three flawed emeralds.");
    }
    if ($text=~/bracer/i) {
      quest::say("For a bracer I shall require three crushed flame emeralds and an unadorned leather bracelet. Bring me these items and the reward shall be yours to keep.");
    }
    if ($text=~/gloves/i) {
      quest::say("Your hands are like the wind, everflowing and moving. Subtle one moment, then a howling wind raining blow upon blow to your foes. These gloves shall aid you. In order for me to complete them, I require a pair of unadorned leather gloves and three crushed topaz.");
    }
    if ($text=~/leggings/i) {
      quest::say("The leggings shall protect you, as the valley shelters the still pool within it from the howling winds. Furnish a pair of unadorned leather leggings and three flawed sea sapphires.");
    }
    if ($text=~/boots/i) {
      quest::say("Your feet are as hard as any stone and as swift as a coiled serpent but even the swiftest feet require protection so I shall provide you with these. They should help. Acquire a pair of unadorned leather boots and three crushed pieces of black marble.");
    }
  }
  else {
    quest::say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #req ally CoV 
    if (plugin::check_handin(\%itemcount, 25831 => 3, 24975 => 1)) { #cap
      quest::summonitem(5446); # Item: Savage Helm
    }
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24970 => 1)) { #bp
      quest::summonitem(5447); # Item: Savage Chestguard
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24972 => 1)) { #arm
      quest::summonitem(5448); # Item: Savage Armband
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24974 => 1)) { #bracer
      quest::summonitem(5449); # Item: Savage Bracer
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24976 => 1)) { #glove
      quest::summonitem(5450); # Item: Savage Gloves
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24971 => 1)) { #leg
      quest::summonitem(5451); # Item: Savage Leggings
    }
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24973 => 1)) { #boots
      quest::summonitem(5452); # Item: Savage Boots
    }
    else {
      plugin::return_items(\%itemcount);
      return 1;
    }
    quest::emote("smiles warmly as he hands you your reward.");
    quest::say("Well done, $name.");
    quest::exp(175000);
    quest::faction(430,30); # CoV
    quest::faction(436,30); # Yelinak
    quest::faction(448,-60); # Kromzek
  }
  else {
    quest::say("I do not know you well enough to entrust such an item to you, yet.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone: skyshrine ID:114274 -- Larquin_Fe`Dhar
