################################### 
#Zone: All (Global)               #                                              
#Short Name:                      #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: a_female_rat           #                             
#NPC ID: 56103,56082              #
#Quest Status: Complete           #                                      
###################################
sub EVENT_ITEM {
  if($item1=="10262"){
    quest::summonitem(10263);
    quest::emote("injests the virulent substance and becomes ill.");
    quest::exp(200);
  }
}