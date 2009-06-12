#############
#Quest Name:7 Armor Tasks given by Castlen Drewe
#Author: Domel
#NPCs Involved: 2 [Castlen Drewe(202294) and Audri Deepfacet(202069)]
#Items Involved: 1 Permafrost Crystals(22121)
#################


sub EVENT_SAY {
   
      if ($text=~ /Hail/i){
         quest::say("Greetings and welcome. I have been compiling reports from all over Norrath! There are many odd jobs to be done by someone like you. Would you be interested in such a [quest]?");  
	  }
      if ($text=~ /quest/i){
	     quest::enabletask(130,131,132,133,134,135,136);
		 quest::tasksetselector(10);
      }
      
   
   
}

#END of FILE Zone:poknowledge  ID:202294 -- Castlen_Drewe