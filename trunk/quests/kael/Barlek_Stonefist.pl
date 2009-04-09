#Zone: Kael Drakkal
#Short Name: kael
#Zone ID: 113
#
#NPC Name: Barlek Stonefist
#NPC ID: 113189

sub EVENT_SAY {
  if ($faction == 1) { #requires ally Kromzek faction
    if ($text=~/hail/i) {
      quest::say("Greetings to you. I seek the service of devout knights who have distinguished themselves. Are you a paladin? If not then be gone.");
    }
    if ($text=~/i am a paladin/i) {
      quest::say("A paladin of your order has not made it this far for quite some time. Well, I wonder what it is you seek here. Do you seek heroic and chivalrous deeds to distinguish yourself from your brethren? Do you need accoutrements to aid you in your battles perhaps? You are in luck, knight for I have both for you. Do you wish to partake of my quests?");
    }
    if ($text=~/partake of your quests/i) {
      quest::say("Excellent. By serving my cause, you, in turn, will further your own. I require certain components to aid me and if you bring them to me, I shall reward you for your honorable service. You may choose from among these items, a helm, a breastplate, armplates, bracers, gauntlets, greaves, and boots.");
    }
    if ($text=~/helm/i) {
      quest::say("All that I require is an ancient tarnished plate helmet and three pieces of crushed coral. This should be a small task for one such as you. Go now and I shall await your return.");
    }
    if ($text=~/breastplate/i) {
      quest::say("As the resolve of your faith shall protect you, so shall this breastplate. All that is required is an ancient tarnished breastplate, and three flawless diamonds. Do this quickly so that you may return to your place in the field of battle.");
    }
    if ($text=~/armplate/i) {
      quest::say("So, a pair of armplates, is what you require? Well, I require an ancient tarnished plate vambraces as well as three flawed emeralds before you will receive your prize.");
    }
    if ($text=~/bracer/i) {
      quest::say("Bracers for the mighty? Retrieve these components and I shall forge the item for you. Bring me an ancient tarnished plate bracelet as well as three crushed flame emeralds.");
    }
    if ($text=~/gauntlet/i) {
      quest::say("Mighty gauntlets to smite your foes for the glory of the greater good. It is no easy task but I shall require a pair of an ancient tarnished plate gauntlets and three crushed topaz.");
    }
    if ($text=~/greaves/i) {
      quest::say("Sturdy are the pillars that support the temple. I shall make you as strong with these leggings. Gather three flawed sapphires of the sea and a set of ancient tarnished plate greaves.");
    }
    if ($text=~/boots/i) {
      quest::say("A pair of boots you shall have once you have gotten a pair of an ancient tarnished plate boots and a set of three crushed pieces of black marble.");
    }
  }
  else {
    quest::say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #requires ally Kromzek faction
    if (plugin::check_handin(\%itemcount, 25831 => 3, 24905 => 1)) { # cap
      quest::summonitem(25370);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24900 => 1)) { # bp
      quest::summonitem(25371);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24902 => 1)) { # sleeves
      quest::summonitem(25372);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24904 => 1)) { # wrist
      quest::summonitem(25373);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24906 => 1)) { # gloves
      quest::summonitem(25374);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24901 => 1)) { # legs
      quest::summonitem(25375);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24903 => 1)) { # boots
      quest::summonitem(25376);
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

#END of FILE Zone: kael ID:113189 -- Barlek_Stonefist

