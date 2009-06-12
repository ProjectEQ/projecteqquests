#Merged from Not_Found.pl

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 2876 => 1)) {
    quest::summonitem(12000);
    quest::givecash(6,6,4,0); #Gold x 4, Silver x 6, Copper x 6
    #quest::faction(0,5); #Need faction
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:sharvahl  ID:Not_Found -- #Delival