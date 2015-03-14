sub EVENT_SAY {
  if($text=~/hail/i){
   quest::emote("look's upon you smugly.");
   quest::say("And what are you, some sort of adventurer? Bah!! You will be shaken by the first undead you come across. Wetting your pant's you shall be. Ha Ha!! I doubt you could even [kill the decaying skeletons]!");
  }
  #Bone Chips (fieldofbone)(START)
  if($text=~/kill the decaying skeletons/i){
   quest::say("You kill skeletons?!! I think not!! They will bounce you with no trouble at all. Ten silvers says you cannot collect four bone chips!! When Velious melts!! Hah!");
 }
}

sub EVENT_ITEM {
  #Handin: 4x Bone chips
  if(plugin::check_handin(\%itemcount, 13073 => 4)){
   #Bone Chips (fieldofbone)(END)
   quest::emote("gasp's in astonishment.");
   quest::say("Wha...? This!! But... I... Why you... I oughta.. All right!! A bet is a bet. Here you go. A few silver piece's for your achievement. What?!! You thought I would give you ten? Fat chance! Now get lost or I will haul you in for impersonating a froglok.");
   quest::faction(193,15); # +Legion of Cabilis
   quest::faction(30,15);  # +Cabilis Residents
   quest::faction(282,15); # +Scaled Mystics
   quest::faction(62,15);  # +Crusaders of Greenmist
   quest::faction(317,15); # +Swifttails
   my $a = quest::ChooseRandom(1,2,3,4,5,6,7);
   quest::givecash(0,$a,0,0);
   quest::exp(500);
  } 
  plugin::return_items(\%itemcount);
}


#EOF