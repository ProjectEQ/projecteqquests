# items: 8004
sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Have you been sent by the War Baron to [assist]? The explorers from Firiona Vie draw closer.");
 }
 elsif($text=~/assist/i){
  quest::say("That is good, I will stay here to halt any advances. Head out near the lake and destroy the trespassers on our land! Bring me four of their knives that they carry for survival. Prove your allegiance to the Legion of Cabilis.");
 }
}

sub EVENT_ITEM {
 #Handin: 4x Explorer Survival Knife (8004)
 if(plugin::check_handin(\%itemcount, 8004 => 4)){
  quest::say("Great work, the Legion of Cabilis will not soon forget your dedication. The trespassers shall all be dealt with.");
  quest::faction(441,10); # +Legion of Cabilis
  quest::faction(440,10); # +Cabilis Residents
  quest::faction(445,10); # +Scaled Mystics
  quest::faction(442,10); # +Crusaders of Greenmist
  quest::faction(444,10); # +Swifttails
  quest::exp(25);  
 }
  plugin::return_items(\%itemcount);
}

#Scripted By: Fatty Beerbelly
