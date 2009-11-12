###############################################
# NPC:  Captain Tillin
# Zone:  qeynos
# Author:  Andrew80k, and others.
###############################################

sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Hail, $name! Spend your time wisely in the city of Qeynos. Do not let your mind wander to thoughts of bravado or crime. My guards can easily put to rest any outbreaks. Good day to you, citizen!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13915 => 1)) { #Gnoll Fang
    quest::say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
    quest::summonitem(10070); #Moonstone
    quest::faction(135,1);
    quest::faction(9,1);
    quest::faction(53,-1);
    quest::faction(33,-1);
    quest::faction(217,1);
    quest::exp(500);
  }
  elsif(plugin::check_handin(\%itemcount, 18811 => 1)) { #Tattered Note
    quest::say("I heard you were on your way. I have called for the state executioner. She should be on her way now. She will deal with our friend, McNeal Jocub. Thank you for your help, citizen.");
    quest::summonitem(13305); #Medal of Merit
    quest::faction(9,10);
    quest::faction(33,-10);
    quest::faction(53,-10);
    quest::faction(135,10);
    quest::faction(217,10);
    quest::givecash(int(rand(10)),int(rand(10)),int(rand(10)),int(rand(10)));
  }
  elsif(plugin::check_handin(\%itemcount, 18912 => 1)) {
    quest::say("So, an assassin has been sent to Qeynos! I shall have my guards keep an eye out for any suspicious looking visitors. As for you... you should speak with the Surefall Glade ambassador. Ambassador Gash is staying at the Lion's Mane Inn here in South Qeynos. Inform him that [an assassin has been sent to kill] him. Do not let the assassin near him!");
    quest::faction(9,10);
    quest::faction(33,-10);
    quest::faction(53,-10);
    quest::faction(135,10);
    quest::faction(217,10);
    quest::givecash(int(rand(10)),int(rand(10)),int(rand(10)),int(rand(10)));
    quest::spawn2(1138,0,0,-86.88,368.88,3.38,75.5);
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:qeynos  ID:1077 -- Captain_Tillin