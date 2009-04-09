################################### 
#Zone: Burning Woods              #                                              
#Short Name: burningwood          #                                                                  
#Zone ID: 87                      #                                        
###################################                                             
#NPC Name: Entalon                #                             
#NPC ID: 87143,87146              #
#Quest Status: Complete           #                                      
###################################
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You are quite brave to approach me and speak. On any other day, I would not give you the opportunity. Fortunately for you, I am preoccupied with my master's [quest].");
}
if($text=~/quest/i){
quest::say("I have but a small task, to find the scribblings of Jarldyn. A Fier'Dal has stolen them. The scribblings will be illegible, but they must be returned to my master who has rightfully won them in battle. If you find them, bring them to me with an emerald plume and I will grant you an audience with my master. Be forewarned, it may be a one way trip.");
}
}

