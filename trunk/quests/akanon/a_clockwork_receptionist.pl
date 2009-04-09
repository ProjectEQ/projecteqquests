################################### 
#Zone: Ak`Anon                    #                                              
#Short Name: akanon               #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name:a_clockwork_receptionist#                             
#NPC ID: 55087                    #
#Quest Status: Complete           #                                      
###################################
sub EVENT_SAY { 
if($text=~/where is king akanon/i){
quest::say("Brell strike you down for not knowing!!  Who could not have heard of the name of his royal highness King Horatio Ak'Anon. This great city is named after him. He rules from his throne room in Ak'Anon Palace which he constructed upon the underground lake."); }
}
 


