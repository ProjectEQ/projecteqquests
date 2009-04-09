#Zone: Thurgadin
#Short Name: thurgadin
#Zone ID: 115
#
#NPC Name: Foreman Felspar
#NPC ID: 115087

sub EVENT_SAY {
  if ($faction <= 3) {
    if ($text=~/hail/i) {
      quest::say("Welcome to the Thurgadin Minin' Company, $race. As foreman it's my job to see that me lads are well trained and well cared fer. Unfortunately, we're not in too good shape right now. Ye see, it seems a new vein was struck recently and a bunch of unwelcome critters have come crawlin outta the works attackin' me lads. In order ta help combat this menace I've engineered a new set of armor for the miners, but need some raw materials to get them started.");
    }
    if ($text=~/new set of armor/i) {
      quest::say("Excellent, $name! I knew ye were the right $race for the job. The pieces I can make are a coif, a tunic, sleeves, bracers, gauntlets, leggings, and boots. This stuff might not be fitting ya if ye're not stealthy like us miners though.");
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
      quest::summonitem(31028);
      quest::exp(100000);
      quest::faction(49,20); # coldain
      quest::faction(67,20); # Dain Frostreaver IV
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24935 => 1)) { # bp
      quest::summonitem(31029);
      quest::exp(100000);
      quest::faction(49,20); # coldain
      quest::faction(67,20); # Dain Frostreaver IV
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24937 => 1)) { # sleeves
      quest::summonitem(31030);
      quest::exp(100000);
      quest::faction(49,20); # coldain
      quest::faction(67,20); # Dain Frostreaver IV
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as she hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24939 => 1)) { # wrist
      quest::summonitem(31031);
      quest::exp(100000);
      quest::faction(49,20); # coldain
      quest::faction(67,20); # Dain Frostreaver IV
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24941 => 1)) { # gloves
      quest::summonitem(31032);
      quest::exp(100000);
      quest::faction(49,20); # coldain
      quest::faction(67,20); # Dain Frostreaver IV
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24936 => 1)) { # legs
      quest::summonitem(31033);
      quest::exp(100000);
      quest::faction(49,20); # coldain
      quest::faction(67,20); # Dain Frostreaver IV
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24938 => 1)) { # boots
      quest::summonitem(31034);
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

#END of FILE Zone: thurgadina  ID:115087 -- Foreman_Felspar

