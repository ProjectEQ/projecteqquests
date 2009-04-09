sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings $name. If you're looking to sell a tan horse, I'll be happy to give you a fair price.  If you've got a different color horse you'd like to sell talk to one of my brothers."); }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,21800=> 1)){
    quest::summonitem(21820);
}
  elsif(plugin::check_handin(\%itemcount,21801=> 1)){
    quest::summonitem(21821);
}
  elsif(plugin::check_handin(\%itemcount,21802=> 1)){
    quest::summonitem(21822);
}
  elsif(plugin::check_handin(\%itemcount,21803=> 1)){
    quest::summonitem(21823);
}
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:bazaar  ID:151008 -- Hiklo_Amondson 

