sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail and well met. $name!  Have you come to study. or can you [perform a task] for me this day?");
}
if($text=~/i can perform a task/i){
quest::say("That is the spirit.  There are many black wolves wandering Faydark these days.  One of my brethren needs a black wolf skin as a component for his magic.  Bring me a black wolf skin. and I shall reward you for your efforts."); 
}
 }

sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount,13758=>1))
  {
    quest::say("Ah yes.  This is exactly what I need.  Thank you very much.");
    quest::summonitem(quest::ChooseRandom(7007,13009,58094,59964,6012));
    quest::faction(170,2);
    quest::faction(178,2);
    quest::faction(99,2);
    quest::faction(322,-4);
    quest::ding();
    quest::exp(350);
  }
  if (plugin::check_handin(\%itemcount,18779=>1)) {
    quest::summonitem(13542);
    quest::ding();
    quest::exp(350);
  }
else {
plugin::return_items(\%itemcount); # return unused items
 }
}
#END of FILE Zone:felwitheb  ID:62019 -- Tarker_Blazetoss 

