###################################
#Zone: Ak`Anon                    #
#Short Name: akanon               #
#Zone ID: 55                      #
###################################
#NPC Name: Juline_Urncaller       #
#NPC ID: 55132                    #
#Quest Status: Complete           #
###################################

sub EVENT_SAY { 
  if ($text=~/hail/i) {
    quest::say("Hail.");
  }
}

sub EVENT_ITEM { 
  if(plugin::check_handin(\%itemcount, 18773 => 1)) {
    quest::say("Thanks.");
    quest::summonitem(13522);
    quest::exp(100);
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}