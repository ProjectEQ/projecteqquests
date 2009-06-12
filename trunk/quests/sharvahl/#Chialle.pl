#Merged from Not_Found.pl

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 30625 => 4)) {
    quest::summonitem(30609);
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:sharvahl  ID:Not_Found -- #Chialle