################################### 
#Zone: Ak`Anon                    #
#Short Name: akanon               #       
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Eonis_Mournunder       #                             
#NPC ID: 55126                    #
#Quest Status: Complete           #                                      
###################################

sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Hail.");
  }
}

sub EVENT_ITEM { 
  if(plugin::check_handin(\%itemcount, 18771 => 1)) {
    quest::say("Thanks.");
    quest::summonitem(13524);
    quest::exp(100);
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}