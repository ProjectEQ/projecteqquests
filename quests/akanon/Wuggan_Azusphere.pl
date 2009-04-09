################################### 
#Zone: Ak`Anon                    #                                              
#Short Name: akanon               #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Wuggan_Azusphere       #                             
#NPC ID: 55134                    #
#Quest Status: Complete           #                                      
###################################
sub EVENT_ITEM { 
if($itemcount{18772} == 1){
quest::say("Welcome to Library Mechanimagica.  I am Master Magician Wuggan Azusphere. and I will help to teach you the ways of summoning.  Here is our guild tunic. make us proud.");
quest::summonitem(13521);
quest::faction(91,1);
quest::faction(71,-2);
quest::faction(322,-2);
quest::faction(115,1);
quest::faction(176,1); }
}
 

