#Zone: Thurgadin
#Short Name: thurgadina
#Zone ID: 115
#
#NPC Name: Battlepriest Daragor
#NPC ID: 115033
# items: 25831, 24933, 31021, 25814, 24928, 31022, 25821, 24930, 31023, 25838, 24932, 31024, 25832, 24934, 31025, 25825, 24929, 31026, 25833, 24931, 31027

sub EVENT_SAY {
  if ($faction <= 3) {
    if ($text=~/hail/i) {
      quest::say("Greetings to you. I seek the service of devout knights who have distinguished themselves. Are you a paladin, $name?");
    }
    if ($text=~/i am a paladin/i) {
      quest::say("A paladin of your kind has not made it this far for quite some time. Well, I wonder what it is you seek here? Do you seek heroic and chivalrous deeds to distinguish yourself from your brethren? Do you need accoutrements to aid you in your battles perhaps? You are in luck, knight, for I have both for you. Do you wish to partake of my quests?");
    }
    if ($text=~/partake of your quests/i) {
      quest::say("Excellent! By serving my cause, you, in turn, will further your own. I require certain components and if you bring them to me I shall reward you for your honorable service. You may choose from among these items: a helm, a breastplate, armplates, bracers, gauntlets, greaves, and boots.");
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
      quest::summonitem(31021); # Item: Runed Protector's Helm
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24928 => 1)) { # bp
      quest::summonitem(31022); # Item: Runed Protector's Breastplate
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24930 => 1)) { # sleeves
      quest::summonitem(31023); # Item: Runed Protector's Vambraces
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24932 => 1)) { # wrist
      quest::summonitem(31024); # Item: Runed Protector's Bracer
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24934 => 1)) { # gloves
      quest::summonitem(31025); # Item: Runed Protector's Gauntlets
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24929 => 1)) { # legs
      quest::summonitem(31026); # Item: Runed Protector's Greaves
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24931 => 1)) { # boots
      quest::summonitem(31027); # Item: Runed Protector's Boots
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
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

#END of FILE Zone: thurgadina  ID:115033 -- Battlepriest_Daragor

