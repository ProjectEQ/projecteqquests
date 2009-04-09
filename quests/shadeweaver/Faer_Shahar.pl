#Quest: Garbage Collecting

#NPC: Faer Shahar
#Zone: Shadeweaver's Thicket

sub EVENT_SAY {
  if($text=~/Hail/i){
quest::say("Greetings friend, please mind your [garbage]. They attract the hoppers who can be a danger to our young ones.");
  }
  if($text=~/garbage/i){
quest::say("Careless travelers from Shadow Haven leave their rubbish along our roads. They attract vermin and can smell just horrid. I try my best to keep the road clean, but it seems that I cannot keep up with the filth."); }
  }
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 30618 => 4)){
  quest::say("Thank you friend, you have done an excellent service for our city. Take this and may it help you on your endeavors.");
  quest::summonitem(17890);
  quest::exp(10000);
  quest::givecash(7,0,0,0); 
 }
}


#Revised by DeSelminator
 
#END of FILE Zone:shadeweaver  ID:165171 -- Faer_Shahar 
