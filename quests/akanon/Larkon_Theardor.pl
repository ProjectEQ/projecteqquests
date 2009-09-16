###################################
#Zone: Ak`Anon                    #                                             
#Short Name: akanon               #
#Zone ID: 55                      #
###################################
#NPC Name: Larkon_Theardor        #
#NPC ID: 55056                    #
#Quest Status: Complete           #
###################################

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings! Welcome to the Library of Mechanimagica. You must be a [current member of the Library] or has my [mind begun to slip]?");
  }
  if($text=~/mind/i) {
    quest::say("What!!? That was but a joke. I try to make you feel comfortable with a little levity and you proclaim my mind has gone the way of Meldrath's. Well.. enough frivolity. You will do your part to help in the menial tasks of the Collective. Do you want the [clean tasks] or the [dirty tasks]?");
  }
  if($text=~/tasks/i) {
    quest::say("Clean.. Dirty.. It matters not. You have upset me with your rude remarks. You will go to the Steamfont Mountains. There you will find Fodin and tell him I have sent you. He will have a nice tidy task for you. A bath!! Be on your way!");
  }
  if($text=~/current member of the library/i) {
    quest::say("Good. The last thing a member of the Eldritch Collective needs is to lose his mind. Look what happened to Meldrath. Enough chitchat. I am Larkon and it is not my job to teach you. It is my job to direct you to service. We require items and such to complete our studies. We need someone of moderate skill to [gather minotaur horns] and [collect basilisk tongues].");
  }
  if($text=~/gather minotaur horns/i) {
    quest::say("We magicians require the horns of minotaurs. We crush them down and use the powder in many of our tests. Go and fetch two minotaur horns. Do not return empty-handed. I await your return as does your reward.");
  }
  if($text=~/basilisk tongues/i) {
    quest::say("Very good of you. Go beyond the land of the gnomes and seek out basilisks. Return four of their tongues to me and I shall share the knowledge of the magicians of the Eldritch Collective.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13077 => 2)){ #Minotaur Horn x 2
    quest::say("Fine work. You have earned the respect of the Library. Here is a small token of our appreciation. We shall have this ground down as soon as we find someone to go to Kaladim.");
    quest::exp(100);
    quest::faction(91,10); #eldritch collective
    quest::faction(115,10); #gem choppers
    quest::faction(176,10); #king ak'anon
    quest::faction(71,-30); #Dark reflection
    quest::faction(322,-30); #the dead
    quest::givecash(6,1,2,0);
  }
  elsif(plugin::check_handin(\%itemcount, 13271 => 1)) { #Air Tight Box
    quest::say("Ah! See? you weren't too afraid to get your hands dirty after all. Now go take a bath!");
    quest::exp(100);
    quest::faction(91,10); #eldritch collective
    quest::faction(115,10); #gem choppers
    quest::faction(176,10); #king ak'anon
    quest::faction(71,-30); #Dark reflection
    quest::faction(322,-30); #the dead
    quest::givecash(6,1,2,0);
  }
  elsif(plugin::check_handin(\%itemcount, 12160 => 4)) { #Basilisk Tongue x 4
    quest::say("Very very good! I can use these in some of our experiments. These tongues are hard to come by and more than a few of our scouts have been turned to stone because of these creatures, but I'm sure you found that out by now, eh?");
    quest::exp(100);
    quest::summonitem(quest::ChooseRandom(15205,15211,15288,15310,15311,15313,15331,15050,15093,15315,15316,15058,15317,15318,15036,15094,15246,15322,15323,15325,15851,15324,15332,15400,15399,15398,15042,15613)); #mage lvl 1-8 spells excluding pet item spells
    quest::faction(91,10); #eldritch collective
    quest::faction(115,10); #gem choppers
    quest::faction(176,10); #king ak'anon
    quest::faction(71,-30); #Dark reflection
    quest::faction(322,-30); #the dead
    quest::givecash(6,1,5,1);
  }
  elsif(plugin::check_handin(\%itemcount, 13272 => 1)) { #Bozinite Pestle
    quest::say("Outstanding $name!! This should be of help to you.");
    quest::summonitem(quest::ChooseRandom(15205,15211,15288,15310,15311,15313,15331,15050,15093,15315,15316,15058,15317,15318,15036,15094,15246,15322,15323,15325,15851,15324,15332,15400,15399,15398,15042,15613)); #mage lvl 1-8 spells excluding pet item spells
    quest::givecash(6,1,5,1);
    quest::exp(100);
  }
  else {
    quest::say("I didn't ask you to bring me these.");
    plugin::return_items(\%itemcount);
  }
}