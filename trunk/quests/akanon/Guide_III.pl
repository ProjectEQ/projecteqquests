################################### 
#Zone: Ak`Anon                    #                                              
#Short Name: akanon               #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Guide_III              #                             
#NPC ID: 55032                    #                                      
###################################
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings, lost soul. I am a guide.. automaton series G. I can assist you by leading you to all the important destinations in Ak'Anon. All you need to do is ask 'where' and state a valid destination. ..Bzzz.. Click!"); }
}
 

