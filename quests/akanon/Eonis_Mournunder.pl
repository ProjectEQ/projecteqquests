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
 if($text=~/Hail/i) {
	quest::say("Hail.");
 }
}
sub EVENT_ITEM { 
 if($item1=="18771"){
	quest::say("Thanks.");
	quest::summonitem(13524);
	quest::exp(100);
 }
}
 

