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
  if ($text=~/hail/i) {
    quest::emote("smiles at you with a wide grin.");
    quest::say("You are quite brave to approach me and speak. On any other day, I would not give you the opportunity. Fortunately for you, I am preoccupied with my master's [quest].");
  }
  if ($text=~/quest/i) {
    quest::say("I have but a small task, to find the scribblings of Jarldyn. A Fier'Dal has stolen them. The scribblings will be illegible, but they must be returned to my master who has rightfully won them in battle. If you find them, bring them to me with an emerald plume and I will grant you an audience with my master. Be forewarned, it may be a one way trip.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12990 => 1, 12755 => 1)) { #Scribblings, Stoneleer Emerald Plume
    quest::say("Ha ha ha!! Fool! I have what I need. Now you are granted an audience with a noble sarnak lord, not my master. I am quite sure he shall do away with you. Ha ha ha!!");
    quest::exp(5000);
    quest::movepc(87,-4039,6280,-53); #Atheling Plague's Tower 
  }
  plugin::return_items(\%itemcount);
}