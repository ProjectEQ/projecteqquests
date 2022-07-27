#Zone: Thurgadin
#Short Name: thurgadin
#Zone ID: 115
#
#NPC Name: Argash
#NPC ID: 115166
# items: 25831, 24940, 31014, 25814, 24935, 31015, 25821, 24937, 31016, 25838, 24939, 31017, 25832, 24941, 31018, 25825, 24936, 31019, 25833, 24938, 31020

sub EVENT_SAY {
  if ($faction <= 3) {
    if ($text=~/hail/i) {
      quest::say("Greetin's, $name, you look like a $race who knows the value of a good bow when ye see one. I'll let ye in on a li'l secret, the bow is the greatest of all weapons as it allows you to inflict maximum punishment on yer foes with minimum risk. How can ye possibly go wrong? Or better yet, if'n ye be a ranger, I can see my way clear to making you a coif, tunic, sleeves, bracer, gauntlets, leggings, or boots that I'm sure ye would enjoy.");
    }
    if ($text=~/coif/i) {
      quest::say("To create a piece of armor to protect your sensitive skull. I will require three pieces of crushed coral as well as a corroded chain coif.");
    }
    if ($text=~/tunic/i) {
      quest::say("To forge a spectacular chain tunic I will require three flawless diamonds and a corroded chain tunic.  With the gems and my skills I may be able to draw out some of its magical powers.");
    }
    if ($text=~/sleeves/i) {
      quest::say("Protection for your arms will come at the price of three flawed emeralds and a set of corroded chain sleeves.");
    }
    if ($text=~/bracer/i) {
      quest::say("For the bracers, I will require a corroded chain bracer as well as three crushed flame emeralds.  Return to me when you find such things, $name.");
    }
    if ($text=~/gauntlets/i) {
      quest::say("Protecting your hands is very important.  I can forge protection for your hands if you bring me a pair of corroded chain gauntlets and three crushed topaz.");
    }
    if ($text=~/leggings/i) {
      quest::say("A set of corroded chain leggings might be salvageable if you were to find three flawed sea sapphires.  With the right techniques and ingredients almost anything is possible.");
    }
    if ($text=~/boots/i) {
      quest::say("We use our feet so often, should not they be protected as well as any other portion of our bodies?  If you seek fine protection for your feet, return to me with three pieces of crushed black marble and a set of corroded chain boots.");
    }
  }
  else {
    quest::say("I do not know you well enough to entrust you with such a quest, yet.");
  }
}

sub EVENT_ITEM {
  if ($faction <= 3) {
    if (plugin::check_handin(\%itemcount, 25831 => 3, 24940 => 1)) { # cap
      quest::summonitem(31014); # Item: Runed Scout's Helm
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24935 => 1)) { # bp
      quest::summonitem(31015); # Item: Runed Scout's Breastplate
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24937 => 1)) { # sleeves
      quest::summonitem(31016); # Item: Runed Scout's Vambraces
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24939 => 1)) { # wrist
      quest::summonitem(31017); # Item: Runed Scout's Bracer
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24941 => 1)) { # gloves
      quest::summonitem(31018); # Item: Runed Scout's Gauntlets
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24936 => 1)) { # legs
      quest::summonitem(31019); # Item: Runed Scout's Greaves
      quest::exp(100000);
      quest::faction(406,20); # coldain
      quest::faction(405,20); # Dain Frostreaver IV
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24938 => 1)) { # boots
      quest::summonitem(31020); # Item: Runed Scout's Boots
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
      quest::say("These are not the pieces I need.");
    }
  }
  else {
    quest::say("I do not know you well enough to entrust you with such an item, yet.");
  }
}

#END of FILE Zone: thurgadina  ID:115166 -- Argash

