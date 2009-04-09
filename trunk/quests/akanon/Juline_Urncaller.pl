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
if ($text=~/Hail/i){
quest::say("Hail."); }
}
sub EVENT_ITEM { 
if($item1=="18773"){
quest::say("Thanks.");
quest::summonitem(13522);
quest::exp(100); }
} 



