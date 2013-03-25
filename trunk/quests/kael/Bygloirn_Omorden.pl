#Zone: Kael Drakkal
#Short Name: kael
#Zone ID: 113
#
#NPC Name: Bygloirn Omorden
#NPC ID: 113183

sub EVENT_SAY {
  if ($faction == 1) { #requires ally Kromzek faction
    if ($text=~/hail/i) {
      quest::say("Hail! I long to speak with a minstrel. I am curious about what has gone on beyond our borders here. Are you a bard? If not then I have no use for you.");
    }
    if ($text=~/i am a bard/i) {
      quest::say("So troubadour, what news and stories have you from the New World? Oh, I forget my manners. We shall exchange talk another time. You seek something do you not? A new outfit perhaps?");
    }
    if ($text=~/i seek a new outfit/i) {
      quest::say("Well then, I have just what you need. Now, my terms of
payment is thus, you gather some things for me and in return I shall craft you the finest armor a bard has ever seen! A new outfit comprised of a helm, breastplate, armplates, bracers, gauntlets, greaves, and boots shall make you the envy of your peers, my little friend.");
    }
    if ($text=~/helm/i) {
      quest::say("A brand new shiny helm shall be yours once I have an ancient tarnished plate helmet and three pieces of crushed coral. May the audience swoon in your presence.");
    }
    if ($text=~/breastplate/i) {
      quest::say("I have need of an ancient tarnished breastplate and three
flawless diamonds. Find these for me and I shall craft you a breastplate, minstrel. May it protect you from unruly audiences with rotten vegetables.");
    }
    if ($text=~/armplate/i) {
      quest::say("A gorgeous pair of armplates shall be yours once you have
retrieved a pair of ancient tarnished plate vambraces and three flawed emeralds. The detail and craftsmanship is stunning!");
    }
    if ($text=~/bracer/i) {
      quest::say("A pair of bracers shall be yours upon receipt of an ancient
tarnished plate bracer and three crushed flame emeralds. May your songs never
falter during a tactical retreat.");
    }
    if ($text=~/gauntlet/i) {
      quest::say("It would be a shame if your hands were to be injured and not be able to play your instruments wouldn't it? I shall craft some gauntlets so that your nimble digits remain intact. Bring me a pair of ancient tarnished plate gauntlets as well as three crushed topaz.");
    }
    if ($text=~/greaves/i) {
      quest::say("Some new greaves would do you some good. The pair you have now looks quite stained and worn. Nevermind, fetch me a pair of ancient tarnished plate greaves and three flawed sea sapphires.");
    }
    if ($text=~/boots/i) {
      quest::say("A fancy pair of boots you want is it? Yes, I can see the pair you have now looks a bit worn from running so much. All I require is a set of three crushed pieces of black marble and a pair of ancient tarnished plate boots.");
    }
  }
  else {
    quest::say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #requires ally Kromzek faction
    if (plugin::check_handin(\%itemcount, 25831 => 3, 24905 => 1)) { # cap
      quest::summonitem(25384);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24900 => 1)) { # bp
      quest::summonitem(25385);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24902 => 1)) { # sleeves
      quest::summonitem(25386);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24904 => 1)) { # wrist
      quest::summonitem(25387);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24906 => 1)) { # gloves
      quest::summonitem(25388);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24901 => 1)) { # legs
      quest::summonitem(25389);
      quest::exp(150000);
      quest::faction(179,20); # King Tormax
      quest::faction(189,20); # Kromzek
      quest::faction(42,-20); # Claws of Veeshan
      quest::faction(49,-60); # Coldain
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24903 => 1)) { # boots
      quest::summonitem(25390);
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

#END of FILE Zone: kael ID:113183 -- Bygloirn_Omorden

