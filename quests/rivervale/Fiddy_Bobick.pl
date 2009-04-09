#############
  #Quest Name:The Fishslayers
  #Author:Shaznito
  #NPCs Involved:Fiddy Bobick, Marshall Lanena
  #Items Involved:Bag of Piranha Teeth, Piranha Bag, Piranha Tooth
  #################
  
  sub EVENT_SAY { 
  
  if($text=~/Hail/i){
  
  quest::say("Ahoy. mate!! The name's Fiddy Bobick! Perhaps you've heard of me.. the greatest halfling to sail the seas of Norrath? I have been to the North. South. East and West. and thank Prexus. I have survived it all!  Why I have returned to this little hollow is a wonder to me. Obviously. the salty air finally got to my brain!");
    } 
  if($text=~/marshall lanena sent me/i){
  
  quest::say("Well. it's about blasted time!  The ship was about to sink.  Wickystick finally managed to send the troops in!  The problem. mate. is piranha !!  What?!!  That's what I said.  Piranha!  The lake is infested with the little buggers.  More and more every sunrise.  They're chomping down all our food supply.  You have gotta get your can in the drink and kill them.  Take one of their teeth to old Wickystick and see what she has to say about Fiddy then!  I will also give you some booty for any teeth you pull out of this river.  Well. get going. Deputy $name!");  
 }
  }
  
  
  sub EVENT_ITEM {
  
  if(plugin::check_handin(\%itemcount, 13870 => 1)){ 
   quest::say("Whew!! We are sure on the way to saving this village, pal! They're gonna erect a statue in our names.  Fishslayers is what we are!  Let's keep up the good work!");
   quest::faction(218,5);
   quest::faction(77,5); 
   quest::faction(133,5);  
   quest::faction(208,5); 
   quest::faction(48,-5);
   quest::givecash(0,8,1,0);
   quest::exp(15);
   
  }
plugin::return_items(\%itemcount); # return unused items

   }
 #END of FILE Zone:rivervale  ID:19086 -- Fiddy_Bobick
