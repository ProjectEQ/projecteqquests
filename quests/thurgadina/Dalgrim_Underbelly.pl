#Zone: Thurgadin
#Short Name: thurgadina
#Zone ID: 115
#
#NPC Name: Dalgrim Underbelly
#NPC ID: 115146 115214

sub EVENT_SAY {
  if ($faction <= 3) {
    if ($text=~/hail/i) {
      quest::say("I wasn't always just a merchant, ye know, I used to work at the temple and spent most of my time in the study of ancient texts and arts. I actually learned a lot about the dark arts in those days. Ye know... necromancy. Oh, I'd never touch the stuff, mind ye, but I'll bet I could make a fine set of plate fer shadowknights if'n I had the right materials.");
    }
    if ($text=~/right materials/i) {
      quest::say("Glad to see ye're interested, $name. The materials would vary by the piece of armor o' course. I could probably forge a fine set of bracers, gauntlets, greaves, boots, armplates, a helm, or a breastplate.");
    }
    if ($text=~/helm/i) {
      quest::say("To create a piece of armor to protect your skull I will require three pieces of crushed coral as well as a corroded plate helmet.");
    }
    if ($text=~/breastplate/i) {
      quest::say("For the breastplate, I will need a corroded breastplate and three flawless diamonds. Once I have them in my possession it will not take long to craft a sturdy breastplate.");
    }
    if ($text=~/armplate/i) {
      quest::say("Protection for your arms will come at the price of a set of corroded plate vambraces and three flawed emeralds.");
    }
    if ($text=~/bracer/i) {
      quest::say("For the bracers, I will require a corroded plate bracer and a set of three crushed flame emeralds. Return to me if you happen to find these things in your travels.");
    }
    if ($text=~/gauntlet/i) {
      quest::say("Protecting your hands is very important. I can forge protection for your hands if you bring me a pair of corroded plate gauntlets and three crushed topaz.");
    }
    if ($text=~/greaves/i) {
      quest::say("A set of corroded greaves might be salvageable if you were to find three flawed sea sapphires. With the right techniques almost anything is possible.");
    }
    if ($text=~/boots/i) {
      quest::say("Boots made for battle are not always the most comfortable available. However, if you seek a fine set for battle bring me a set of corroded plate boots and three pieces of crushed black marble.");
    }
  }
  else {
    quest::say("I do not know you well enough to entrust you with such a quest, yet.");
  }  
}

sub EVENT_ITEM {
  if ($faction <= 3) {
    if (plugin::check_handin(\%itemcount, 25831 => 3, 24933 => 1)) { # cap
      quest::summonitem(31000);
      quest::exp(100000);
      quest::faction(49,20); # coldain
      quest::faction(67,20); # Dain Frostreaver IV
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24928 => 1)) { # bp
      quest::summonitem(31001);
      quest::exp(100000);
      quest::faction(49,20); # coldain
      quest::faction(67,20); # Dain Frostreaver IV
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24930 => 1)) { # sleeves
      quest::summonitem(31002);
      quest::exp(100000);
      quest::faction(49,20); # coldain
      quest::faction(67,20); # Dain Frostreaver IV
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24932 => 1)) { # wrist
      quest::summonitem(31003);
      quest::exp(100000);
      quest::faction(49,20); # coldain
      quest::faction(67,20); # Dain Frostreaver IV
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24934 => 1)) { # gloves
      quest::summonitem(31004);
      quest::exp(100000);
      quest::faction(49,20); # coldain
      quest::faction(67,20); # Dain Frostreaver IV
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24929 => 1)) { # legs
      quest::summonitem(31005);
      quest::exp(100000);
      quest::faction(49,20); # coldain
      quest::faction(67,20); # Dain Frostreaver IV
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24931 => 1)) { # boots
      quest::summonitem(31006);
      quest::exp(100000);
      quest::faction(49,20); # coldain
      quest::faction(67,20); # Dain Frostreaver IV
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
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

#END of FILE Zone: thurgadina  ID:115146 -- Dalgrim_Underbelly

