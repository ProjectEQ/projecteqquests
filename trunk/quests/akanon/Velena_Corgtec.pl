################################### 
#Zone: Ak`Anon                    #                                              
#Short Name: akanon               #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Velena_Corgtec         #                             
#NPC ID: 55119                    #                                      
###################################
sub EVENT_SAY { 
if ($text=~/Hail/i){
quest::say("Hail."); }
}
sub EVENT_ITEM { 
if ($item1=="18704"){
quest::say("Thanks.");
quest::summonitem(13524);
quest::exp(100); }
}
 

