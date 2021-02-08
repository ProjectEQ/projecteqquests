# items: 12650, 18213, 17996, 12668, 12657
sub EVENT_SAY {
  if($text=~/hail/i){
   quest::say("There is little time for talk. There are plenty of [tiny invaders]. Do your part and exterminate as many as you can. All of Cabilis shall look favorably upon you in the long run.");
  }
  #Scorpion Pincers (START)
  if($text=~/tiny invaders/i){
   quest::say("The small scorpions have been turning up everywhere!! One can hardly sleep when thinking of the little monsters. Please crush as many as you can for the greater good. I will even pay a bounty for every four Scorpion Pincers you return.");
 }
}

sub EVENT_ITEM {
  #Handin: 4x Scorpion Pincers
  if(plugin::check_handin(\%itemcount, 12650 => 4)){
   #Scorpion Pincers (END)
   quest::say("Magnificent!! The more pincers I get the lesser scorpions there are. Here. Take the bounty.");
   quest::faction(441,3);  # +Legion of Cabilis
   quest::faction(440,1);   # +Cabilis Residents
   quest::faction(445,1);  # +Scaled Mystics
   quest::faction(442,1);   # +Crusaders of Greenmist
   quest::faction(444,1);  # +Swifttails
   quest::givecash(4,2,0,0);
   quest::exp(2500);  
  }
  
  if (plugin::check_handin(\%itemcount, 18213 =>1 )) {
    quest::say("Ah!! Good to have you on board. We lack strong young recruits such as yourself. Take this box. Your task is to seek milita skeletons near this gate. Apparently, someone or something has been raising militia corpses and they now walk the land not knowing the difference between friend or foe. They even continue using their old call, 'Halt Who goes there?'. Fill and combine within the box their charred bone shards and return the filled box to me for your geozite tool.");
    quest::summonitem(17996); # Item: Charred Bone Box
  }
  
  if (plugin::check_handin(\%itemcount, 12668 =>1 )) {
    quest::say("Great work!! You have helped keep the gate safe. I reward you with the geozite tool. You may find its purpose within Cabils' warriors guild. A true Iksar warrior should always have one.");  #text not from live
    quest::summonitem(12657); # Item: Geozite Tool
  }
  plugin::return_items(\%itemcount);
}


#EOF
