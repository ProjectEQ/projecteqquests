###################################
#Zone: Ak`Anon                    #
#Short Name: akanon               #
#Zone ID: 55                      #
###################################
#NPC Name: Vaenor_Husga           #
#NPC ID: 55123                    #
###################################

sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Hail.");
  }
}

sub EVENT_ITEM { 
  if(plugin::check_handin(\%itemcount, 18702 => 1)) {
    quest::faction(71,3);
    quest::say("Thank you. Here is your Robe. Wear it proudly.");
    quest::summonitem(13524);
    quest::exp(100);
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}