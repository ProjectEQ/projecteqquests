###################################
#Zone: Ak`Anon                    #
#Short Name: akanon               #
#Zone ID: 55                      #
###################################
#NPC Name: Velena_Corgtec         #
#NPC ID: 55119                    #
###################################

sub EVENT_SAY { 
  if ($text=~/hail/i) {
    quest::say("Hail.");
  }
}

sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 18704 => 1)) {
    quest::say("Thanks.");
    quest::summonitem(13524);
    quest::exp(100);
  }
  else {
    quest::say("I do not want this.");
    plugin::return_items(\%itemcount);
  }
}