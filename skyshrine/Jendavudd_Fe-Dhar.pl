#Zone: Skyshrine
#Short Name: skyshrine
#Zone ID: 114
#
#NPC Name: Jendavudd Fe`Dhar
#NPC ID: 114262

sub EVENT_SAY {
  if ($faction == 1) { #req ally CoV
    if($text=~/hail/i) {
      quest::say("Greetings to you. I seek the service of a powerful warrior. If you are not what I seek leave me be.");
    }
    if ($text=~/i am a warrior/i) {
      quest::say("Excellent. I admire strength and ferocity. Life is but a series of battles, is it not?");
    }
    if ($text=~/life is a series of battles/i) {
      quest::say("We share the same view then. I wish to test your skills in battle. Not with me of course, for I will destroy you where you stand. Instead I wish for you to retrieve some trinkets for me and once I have them I will reward you handsomely with a helm, a breastplate, armplates, bracers, gauntlets, greaves, or boots.");
    }
    if ($text=~/helm/i) {
      quest::say("All I require are an unadorned plate helmet and three pieces of crushed coral. This should be a small task for one such as you. Go now and I shall await your return.");
    }
    if ($text=~/breastplate/i) {
      quest::say("As the resolve of your discipline and strength shall endure through a battle, so shall this breastplate. All I required are an unadorned breastplate, and three flawless diamonds. Do this quickly so that you may return to the field of battle.");
    }
    if ($text=~/armplate/i) {
      quest::say("So, a pair of armplates is what you require? Well, I require unadorned plate vambraces, as well as three flawed emeralds before you may receive them. May your deeds be spread throughout the lands!");
    }
    if ($text=~/bracer/i) {
      quest::say("Bracers for the mighty? Retrieve these components and I shall forge the item for you. Bring me an unadorned plate and three crushed flame emeralds.");
    }
    if ($text=~/gauntlet/i) {
      quest::say("Mighty gauntlets to aid in obliterating your foes, eh? It is no easy task but I shall require a pair of unadorned plate gauntlets and three crushed topaz.");
    }
    if ($text=~/greaves/i) {
      quest::say("Strength and balance are important, are they not? I shall help give you an advantage with these leggings. Gather for me three flawed sea sapphires and a set of unadorned plate greaves.");
    }
    if ($text=~/boots/i) {
      quest::say("A pair of boots you shall have once you have gotten a pair of unadorned plate boots as well as three pieces of crushed black marble.");
    }
  }
  else {
    quest::say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #req ally CoV 
    if (plugin::check_handin(\%itemcount, 25831 => 3, 24961 => 1)) { #cap
      quest::summonitem(31182);
    }
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24956 => 1)) { #bp
      quest::summonitem(31183);
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24958 => 1)) { #arm
      quest::summonitem(31184);
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24960 => 1)) { #bracer
      quest::summonitem(31185);
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24962 => 1)) { #glove
      quest::summonitem(31186);
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24957 => 1)) { #leg
      quest::summonitem(31187);
    }
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24959 => 1)) { #boots
      quest::summonitem(31188);
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

#END of FILE Zone: skyshrine ID:114262 -- Jendavudd_Fe`Dhar